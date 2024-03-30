<div class="row">
    <div class="col-lg-8 col-centered">
        <h1 class="itmms-page-header">
            <i class="fa fa-desktop fa-fw"></i>
                <?php echo  preg_replace('/[^a-zA-Z0-9]/', ' ', ucwords($method)) ?>
        </h1>
    </div>
</div>
<div class="col-lg-8 col-centered bordered">
	<form class="horizontal-form" method="POST" id="add_new_room" role="form">
        <table class="itmms-table">
            <tr>
                <td><legend class="padding10 itmms-title">Resource Details</legend></td>
            </tr>
            <tr>
            	<td>
            		<div class="form-group">
						<span class="col-sm-12 itmms-label">Resource Name:</span>
						<div class="col-lg-12">
							<input type="text" class="form-control" name="resource_name" id="resource_name" placeholder="Input Resource Name">
						</div>
				    </div>
            	</td>
            </tr>
            <tr>
            	<td>
            		<div class="form-group">
						<span class="col-sm-12 itmms-label">Resource Type:</span>
						<div class="col-lg-12">
                            <select class="form-control" name="resource_type" id="resource_type">
                                <option value="">Select Resource Type</option>
                                <option value="hardware">Hardware</option>
                                <option value="software">Software</option>
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
