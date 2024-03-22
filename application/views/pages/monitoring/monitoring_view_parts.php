<div class="hide-this">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="itmms-page-header">
                <?= $computer->computer_name; ?>
            </h1>
        </div>
    </div>
    <hr/>

    <?php foreach ($query as $row) : ?>
        <div class="row part-row">
            <div class="col-lg-12">
                <div class="panel panel-info">
                    <input type="hidden" class="depreciation-value" value="<?= $row->depreciation_value ?>" />
                    <input type="hidden" class="date-created" value="<?= $row->date_created ?>" />

                    <div class="panel-heading">
                        <b><?= $row->parts_name; ?></b>
                        <span class="label label-success">Health: <span class="value"></span></span>
                    </div>
                    <div class="panel-body">
                        <canvas class="line-chart" height="70"></canvas>
                    </div>
                </div>
            </div>
        </div>
    <?php endforeach; ?>

</div>