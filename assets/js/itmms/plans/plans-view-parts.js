$( function( $ ) {

    const elements = $('.part-row').toArray();
    
    elements.map((element) => {
        const today = moment();
        const dateCreated = moment($(element).find('.date-created').val(), 'YYYY-MM-DD HH:mm:ss');
        const endDate = getEndDate($(element).find('.depreciation-value').val(), dateCreated);
        
        const total = endDate.diff(dateCreated);
        const current = endDate.diff(today);
        const healthPercentage = Math.floor((current/total) * 100);
        addHealthPercentage(element, healthPercentage)
        
        const date = dateCreated.clone();
        const seconds = total * 0.01;
        const data = [];
        const pointBackgroundColor = [];
        const pointBordergroundColor = []
        for(let i=100; i>=0; i--) {
            data.push({
                x: date.clone(),
                y: i
            });

            if(i > healthPercentage) {
                pointBackgroundColor.push('#D0D3D4');
            } else if (i == healthPercentage) {
                pointBackgroundColor.push('#CB4335');
            } else {
                pointBackgroundColor.push('rgba(46, 204, 113, 1)');
            }

            date.add(seconds, 'ms');
        }
        
        setLineChart($(element).find('canvas')[0].getContext('2d'), data, pointBackgroundColor, healthPercentage)
    });
});

function setLineChart(context, data, pointBackgroundColor, healthPercentage) {
    const backgroundColor = healthPercentage <= 20
                ? 'rgba(236, 112, 99, 0.1)' 
                : healthPercentage <= 30 
                ? 'rgba(245, 176, 65, 0.1)' : 'rgba(88, 214, 141, 0.1)';
    new Chart(context, {
        type: 'line',
        data: {
            datasets: [{
                label: 'Life span',
                pointBackgroundColor, 
                pointBordergroundColor: pointBackgroundColor,
                backgroundColor,
                data
            }]
        },

        // Configuration options go here
        options: {
            scales: {
                xAxes: [{
                    type: 'time',
                    time: {
                        unit: 'week'
                    },
                    gridLines: {
                        display: false,
                    },
                }]
            },
            legend: false
        }
    });


}

function addHealthPercentage(element, healthPercentage) {
    $(element).find('.panel-heading .value').text(healthPercentage + '%');
    if (healthPercentage <= 0) {
        $(element).find('.panel-heading .label').removeClass('label-success');
        $(element).find('.panel-heading .label').addClass('label-default');
        $(element).find('.panel-heading .value').text(0);
    } else if (healthPercentage <= 20) {
        $(element).find('.panel-heading .label').removeClass('label-success');
        $(element).find('.panel-heading .label').addClass('label-danger');
    } else if(healthPercentage <= 30) {
        $(element).find('.panel-heading .label').removeClass('label-success');
        $(element).find('.panel-heading .label').addClass('label-warning');
    }
} 

function getEndDate(date, dateCreated) {
    const [number, type] = date.split(' ');
    const endDate = dateCreated.clone();
    endDate.add(number, type.includes('month')? 'M' : 'y');
    return endDate;
}