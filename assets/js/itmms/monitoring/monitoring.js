$( function( $ ) {
    var obj = {};

    obj.loader = '<img src="assets/images/loader/loader.gif" class="loader" />';

    init();

    $( document ).on( 'click', '[data-bind]', function(e){
        e.preventDefault();

        var url = $( this ).data( 'bind' ),
            computer_id = $( this ).data( 'id' ),
            method = $( this ).data( 'method' );

        load_modal( url, computer_id, method );
    } );

    $( document ).on( 'click', '#small [type="submit"]', function(e){
        e.preventDefault();
        var $small_modal = $('#small');

        switch(obj.method){
            case 'delete':
                obj.ajax_delete_computer_by_id( $small_modal );
                break;
        }
    });

    obj.computer_list = $('#computer-list')
        .on('init.dt', function() {
            tippy('[data-tippy-content]');
        })
        .DataTable({
            'processing': true,
            'serverSide': true,
            'responsive': true,
            'ajax': 'ajax_computer/get_computer_details_for_table',
            'deferRender': true,
            'order': [[0, 'asc']],
            'columns': [
                { 'data': 'computer_id', 'sClass': 'text-center'},
                { 'data': 'computer_name' },
                { 'data': 'computer_type' },
                { 'data': 'lifespan_left', 'sClass': 'text-center' },
                { 'data': 'brand_clone_name' },
                { 'data': 'designation' },
                { 'data': 'assigned_to' },
                { 'data': 'dummy' },
            ],
            'columnDefs': [
                {
                    'data': 'lifespan_left',
                    'targets': 3,
                    'sortable': false,
                    'render' : function ( data, type, row ) {
                        const {
                            lowestHealthPercentage: health,
                            lowestHealthPart: part,
                        } = getLowestHealthPart(row.parts);

                        return `
                            <span class="monitoring-health label ${getHealthPercentageClassLabel(
                                health
                            )}" data-tippy-content="Part Name: ${
                            part.parts_name
                        }">${health}%
                                ${
                                    health <= 10
                                        ? `<i class="fa fa-info-circle fa-fw"></i>`
                                        : ""
                                }
                            </span>
                        `;
                    }
                },
                {
                    'data': 'actions',
                    'targets': -1,
                    'sortable': false,
                    'render' : function ( data, type, row ) {
                        var html = '<div class="text-center"> \
                                <div class="btn-group"> \
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle btn-itmms" data-toggle="dropdown"> \
                                        <i class="fa fa-chevron-down fa-fw"></i> \
                                    </button> \
                                    <ul class="dropdown-menu pull-right" role="menu"  style="padding: 0 0 7px 0"> \
                                        <li> \
                                            <span class="dropdown-title text-center">Action Bar</span> \
                                        </li> \
                                        <li> \
                                            <a href="monitoring/' + row.computer_id + '">\
                                                <i class="fa fa fa-external-link fa-fw fg-cyan"></i> View Parts</a> \
                                        </li> \
                                    </ul> \
                                </div> \
                            </div>';
                        return html;
                    }
                }
            ],
            'language': {
                "processing": '<div class="processing-wrapper"> \
                                    <div><i class="fa fa-spinner fa-spin"></i> Fetching ... Please wait...</div> \
                                </div>',
                'emptyTable': 'No computer(s) available in the database!',
                'zeroRecords': 'No computer found!',
                "infoFiltered": ""
            }
        });

    obj.ajax_update_computer_details = function ( $form, $modal ){
        var $submit = $form.find( '[type="submit"]' );

        $.ajax( {
            url : 'ajax_computer/update_computer_details',
            type : 'post',
            dataType : 'json',
            data : $form.serialize(),
            beforeSend : function(){
                $submit.text( 'Processing...' ).prop( 'disabled', true );
            },
            success : function( result ) {
                if(result.status){
                    obj.computer_list.ajax.reload();
                    toastr.success('Sucessfully updated!', "itmms | Device");

                    $modal.modal( 'hide' );
                }
                else{
                    toastr.error( "Nothing to update", "itmms | Device" );
                }

                $submit.text( 'Update' ).prop( 'disabled', false );
            },
            error : function( xhr, status ){
                alert( xhr.responseText );
            }
        } );
    }

    obj.ajax_delete_computer_by_id = function( $small_modal ) {
        $.ajax({
            url : 'ajax_computer/delete_computer_by_id',
            type : 'post',
            dataType : 'json',
            data : { computer_id : obj.computer_id },
            success : function( result ){
                if( result.status ) {
                    obj.computer_list.ajax.reload();
                    toastr.success( 'Removed!', "itmms | User" );

                    $small_modal.modal( 'hide' );
                }
                else {
                    toastr.error( 'Unable to delete', " itmms | User" );
                }
            },
            error : function( xhr, status ) {
                alert( xhr.responseText );
            }
        });
    }

    obj.ajax_get_modal_content = function( ajax_url, $modal ) {
        return $.ajax({
            url : ajax_url,
            type : 'get',
            dataType : 'html',
            beforeSend: function(){
                $modal.find( '.modal-content' ).html( obj.loader );
            },
            success: function( response ){
                var html = $( $.parseHTML( response ) ),
                    content = html.filter( '.modal-content' ).html();

                $modal.find( '.modal-content' ).html( content );
            },
            error: function( xhr, status ){
                alert( xhr.responseText );
            }
        });
    }

    function ajax_get_computer_details_by_id( $modal ){
        var $field = $modal.find( 'div' ),
            $form = $modal.find( 'form' );

        return $.ajax({
            url : 'ajax_computer/get_computer_details_by_id',
            type : 'get',
            dataType : 'json',
            data : { computer_id : obj.computer_id },
            success: function( result ){
                if( result instanceof Object ) {
                    $.each( result, function(index, value){
                        switch( obj.method ){
                            case 'edit' :
                                switch( index ){
                                    case 'computer_type':
                                        $('#computer_type').val( result.computer_type.toLowerCase() );
                                        break;
                                    case 'date_assigned':
                                        $form.find( '[name=' + index + ']' ).val(value);
                                        date_picker(value, '#date_assigned', 'top right');
                                        break;
                                    case 'designation':
                                        $('[name="' + index + '"]').val( value );
                                        break;
                                    default :
                                        $form.find( '[name=' + index + ']' ).val(value);
                                        break;
                                }
                                break;
                            case 'view' :
                                $field.find( '[id=' + index + ']' ).text(value);
                                break;
                        }
                    } );
                }
            },
            error : function( xhr, status ){
                alert( xhr.responseText );
            }
        });
    };

    function validate( $form, $modal ){
        $form.validate({
            rules: {
                computer_type : {
                    required : true
                },
                brand_clone_name : {
                    required : true
                },
                room_no : {
                    required : true
                },
                workstation_no: {
                    required: true,
                    remote : {
                        url : 'ajax_computer/is_computer_no_available_on_update',
                        type : "post",
                        data: {
                            computer_id: function() {
                              return $( '[name="computer_id"]' ).val();
                            },
                            room_no: function() {
                              return $( '[name="room_no"]' ).val();
                            }
                        }
                    }
                },
                firstname : {
                    required : true
                },
                lastname : {
                    required : true
                }
            },
            messages : {
                computer_type : {
                    required : "Device type is required"
                },
                brand_clone_name : {
                    required : "Brand / Clone name is required"
                },
                room_no : {
                    required : "Designation is required"
                },
                workstation_no: {
                    required: "WS No. is required",
                    remote: "WS No. is not available"
                },
                firstname : {
                    required : "Firstname is required"
                },
                lastname : {
                    required : "Lastname is required"
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
                obj.ajax_update_computer_details( $form, $modal );
            }
        });
    }

    function load_modal( url, computer_id, method ) {
        var $modal = $( '#large' ),
            $medium_modal = $('#medium'),
            $small_modal = $('#small'),
            ajax_url = 'modal/' + url;

            obj.method = method;
            obj.computer_id = computer_id;

        switch(obj.method) {
            case 'view' :
                obj.ajax_get_modal_content( ajax_url, $medium_modal ).done( function() {
                    ajax_get_computer_details_by_id( $medium_modal ).done(function(){
                        $medium_modal.modal('show');
                    });
                } );
                break;
            case 'edit' :
                obj.ajax_get_modal_content( ajax_url, $medium_modal ).done( function() {
                    ajax_get_all_designation_for_computer().done( function(){
                        ajax_get_computer_details_by_id( $medium_modal ).done(function(){
                            validate( $medium_modal.find( 'form' ), $medium_modal );
                            $medium_modal.modal({
                                show : true,
                                backdrop: 'static',
                            });
                        });
                    });
                } );
                break;
            case 'delete' :
                obj.ajax_get_modal_content( ajax_url, $small_modal ).done( function() {
                    $small_modal.modal({
                        show : true,
                        backdrop: 'static',
                    });
                } );
                break;
        }
    }
});
