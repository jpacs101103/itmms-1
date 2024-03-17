<div class="row">
    <div class="col-lg-8 col-centered">
        <h1 class="itmms-page-header">
            <i class="fa fa-user fa-fw"></i>
            <?php echo  preg_replace('/[^a-zA-Z0-9]/', ' ', ucwords($controller)) ?>
        </h1>
    </div>
</div>
<div class="row">
    <div class="col-lg-8 col-centered bordered">
        <form class="horizontal-form" method="POST" role="form">
            <table class="itmms-table">
                <tr>
                    <td><legend class="padding10 itmms-title">Login Details</legend></td>
                </tr>
                <tr>
                    <td>
                        <div class="form-group">
                            <div class="col-sm-12 itmms-label">Employee ID:</div>
                            <div class="col-sm-12">
                                <span class="input-group-addon group-custom bg-gold fg-maroon text-bold">CIT</span>
                                <input type="text" class="form-control input-group-custom no-arrow" name="emp_id" id="emp_id" placeholder="e.g. 143">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="form-group">
                            <div class="col-sm-12 itmms-label">User Type:</div>
                            <div class="col-lg-12">
                                <select class="form-control" name="user_type" id="user_type">
                                    <option value="">Select User Type</option>
                                    <option value="encoder">Encoder</option>
                                    <option value="viewer">Viewer</option>
                                </select>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><legend class="padding10 itmms-title">User Details</legend></td>
                </tr>
                <tr>
                    <td>
                        <div class="form-group">
                            <div class="col-sm-2 itmms-label">First Name:</div>
                            
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="firstname" id="firstname" placeholder="Input First Name">
                            </div>
                            <div class="col-sm-2 itmms-label">Last Name:</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="lastname" id="lastname" placeholder="Input Last Name">
                            </div>
                            <div class="col-sm-2 itmms-label">Email Address:</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="emailaddress" id="emailaddress" placeholder="Input Email Address">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="form-group">
                            <span class="col-sm-12 itmms-label">Cluster:</span>
                            <div class="col-lg-12">
                                <select name="cluster_id" id="cluster_id" class="form-control"></select>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="form-group">
                            <div class="col-sm-12 itmms-label">Contact No.:</div>
                            <div class="col-lg-12">
                                <input type="text" class="form-control" name="contact_no" id="contact_no" placeholder="Input Contact No.">
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
</div>