$(function ($) {
    const elements = $(".part-row").toArray();

    var lineXPos = {};

    elements.map((element) => {
        const dateCreated = moment(
            $(element).find(".date-created").val(),
            "YYYY-MM-DD HH:mm:ss"
        );
        const endDate = getEndDate(
            $(element).find(".depreciation-value").val(),
            dateCreated
        );

        const total = endDate.diff(dateCreated);
        const healthPercentage = getHealthPercentage(endDate, dateCreated);

        addHealthPercentage(element, healthPercentage);

        const date = dateCreated.clone();
        const seconds = total * 0.01;

        const data = [];
        const pointBgColors = [];
        for (let i = 100; i >= 0; i--) {
            data.push({
                x: date.clone(),
                y: i,
            });

            if (i > healthPercentage) {
                pointBgColors.push("#D0D3D4");
            } else if (i == healthPercentage) {
                pointBgColors.push("#E4B524");
            } else {
                pointBgColors.push("rgba(46, 204, 113, 1)");
            }

            date.add(seconds, "ms");
        }

        const computerParts = $(element).find("canvas").data("replaced-parts");
        const plugins = computerParts
            ? [getReplacedPartsPlugin(computerParts)]
            : [];

        setLineChart(
            $(element).find("canvas")[0].getContext("2d"),
            data,
            pointBgColors,
            healthPercentage,
            plugins
        );

        $(element).removeClass('hidden');
    });

    function getReplacedPartsPlugin(computerParts) {
        const chartCanvas = $(".computer-set-chart");

        if (chartCanvas.length) {
            const drawVerticalLinePlugin = {
                id: "drawVerticalLinePlugin",
                afterDraw: (chart) => {
                    const ctx = chart.ctx;
                    const xScale = chart.scales.x; // Reference to your x-axis, which is configured as a time scale

                    computerParts.forEach(function (computerPart) {
                        const date = moment(computerPart.date_created);
                        const xPos = xScale.getPixelForValue(date);
                        lineXPos[computerPart.parts_name] = {
                            x: xPos,
                            computerPart,
                        };

                        ctx.save();
                        ctx.beginPath();
                        ctx.moveTo(xPos, chart.chartArea.top);
                        ctx.lineTo(xPos, chart.chartArea.bottom);
                        ctx.lineWidth = 1; // You can adjust the line width as desired
                        ctx.strokeStyle = "#E4B524"; // Change the color as needed
                        ctx.stroke();
                        ctx.restore();
                    });
                },
            };

            return drawVerticalLinePlugin;
        }

        return null;
    }

    function setLineChart(
        context,
        data,
        pointBgColor,
        healthPercentage,
        plugins = []
    ) {
        let backgroundColor = "rgba(88, 214, 141, 0.1)";
        if (healthPercentage <= 20) {
            backgroundColor = "rgba(236, 112, 99, 0.1)";
        } else if (healthPercentage <= 30) {
            backgroundColor = "rgba(245, 176, 65, 0.1)";
        }

        const chart = new Chart(context, {
            type: "line",
            data: {
                datasets: [
                    {
                        label: "Life span",
                        backgroundColor,
                        data,
                        pointBackgroundColor: pointBgColor,
                        pointBordergroundColor: pointBgColor,
                        tension: 0.1,
                    },
                ],
            },
            options: {
                onHover: (event, chartElements, chart) => {
                    const tooltip = $("#monitoring-chart-tooltip");
                    const tooltipElem = document.getElementById(
                        "monitoring-chart-tooltip"
                    );
                    const rect = chart.canvas.getBoundingClientRect();
                    const x = event.native.clientX - rect.left;

                    for (const key in lineXPos) {
                        const partPosition = lineXPos[key];

                        if (Math.abs(x - partPosition.x) <= 5) {
                            // 5px leeway for easier hovering
                            tooltipElem.style.display = "block";
                            tooltipElem.style.left = `${event.native.clientX}px`;
                            tooltipElem.style.top = `${event.native.clientY}px`;

                            const computerPart = partPosition.computerPart;
                            tooltip
                                .find(".part-name")
                                .text(computerPart.parts_name);
                            tooltip
                                .find(".date-added")
                                .text(
                                    moment(computerPart.date_created).format(
                                        "MMMM D, YYYY"
                                    )
                                );

                            break;
                        } else {
                            tooltipElem.style.display = "none";
                        }
                    }
                },
                title: {
                    display: false,
                },
                legend: {
                    display: false,
                },
                scales: {
                    x: {
                        type: "time",
                        time: {
                            unit: "week",
                        },
                        grid: {
                            display: false,
                        },
                    },
                },
            },
            plugins: plugins,
        });

        return chart;
    }

    function addHealthPercentage(element, healthPercentage) {
        const labelElement = $(element).find(".panel-heading .health");
        const valueElement = $(element).find(".panel-heading .health .value");

        valueElement.text(healthPercentage + "%");

        if (healthPercentage <= 0) {
            labelElement.removeClass("label-success").addClass("label-default");
            valueElement.text(0);
        } else if (healthPercentage <= 20) {
            labelElement.removeClass("label-success").addClass("label-danger");
        } else if (healthPercentage <= 30) {
            labelElement.removeClass("label-success").addClass("label-warning");
        }
    }

    function setReplacementDetails(element, healthPercentage) {
        const labelElement = $(element).find(".panel-heading .health");
        const valueElement = $(element).find(".panel-heading .health .value");

        valueElement.text(healthPercentage + "%");

        if (healthPercentage <= 0) {
            labelElement.removeClass("label-success").addClass("label-default");
            valueElement.text(0);
        } else if (healthPercentage <= 20) {
            labelElement.removeClass("label-success").addClass("label-danger");
        } else if (healthPercentage <= 30) {
            labelElement.removeClass("label-success").addClass("label-warning");
        }
    }
});
