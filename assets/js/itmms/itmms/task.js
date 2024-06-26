$( function( $ ) {
    var obj = {};

    init();

    obj.loader = '<img src="assets/images/loader/loader.gif" class="loader" />';
    obj.status = $('.active[data-role="status"]').text().toLowerCase();
    obj.user_name = $('#user_name').text();

    $('[data-role="status"]').click(function(e){
        $(this).addClass('active').siblings().removeClass('active');

        const activeStatus = $('.active[data-role="status"]');
        obj.status = activeStatus.data('value') || activeStatus.text().toLowerCase();
        obj.user_task_list.ajax.reload();
    });

    $( document ).on( 'click', '[data-bind]', function(e){
        e.preventDefault();

        var url = $( this ).data( 'bind' ),
            ref_no = $( this ).data( 'id' ),
            computer_name = $( this ).data( 'computer-name' ),
            cluster_id = $( this ).data( 'cluster-id' ),
            complaint_type = $( this ).data( 'complaint-type' ),
            part_name = $( this ).data( 'part-name' ),
            method = $( this ).data( 'method' );

        if(method == 'print') {
            obj.print_service_order_form(ref_no);
        }
        else {
            load_modal({
                url,
                ref_no,
                computer_name,
                cluster_id,
                complaint_type,
                part_name,
                method,
              });
        }
    } );

    $( document ).on( 'click', '#small [type="submit"]', function(e){
        e.preventDefault();
        var $small_modal = $('#small');

        switch(obj.method){
            case 'void' :
                obj.ajax_mark_void_service_order_by_id( $small_modal );
                break;
            case 're_open' :
                obj.ajax_mark_open_service_order_by_id( $small_modal );
                break;
        }
    } );

    obj.user_task_list = $('#user-tasks').DataTable({
        'processing': true,
        'serverSide': true,
        'responsive': true,
        'ajax': {
            'url' : 'ajax_user/get_task_details_for_table',
            'data': function ( d ) {
                d.status = obj.status;
                d.user_type = $('#user_type').text();
            }
        },
        'deferRender': true,
        'order': [[0, 'asc']],
        'columns': [
            { 'data': 'ref_no', 'sClass': 'text-center' },
            { 'data': 'computer_name' },
            { 'data': 'complaint_type', 'sClass': 'caps' },
            { 'data': 'complaint' },
            { 'data': 'complaint_details', 'width': '30%' },
            { 'data': 'assigned_to' },
            { 'data': 'datetime_reported' },
            { 'data': 'actions' },
        ],
        'columnDefs': [
            {
                'data': 'actions',
                'targets': -1,
                'sortable': false,
                'render' : function ( data, type, row ) {
                    var html = ' \
                        <div class="text-center"> \
                            <div class="btn-group"> \
                                <button type="button" class="btn btn-default btn-xs dropdown-toggle btn-itmms" data-toggle="dropdown"> \
                                    <i class="fa fa-chevron-down fa-fw"></i> \
                                </button> \
                                <ul class="dropdown-menu pull-right" role="menu"  style="padding: 0 0 7px 0"> \
                                    <li> \
                                        <span class="dropdown-title text-center">Action Bar</span> \
                                    </li> \
                                    <li> \
                                        <a href="javascript:void(0)" data-method="view" data-bind="view_service_order" data-id="' + row.ref_no + '"><i class="fa fa fa-external-link fa-fw fg-cyan"></i> View Details</a> \
                                    </li> ';
                                    if(obj.status === 'received' || obj.status === 'urgent') {
                                        html += '<li class="visible-lg"> \
                                            <a href="javascript:void(0)" data-method="print" data-bind="print_service_order_form" data-id="' + row.ref_no + '" id="print_service_order_form"><i class="fa fa-print fa-fw"></i> Print Form</a> \
                                        </li> \
                                        <li> \
                                            <a href="javascript:void(0)" data-method="service_done" data-bind="service_done_form" data-id="' + row.ref_no + '"><i class="fa fa-check-square-o fa-fw fg-orange"></i> Service Done</a> \
                                        </li> \
                                        <li> \
                                            <a href="javascript:void(0)" data-method="designate" data-bind="designate_to" data-id="' + row.ref_no + '" data-computer-name="' + row.computer_name + '"><i class="fa fa-hand-o-right fa-fw fg-brown"></i> Designate</a> \
                                        </li> \
                                        <li> \
                                            <a href="javascript:void(0)" data-method="edit" data-bind="edit_service_order" data-id="' + row.ref_no + '" data-cluster-id = "'+ row.cluster_id +'" data-complaint-type="' + row.complaint_type + '"><i class="fa fa-edit fa-fw fg-yellow"></i> Edit Entry</a> \
                                        </li> \
                                        <li> \
                                            <a href="javascript:void(0)" data-method="void" data-bind="confirmation" data-id="' + row.ref_no + '" data-computer-name="' + row.computer_name + '"><i class="fa fa-warning fa-fw fg-red"></i> Mark as Void</a> \
                                        </li>';
                                    }
                                    else if( obj.status === 'pending') {
                                            html += '\
                                            <li> \
                                            <a href="javascript:void(0)" data-method="edit" data-bind="edit_service_order" data-id="' + row.ref_no + '" data-cluster-id = "'+ row.cluster_id +'" data-complaint-type="' + row.complaint_type + '"><i class="fa fa-edit fa-fw fg-yellow"></i> Edit Entry</a> \
                                            </li> \
                                            <li class="visible-lg"> \
                                                <a href="javascript:void(0)" data-method="print" data-bind="print_service_order_form" data-id="' + row.ref_no + '" id="print_service_order_form"><i class="fa fa-print fa-fw"></i> Print Form</a> \
                                            </li> \
                                            <li> \
                                                <a href="javascript:void(0)" data-method="replaced" data-bind="resolve_service_order" data-id="' + row.ref_no + '" data-computer-name="' + row.computer_name + '" data-part-name="' + row.part_name + '"><i class="fa fa-check-square-o fa-fw fg-green"></i> Resolve</a> \
                                            </li>';
                                    }
                                   /* else if(obj.status === 'replaced') {
                                        html += '<li class="visible-lg"> \
                                            <a href="javascript:void(0)" data-method="print" data-bind="print_service_order_form" data-id="' + row.ref_no + '" id="print_service_order_form"><i class="fa fa-print fa-fw"></i> Print Form</a> \
                                        </li> \
                                        <li> \
                                            <a href="javascript:void(0)" data-method="service_done" data-bind="service_done_form" data-id="' + row.ref_no + '"><i class="fa fa-check-square-o fa-fw fg-orange"></i> Return</a> \
                                        </li> \
                                        <li> \
                                            <a href="javascript:void(0)" data-method="edit" data-bind="edit_service_order" data-id="' + row.ref_no + '" data-cluster-id = "'+ row.cluster_id +'" data-complaint-type="' + row.complaint_type + '"><i class="fa fa-edit fa-fw fg-yellow"></i> Edit Entry</a> \
                                        </li> \
                                        <li> \
                                            <a href="javascript:void(0)" data-method="void" data-bind="confirmation" data-id="' + row.ref_no + '" data-computer-name="' + row.computer_name + '"><i class="fa fa-warning fa-fw fg-red"></i> Mark as Void</a> \
                                        </li>';
                                    }*/
                                    else if(obj.status === 'close') {
                                        html += '<li class="visible-lg"> \
                                            <a href="javascript:void(0)" data-method="print" data-bind="print_service_order_form" data-id="' + row.ref_no + '" id="print_service_order_form"><i class="fa fa-print fa-fw"></i> Print Form</a> \
                                        </li> \
                                        <li> \
                                            <a href="javascript:void(0)" data-method="void" data-bind="confirmation" data-id="' + row.ref_no + '" data-computer-name="' + row.computer_name + '"><i class="fa fa-warning fa-fw fg-red"></i> Mark as Void</a> \
                                        </li>';
                                    }
                                    else if(obj.status === 'void') {
                                        html += '<li class="visible-lg"> \
                                            <a href="javascript:void(0)" data-method="print" data-bind="print_service_order_form" data-id="' + row.ref_no + '" id="print_service_order_form"><i class="fa fa-print fa-fw"></i> Print Form</a> \
                                        </li> \
                                        <li> \
                                            <a href="javascript:void(0)" data-method="re_open" data-bind="confirmation" data-id="' + row.ref_no + '" data-computer-name="' + row.computer_name + '"><i class="fa fa-check fa-fw fg-green"></i> Mark as Received</a> \
                                        </li>';
                                    }
                                html += '</ul> \
                            </div> \
                        </div> \
                    ';
                    return html;
                }
            }
        ],
        'language': {
            "processing": '<div class="processing-wrapper"> \
                                <div><i class="fa fa-spinner fa-spin"></i> Fetching ... Please wait...</div> \
                            </div>',
            'emptyTable': 'No task(s) available in the database!',
            'zeroRecords': 'No task(s) available!',
            "infoFiltered": ""
        }
    });

    obj.print_service_order_form = function(ref_no) {
        ajax_get_service_order_details_by_ref_no( ref_no ).done( function() {
            window.print();
        });
    };

    obj.ajax_mark_void_service_order_by_id = function( $small_modal ){
        var $submit = $('[type="submit"]');

        $.ajax({
            url : 'ajax_service_order/mark_void_service_order_by_id',
            type : 'post',
            dataType : 'json',
            data : { ref_no : obj.ref_no, name : obj.user_name, computer_name : obj.computer_name },
            beforeSend : function(){
                $submit.text( 'Processing...' ).prop( 'disabled', true );
            },
            success : function( result ){
                if( result.status )
                {
                    obj.user_task_list.ajax.reload();
                    toastr.success( 'Marked as VOID!', "itmms | Service Order" );

                    $small_modal.modal( 'hide' );
                }
                else
                {
                    toastr.error( 'Unable to mark as void', " itmms | Service Order" );
                }
            },
            error : function( xhr, status ){
                alert( xhr.responseText );
            }
        });
    };

    obj.ajax_mark_replaced_service_order_by_id = function( $form, $medium_modal ){
        var $submit = $('[type="submit"]');

        $.ajax({
            url : 'ajax_service_order/mark_replaced_service_order_by_id',
            type : 'post',
            dataType : 'json',
            data : {
                ref_no: obj.ref_no,
                user_name: obj.user_name,
                computer_name: obj.computer_name,
                part_name: obj.part_name,
                epr_no: $form.find('#epr_no').val(),
                action_taken: $form.find('#action_taken').val()
              },
            beforeSend : function() {
                $submit.text( 'Processing...' ).prop( 'disabled', true );
            },
            success : function( result ){
                if( result.status )
                {
                    obj.user_task_list.ajax.reload();
                    toastr.success( 'Marked as Resolved!', "itmms | Service Order" );

                    $medium_modal.modal( 'hide' );
                }
                else
                {
                    toastr.error( 'Unable to mark as Resolved', " itmms | Service Order" );
                }
            },
            error : function( xhr, status ){
                alert( xhr.responseText );
            }
        });
    };

    obj.ajax_mark_open_service_order_by_id = function( $small_modal ){
        var $submit = $('[type="submit"]');

        $.ajax({
            url : 'ajax_service_order/mark_open_service_order_by_id',
            type : 'post',
            dataType : 'json',
            data : { ref_no : obj.ref_no, name : obj.user_name, computer_name : obj.computer_name },
            beforeSend : function(){
                $submit.text( 'Processing...' ).prop( 'disabled', true );
            },
            success : function( result ){
                if( result.status )
                {
                    obj.user_task_list.ajax.reload();
                    toastr.success( 'Mark as Received!', "itmms | Service Order" );

                    $small_modal.modal( 'hide' );
                }
                else
                {
                    toastr.error( 'Unable to mark as Received', " itmms | Service Order" );
                }
            },
            error : function( xhr, status ){
                alert( xhr.responseText );
            }
        });
    }

    obj.ajax_update_service_order = function ( $form, $modal ) {
        var $submit = $form.find( '[type="submit"]' );

        $.ajax( {
            url : 'ajax_service_order/update_service_order/' + obj.user_name,
            type : 'post',
            dataType : 'json',
            data : $form.serialize(),
            beforeSend : function() {
                $submit.text( 'Processing...' ).prop( 'disabled', true );
            },
            success : function( result ) {
                if(result.status) {
                    obj.user_task_list.ajax.reload();
                    toastr.success('Successfully Updated!', "itmms | Service Order");

                    $modal.modal( 'hide' );
                }
                else {
                    toastr.error( "Failed to update", "itmms | Service Order");
                }

                $submit.text( 'Submit' ).prop( 'disabled', false );
            },
            error : function( xhr, status ) {
                alert( xhr.responseText );
            }
        } );
    }

    obj.ajax_update_service_order_completion = function ( $form, $modal ) {
        var $submit = $form.find( '[type="submit"]' );

        $.ajax( {
            url : 'ajax_service_order/update_service_order_completion/' + obj.user_name,
            type : 'post',
            dataType : 'json',
            data : $form.serialize(),
            beforeSend : function(){
                $submit.text( 'Processing...' ).prop( 'disabled', true );
            },
            success : function( result ) {
                if(result.status){
                    obj.user_task_list.ajax.reload();
                    toastr.success('Job well done!', "itmms | Service Order");

                    $modal.modal( 'hide' );
                }
                else{
                    toastr.error( "Failed to update", "itmms | Service Order");
                }

                $submit.text( 'Submit' ).prop( 'disabled', false );
            },
            error : function( xhr, status ){
                alert( xhr.responseText );
            }
        } );
    }

    obj.ajax_designate_to = function ( $form, $modal ) {
        var $submit = $form.find( '[type="submit"]' );

        $.ajax( {
            url : 'ajax_service_order/designate_to/' + obj.user_name,
            type : 'post',
            dataType : 'json',
            data : $form.serialize(),
            beforeSend : function(){
                $submit.text( 'Processing...' ).prop( 'disabled', true );
            },
            success : function( result ) {
                if(result.status){
                    obj.user_task_list.ajax.reload();
                    toastr.success('Designated!', "itmms | Service Order");

                    $modal.modal( 'hide' );
                }
                else{
                    toastr.error( "Failed to process", "itmms | Service Order");
                }

                $submit.text( 'Submit' ).prop( 'disabled', false );
            },
            error : function( xhr, status ){
                alert( xhr.responseText );
            }
        } );
    }

    obj.ajax_get_modal_content = function( ajax_url, $modal ) {
        return $.ajax({
            url : ajax_url,
            type : 'get',
            dataType : 'html',
            beforeSend: function() {
                $modal.find( '.modal-content' ).html( obj.loader );
            },
            success: function( response ) {
                var html = $( $.parseHTML( response ) ),
                    content = html.filter( '.modal-content' ).html();

                $modal.find( '.modal-content' ).html( content );
            },
            error: function( xhr, status ) {
                alert( xhr.responseText );
            }
        });
    }

    function ajax_get_service_order_details_by_ref_no( ref_no ) {
        var form = $( '#service-order-form' );

        return $.ajax({
            url : 'ajax_service_order/get_service_order_details_by_id',
            type : 'get',
            dataType : 'json',
            data : { ref_no : ref_no },
            success: function( result ) {
                console.log(result);
                $.each( result, function(index, value) {
                    switch( index ) {
                        case 'if_pulled_out' :
                                if(value == 1) {
                                    form.find( '.pulled-out-yes' ).attr('checked', 'checked');
                                } else {
                                    form.find( '.pulled-out-no' ).attr('checked', 'checked');
                                }
                            break;
                        case 'under_warranty' :
                                if(value == 1) {
                                    form.find( '.pulled-out-yes' ).attr('checked', 'checked');
                                } else {
                                    form.find( '.pulled-out-no' ).attr('checked', 'checked');
                                }
                            break;
                        default :
                            form.find( '[id=' + index + ']' ).text(value);
                            break;
                    }
                } );
            },
            error : function( xhr, status ) {
                alert( xhr.responseText );
            }
        });
    };

    function ajax_get_service_order_details_by_id( $modal ){
        var $field = $modal.find( 'div' ),
            $form = $modal.find( 'form' );
        return $.ajax({
            url : 'ajax_service_order/get_service_order_details_by_id',
            type : 'get',
            dataType : 'json',
            data : { ref_no : obj.ref_no },
            success: function( result ){
                $.each( result, function(index, value){
                    switch( obj.method ){
                        case 'service_done' :
                            switch( index ){
                                case 'completed_by' :
                                    if(value != null){
                                        $form.find( '[name="completed_by"]' ).val(value);
                                    }else{
                                        $form.find( '[name="completed_by"]' ).val(result.assigned_to);
                                    }
                                    break;
                                case 'action_taken':
                                    $form.find( '[name=' + index + ']' ).text(value);
                                    break;

                                case 'date_finished':
                                    $form.find( '[name=' + index + ']' ).val(value);
                                    break;
                                case 'unit_status':
                                    if( value === 'under repair' || value === 'for ordering' || value === 'replaced' ){
                                        $form.find( '[name=' + index + ']' ).val();
                                    }
                                    else{
                                        $form.find( '[name=' + index + ']' ).val(value);
                                    }
                                    break;
                                case 'date_reported':
                                    $field.find( '[id=' + index + ']' ).text($.format.date(value + '00:00:00', "MMMM dd, yyyy"));
                                    break;
                                case 'complaint':
                                    $form.find( '[name=' + index + ']' ).val(value);
                                    break;
                                default :
                                    $form.find( '[name=' + index + ']' ).val(value);
                                    $field.find( '[id=' + index + ']' ).text(value);
                                    break;
                            }
                            break;
                        case 'edit' :
                            switch( index ) {
                                case 'complaint_details':
                                    $form.find( '[name=' + index + ']' ).text(value);
                                    break;
                                case 'if_pulled_out':
                                    if(value == 1) {
                                        $form.find( '[id="yes"]' ).attr('checked', 'checked');
                                    }
                                    else if(value == 0) {
                                        $form.find( '[id="no"]' ).attr('checked', 'checked');
                                    }
                                    break;
                                case 'date_reported':
                                    $form.find( '[name=' + index + ']' ).val(value);
                                    $('#time_reported').timepicker({
                                        template: false,
                                        minuteStep: 1,
                                        showInputs: false
                                    });
                                    date_picker(value, '#date', 'top right');
                                    break;
                                case 'cluster_id':
                                    $form.find( '[name=' + index + ']' ).val(value);
                                    ajax_get_computer_in_modal( $modal , value );
                                    break;
                                default :
                                    $form.find( '[name=' + index + ']' ).val(value);
                                    break;
                            }
                            break;
                        case 'view' :
                            switch( index ) {
                                case 'complaint_type' :
                                    $field.find( '[id=' + index + ']' ).text(value.charAt(0).toUpperCase() + value.slice(1));
                                    break;
                                case 'appoint' :
                                    if( value == null){
                                        $field.find('#designate').remove();
                                    }
                                    break;
                                case 'unit_status':
                                    const description = getUnitStatusDescription(value);
                                    $field.find('#unit_status').text(description);
                                    break;
                                default :
                                    $field.find( '[id=' + index + ']' ).text(value);

                                    break;
                            }
                            break;
                        case 'designate' :
                            switch( index ) {
                                default :
                                    $form.find( '[id=' + index + ']' ).val(value);
                                    break;
                            }
                            break;
                        case 'replaced' :
                                switch( index ) {
                                    case 'epr_no' :
                                        $form.find( '[id=' + index + ']' ).val(value);
                                        break;
                                    case 'action_taken' :
                                        $form.find( '[id=' + index + ']' ).val(value);
                                        break;
                                }
                                break;
                    }
                } );
            },
            error : function( xhr, status ){
                alert( xhr.responseText );
            }
        });
    };

    function validate_service_order_on_update( $form, $modal ) {
        $form.validate({
            rules: {
                emp_id : {
                    required : true
                },
                emp_name : {
                    required : true
                },
                cluster_id : {
                    required : true
                },
                position : {
                    required : true
                },
                contact_no : {
                    required : true
                },
                computer_name : {
                    required : true
                },
                complaint_type : {
                    required : true
                },
                complaint_resource_id : {
                    required : true
                },
                complaint_details : {
                    required : true
                },
                date_reported : {
                    required : true
                },
                time_reported : {
                    required : true
                },
                assigned_to: {
                    required : true
                },
                epr_no: {
                    required: function() {
                        return obj.status == 'pending';
                    }
                },
                action_taken: {
                    required: function() {
                        return obj.status == 'pending';
                    }
                }
            },
            messages : {
                emp_id : {
                    required : "Employee ID is required"
                },
                emp_name : {
                    required : "Employee ID is required"
                },
                cluster_id : {
                    required : "Department/Office name is required"
                },
                position : {
                    required : "Position is required"
                },
                contact_no : {
                    required : "Contact number is required",
                    number : "Number only please"
                },
                computer_name : {
                    required : "Assigned Name is required"
                },
                complaint_type : {
                    required : "Complaint type is required"
                },
                complaint_resource_id : {
                    required : "Complaint is required"
                },
                complaint_details : {
                    required : "Complaint details is required"
                },
                date_reported : {
                    required : "Date reported is required"
                },
                time_reported : {
                    required : "Time reported is required"
                },
                assigned_to: {
                    required : "Assigned To is required"
                },
                epr_no: {
                    required : "EPR No. is required"
                },
                action_taken: {
                    required : "Action Taken is required"
                }
            },
            highlight: function( element, errorClass, validClass ) {
                $(element).addClass( errorClass ).removeClass( validClass );
            },
            unhighlight: function( element, errorClass, validClass ) {
                // $(element).removeClass( errorClass ).addClass( validClass );
                $(element).removeClass( errorClass );
            },
            errorPlacement: function( erorr, element ) {
                erorr.insertAfter(element);
            },
            submitHandler: function() {
                obj.ajax_update_service_order( $form, $modal );
            }
        });
    }

    function validate( $form, $modal ) {
        $form.validate({
            ignore: ":hidden:not(#ref_no)",
            rules: {
                date_finished : {
                    required : true
                },
                time_finished : {
                    required : true
                },
                completed_by : {
                    required : true
                },
                unit_status : {
                    required : true
                },
                action_taken : {
                    required : true
                },
                returned_to : {
                    required : true
                },
                property_clerk : {
                    required : true
                },
                property_date_received : {
                    required : true
                },
                computer_part : {
                    required : function() {
                        return $form.find("input#complaint").val() == 'Personal Computer' &&
                                $form.find("#unit_status").val() == 'under warranty';
                    }
                },
                assigned_to: {
                    required : true
                },
            },
            messages : {
                date_finished : {
                    required : "Date Finished is required"
                },
                time_finished : {
                    required : "Time Finished is required"
                },
                completed_by : {
                    required : "Completed by is required"
                },
                unit_status : {
                    required : "Unit Status is required"
                },
                action_taken : {
                    required : "Diagnose / Troubleshooting Report is required"
                },
                returned_to : {
                    required : "Retuned to is required"
                },
                property_clerk : {
                    required : "Property Clerk is required"
                },
                property_date_received : {
                    required : "Property Date Received is required"
                },
                computer_part: {
                    required : "Computer Part is required"
                },
                assigned_to: {
                    required : "Assigned To is required"
                }
            },
            highlight: function( element, errorClass, validClass ){
                $(element).addClass( errorClass ).removeClass( validClass );
            },
            unhighlight: function( element, errorClass, validClass ){
                // $(element).removeClass( errorClass ).addClass( validClass );
                $(element).removeClass( errorClass );
            },
            errorPlacement: function( erorr, element ){
                erorr.insertAfter(element);
            },
            submitHandler: function(){
                $form.find( '[name="ref_no"]' ).val(obj.ref_no);
                obj.ajax_update_service_order_completion( $form, $modal );
            }
        });
    }

    function validate_resolve( $form, $modal ) {
        $form.validate({
            ignore: ":hidden:not(#ref_no)",
            rules: {
                epr_no : {
                    required : true
                },
                action_taken : {
                    required : true
                },
            },
            messages : {
                epr_no : {
                    required : "EPR No. is required"
                },
                action_taken : {
                    required : "Action Taken is required"
                },
            },
            highlight: function( element, errorClass, validClass ){
                $(element).addClass( errorClass ).removeClass( validClass );
            },
            unhighlight: function( element, errorClass, validClass ){
                $(element).removeClass( errorClass );
            },
            errorPlacement: function( erorr, element ){
                erorr.insertAfter(element);
            },
            submitHandler: function(){
                $form.find( '[name="ref_no"]' ).val(obj.ref_no);
                obj.ajax_mark_replaced_service_order_by_id( $form, $modal );
            }
        });
    }

    function validate_designation( $form, $modal ) {
        var assigned_to = $form.find("#view_assigned_to").text();
        $form.validate({
            rules: {
                designate_to : {
                    required : true,
                    notEqual : assigned_to
                }
            },
            messages : {
                designate_to : {
                    required : "Select TSG personel first",
                    notEqual : "It should different to assigned to"
                }
            },
            highlight: function( element, errorClass, validClass ){
                $(element).addClass( errorClass ).removeClass( validClass );
            },
            unhighlight: function( element, errorClass, validClass ){
                // $(element).removeClass( errorClass ).addClass( validClass );
                $(element).removeClass( errorClass );
            },
            errorPlacement: function( erorr, element ){
                erorr.insertAfter(element);
            },
            submitHandler: function(){
                $form.find( '[name="designate"]' ).val($('#user_id :selected').text());
                obj.ajax_designate_to( $form, $modal );
            }
        });
    }

    function ajax_get_computer_in_modal( $modal, cluster_id ){
        var $form = $modal.find( 'form' ),
            $computer = $form.find('[id="computer_name"]');

        return $.ajax({
            url : 'ajax_computer/get_computer_details_for_service_order',
            type : 'get',
            dataType : 'json',
            data: { cluster_id: cluster_id },
            beforeSend: function(){
                var $loader = $('<option />');

                $loader.attr('value', '').text('Fetching...').prop('selected', true);

                $computer.append( $loader );
            },
            success: function( result ){
                $computer.empty();

                if( result instanceof Array && result.length > 0 ) {
                    var $select = $('<option />');
                        $select.attr('value', 'NA').text('Not Applicable');

                    $computer.append($select);

                    var groups = {
                        'department': $('<optgroup label="Department"></optgroup>'),
                        'office': $('<optgroup label="Office"></optgroup>'),
                        'laboratory': $('<optgroup label="Laboratory"></optgroup>'),
                        'lecture': $('<optgroup label="Lecture"></optgroup>'),
                    };
                    $.each(result, function(index, value){
                        var computer = result[index];

                        var $option = $( '<option />' );
                        $option.attr( 'value', result[ index ].computer_name ).text( result[index].computer_name );

                        groups[computer.designation_type].append($option);
                    });

                    Object.keys(groups).forEach(groupKey => {
                        if(groups[groupKey].children().length) {
                            $computer.append(groups[groupKey]);
                        }
                    });
                } else {
                    var $select = $('<option />');
                        $select.attr({
                            'value': 'NA',
                            'disabled': true,
                            'selected': true
                        }).text('No computers assigned to selected designation');

                    $computer.append($select);
                }
            },
            error : function( xhr, status ){
                alert( xhr.responseText );
            }
        });
    }

    function load_modal( {url, ref_no, computer_name, cluster_id, complaint_type, part_name, method} ) {
        var $modal = $( '#large' ),
            $medium_modal = $( '#medium' ),
            $small_modal = $( '#small' ),
            ajax_url = 'modal/' + url;

            obj.method = method;
            obj.ref_no = ref_no;
            obj.cluster_id = cluster_id;
            obj.complaint_type = complaint_type;
            obj.computer_name = computer_name;
            obj.part_name = part_name;

        switch( obj.method ){
            case 'service_done':
                obj.ajax_get_modal_content( ajax_url, $medium_modal ).done( function() {
                    get_all_user_details_of_admin_encoder('#user_id').done( function(){
                        ajax_get_service_order_details_by_id( $medium_modal ).done( function(){
                            if( obj.status === 'replaced'){
                                    $medium_modal.modal( {
                                        show : true,
                                        backdrop: 'static',
                                    } );
                                    $('#finished').hide();
                                    $('#property').hide();
                                    $('#return').hide();
                                    $( '#unit_status' ).change(function(e) {
                                        e.preventDefault();
                                        if($(this).val() == '') {
                                            $('#property').hide();
                                            $('#return').hide();
                                        }
                                        else {
                                            if( $(this).val() === 'repaired' ){
                                                $('#property_date').show();
                                                $('#property').show();
                                                $('#return').show();
                                                $('#returned_to').val('');

                                            }
                                            else if( $(this).val() === 'need replacement' || $(this).val() === 'under warranty' ){
                                                $('#return').hide();
                                                $('#property').hide();
                                                $('#returned_to').val('');
                                            }
                                        }
                                    });
                                    validate( $medium_modal.find( 'form' ), $medium_modal );
                                    date_picker(new Date(), '#date_replaced', 'bottom right');
                                    $('#time_replaced').timepicker({
                                        template: false,
                                        minuteStep: 1,
                                        showInputs: false
                                    });
                            }
                            else{
                                $medium_modal.modal( {
                                    show : true,
                                    backdrop: 'static',
                                } );
                                $('#replaced').hide();
                                $('#property').hide();
                                $('#return').hide();
                                $( '#unit_status' ).change(function() {
                                    if( $(this).val() === 'repaired' ){
                                        $('#return').show();
                                        $('#property').hide();
                                        $('#returned_to').val('');
                                        $('#property_date_received').val('');
                                        $('.computer-parts-field').addClass('hidden');
                                    }
                                    else if( $(this).val() === 'need replacement' || $(this).val() === 'under warranty' ){
                                        $('#property_date').hide();
                                        $('#property').show();
                                        $('#return').hide();
                                        $('#returned_to').val('');

                                        if($('input#complaint').val() == 'Personal Computer') {
                                            $('.computer-parts-field').removeClass('hidden');
                                        }
                                    }
                                });
                                validate( $medium_modal.find( 'form' ), $medium_modal );
                                date_picker(new Date(), '#date_finished', 'bottom right');
                                $('#time_finished').timepicker({
                                    template: false,
                                    minuteStep: 1,
                                    showInputs: false
                                });
                            }
                        });
                    });
                } );
                break;
            case 'view':
                obj.ajax_get_modal_content( ajax_url, $modal ).done( function(){
                    ajax_get_service_order_details_by_id( $modal ).done( function(){
                        $('#service_done_details').hide();
                        if( obj.status === 'close' || obj.status === 'all' ){
                            $('#service_done_details').show();
                        }
                        $modal.modal('show');
                    } );
                } );
                break;
            case 'void' :
                obj.ajax_get_modal_content( ajax_url, $small_modal ).done( function(){
                    $small_modal.modal( {
                        show : true,
                        backdrop: 'static',
                    } );
                } );
                break;
            case 're_open' :
                obj.ajax_get_modal_content( ajax_url, $small_modal ).done( function(){
                    $small_modal.modal( {
                        show : true,
                        backdrop: 'static',
                    } );
                } );
                break;
            case 'edit' :
                obj.ajax_get_modal_content( ajax_url, $medium_modal ).done( function() {
                    ajax_get_clusters().done( function() {
                        ajax_get_computer(obj.cluster_id).done( function() {
                            ajax_get_complaint_by_type('#edit_complaint', obj.complaint_type).done( function() {
                                get_all_user_details_of_admin_encoder('#received_ae').done( function() {
                                    get_all_user_details_of_admin().done( function() {
                                        ajax_get_service_order_details_by_id( $medium_modal ).done( function() {
                                            validate_service_order_on_update(  $medium_modal.find( 'form' ), $medium_modal);

                                            if(obj.status == 'pending') {
                                                $('.replacement-section').removeClass('hidden');
                                            }

                                            $( document ).on( 'change', '#cluster_id', function(){
                                                var value = $(this).val();
                                                if(value) {
                                                    ajax_get_computer_in_modal( $medium_modal , value );
                                                }
                                                else {
                                                    $('#computer_name').prop('disabled', false).empty().append('<option default value="">Not yet selected</option>');
                                                }
                                            });
                                            $( document ).on( 'change', '#complaint_type', function(){
                                                var value = $(this).val();
                                                if(value) {
                                                    ajax_get_complaint_by_type('#edit_complaint', value).done(function() {
                                                        $("#edit_complaint").prop("selectedIndex", 1);
                                                    });
                                                }
                                                else {
                                                    $('#edit_complaint').prop('disabled', false).empty().append('<option default value="">Not yet selected</option>');
                                                }
                                            });
                                            $medium_modal.modal( {
                                                show : true,
                                                backdrop: 'static',
                                            });
                                        });
                                    });
                                })
                            });
                        });
                    });
                });
                break;
            case 'designate' :
                obj.ajax_get_modal_content( ajax_url, $medium_modal ).done( function(){
                    get_all_user_details_of_admin().done( function() {
                        ajax_get_service_order_details_by_id( $medium_modal ).done( function() {
                            validate_designation( $medium_modal.find( 'form' ), $medium_modal );
                            $medium_modal.modal( {
                                show : true,
                                backdrop: 'static',
                            } );
                        } );
                    } );
                } );
                break;
            case 'replaced' :
                obj.ajax_get_modal_content( ajax_url, $medium_modal ).done( function(){
                    ajax_get_service_order_details_by_id($medium_modal).done(function () {
                        $medium_modal.modal({
                          show: true,
                          backdrop: "static",
                        });
                        validate_resolve($medium_modal.find("form"), $medium_modal);
                      });
                } );
                break;
            default :
                obj.ajax_get_modal_content( ajax_url, $modal ).done( function(){
                    $modal.modal( {
                        show : true,
                        backdrop: 'static',
                    } );
                } );
                break;
        }
    }
} );
