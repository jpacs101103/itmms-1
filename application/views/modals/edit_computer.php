<div class="modal-content">
    <div class="modal-header">
        <button type="button" class="pull-right btn btn-default btn-danger btn-circle" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" id="myModalLabel"><i class="fa fa-edit"></i>&nbsp;Edit Device</h4>
    </div>
    <form method="post">
        <div class="modal-body form-horizontal">
            <div class="subtext" >
                Device Details
            </div>
            <div class="form-group">
                <div class="col-sm-12 itmms-label">Assigned Name: <i class="fa fa-lock fg-gray pull-right padding-right5"></i></div>
                <div class="col-lg-12">
                    <input type="text" class="form-control" name="computer_name" id="computer_name" placeholder="Input Assigned Name" readonly>
                </div>
            </div>
            <div class="form-group">
                <input type="hidden" name="computer_id" id="computer_id" />
                <div class="col-sm-12 itmms-label">Device Type: </div>
                <div class="col-lg-12">
                    <select class="form-control" name="computer_type" id="computer_type">
                        <option value="">Select Device Type</option>
                        <option value="branded">Branded</option>
                        <option value="cloned">Cloned</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12 itmms-label">Device Name:</div>
                <div class="col-lg-12">
                    <textarea class="form-control" rows="5" id="brand_clone_name" name="brand_clone_name" placeholder="Input Device Name"></textarea>
            </div>
            </div>
            <div class="subtext">
                Designation Details
            </div>
            <div class="form-group">
                <div class="col-sm-12 itmms-label">Assigned to <i>(<small>Person Responsible</small>)</i>:</div>
                <div class="col-sm-12">
                    <input type="text" class="form-control" name="assigned_to" id="assigned_to" placeholder="Input Assigned To">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12 itmms-label">Date Assigned:</div>
                <div class="col-lg-12">
                    <div class="inner-addon right-addon">
                        <i class="fa fa-calendar"></i>
                        <input type='text'
                               class="datepicker-here form-control"
                               id="date_assigned"
                               name="date_assigned"
                               readonly="readonly" />
                    </div>
                </div>
            </div>
            <input type="hidden" name="computer_id" id="computer_id" />
        </div>
        <div class="modal-footer modal-custom-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-primary">Update</button>
        </div>
    </form>
</div>
