<div class="modal-content">
    <div class="modal-header">
        <button type="button" class="pull-right btn btn-default btn-danger btn-circle" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" id="myModalLabel"><i class="fa fa-edit"></i>&nbsp;Resolve Service Order</h4>
    </div>
    <form method="post">
        <div class="modal-body form-horizontal padding20">
            <div class="form-group">
                <span class="col-sm-12 itmms-label">EPR No.:</span>
                <div class="col-lg-12">
                    <input type="text" class="form-control" name="epr_no" id="epr_no" placeholder="Input EPR No.">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-12 itmms-label">Diagnose / Troubleshooting Report:</div>
                <div class="col-sm-12">
                    <textarea class="form-control" rows="5" name="action_taken" placeholder="Type here ..." id="action_taken"></textarea>
                </div>
            </div>

            <input type="hidden" name="ref_no" id="ref_no"/>
        </div>
        <div class="modal-footer modal-custom-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-primary">Resolve</button>
        </div>
    </form>
</div>
