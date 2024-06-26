<div class="row">
    <div class="col-lg-12">
        <h1 class="itmms-page-header">
            <i class="fa fa-desktop fa-fw"></i>
            <?php echo  preg_replace('/[^a-zA-Z0-9]/', ' ', ucwords($method)) ?>
        </h1>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="dataTable_wrapper">
                    <table class="table table-hover table-bordered width100" id="computer-list">
                        <thead>
                            <tr>
                                <th class="text-center" data-priority="1">ID</th>
                                <th data-priority="3">Assigned Name</th>
                                <th>Device Type</th>
                                <th>Device Name</th>
                                <th>Designation</th>
                                <th>Assigned To</th>
                                <!-- <th>Date Assigned</th> -->
                                <th class="text-center" data-priority="2"><i class="fa fa-wrench fa-fw"></i></th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
