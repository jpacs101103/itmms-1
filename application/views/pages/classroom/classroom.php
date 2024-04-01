<div class="row">
	<div class="col-lg-8 col-centered">
		<h1 class="itmms-page-header">
			<i class="fa fa-university fa-fw"></i>
			Room
		</h1>
	</div>
</div>
<div class="col-lg-8 col-centered bordered">
	<form class="horizontal-form" method="POST" id="add_new_room" role="form">
		<table class="itmms-table">
			<tr>
				<td>
					<legend class="padding10 itmms-title">Room Details</legend>
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-group">
						<span class="col-sm-12 itmms-label">Department/Office:</span>
						<div class="col-lg-12">
							<select class="form-control" name="cluster_id" id="cluster_id"></select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-group">
						<span class="col-sm-12 itmms-label">Room No.:</span>
						<div class="col-lg-12">
							<input type="text" class="form-control" name="room_no" id="room_no" placeholder="e.g. ST101">
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-group">
						<span class="col-sm-12 itmms-label">Classroom Type:</span>
						<div class="col-lg-12">
							<select class="form-control" name="classroom_type" id="classroom_type">
								<option value="">Select Classroom Type</option>
								<option value="lecture">Lecture</option>
								<option value="laboratory">Laboratory</option>
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
