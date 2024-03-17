<div class="row">
    <div class="col-lg-8 col-centered">
       <h1 class="itmms-page-header">
            <i class="fa fa-location-arrow fa-fw"></i>
                <?php echo  preg_replace('/[^a-zA-Z0-9]/', ' ', ucwords($controller)) ?>
        </h1>
    </div>
</div>
<div class="col-lg-8 col-centered bordered">
	<form class="horizontal-form" method="POST" id="add_new_department" role="form">
        <table class="itmms-table">
            <tr>
                <td><legend class="padding10 itmms-title">Department/office Details</legend></td>
            </tr>
            <tr>
                <td>
                    <div class="form-group">
                        <span class="col-sm-12 itmms-label">Building</span>
                        <div class="col-lg-12">
                            <input type="text" class="form-control" name="room_no" id="room_no" placeholder="e.g. NGE Building" />
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
            	<td>
            		<div class="form-group">
						<span class="col-sm-12 itmms-label">Department/office Code:</span>
						<div class="col-lg-12">
							<input type="text" class="form-control" name="cluster_code" id="cluster_code" placeholder="code">
						</div>
				    </div>
            	</td>
            </tr>
            <tr>
            	<td>
            		<div class="form-group">
						<span class="col-sm-12 itmms-label">Department/office Name:</span>
						<div class="col-lg-12">
							<input type="text" class="form-control" name="cluster_name" id="cluster_name" placeholder="Name">
						</div>
					</div>
            	</td>
            </tr>
            <tr>
                <td>
                    <div class="form-group">
                        <span class="col-sm-12 itmms-label">Type:</span>
                        <div class="col-lg-12">
                            <select class="form-control" name="type" id="type">
                                <option value="">Select Type</option>
                                <option value="department">Department</option>
                                <option value="office">Office</option>
                            </select>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
            	<td>
            		<div class="form-group">
            			<div class="col-lg-12">
							<button type="submit" class="btn btn-primary pull-right">Submit</button>
				    	</div>
				    </div>
            	</td>
            </tr>
        </table>
	</form>
</div>
