$( function( $ ) {

    var obj = {};
    init();
    date_picker(new Date(), '#date_assigned', 'top right');
    validate();
    $('#designation').prop('disabled', false).empty().append('<option default value="">Not yet selected</option>');

    $('#set').click( function(e){
        $('#set_computer_name').removeClass('hidden');
        $('#set_hide').addClass('hidden');
    } );

    $( document ).on( 'change', '#designation_type', function(){
        var value = $(this).val();

        if( value ) {
            switch(value){
                case 'laboratory':
                case 'lecture':
                    ajax_get_classroom_designation_for_computer(value);
                    break;
                case 'department':
                case 'office':
                    ajax_get_cluster_designation_for_computer(value);
                    break;
            }
        }
        else{
            $('#designation').prop('disabled', false).empty().append('<option default value="">Not yet selected</option>');
        }
    });

    obj.ajax_add_computer = function ( $form ){
        var $submit = $form.find( '[type="submit"]' );

        $.ajax( {
            url : 'ajax_computer/add_computer',
            type : 'post',
            dataType : 'json',
            data : $form.serialize(),
            beforeSend : function(){
                $submit.text( 'Processing...' ).prop( 'disabled', true );
            },
            success : function( result ) {
                console.log(result);
                if(result.status){
                    $('#set_computer_name').addClass('hidden');
                    $('#set_hide').removeClass('hidden');

                    if(result.access_rights == 'add')
                        toastr.success( "Added!", "itmms | Computer" );
                    else
                        toastr.success( "Added! <a role='button' class='btn btn-sm-toastr' href='manage/computers'><i class='fa fa-external-link'></i> View List</a>", "itmms | Computer" );

                }
                else{
                    toastr.error( "Failed to add", "itmms | Computer" );
                }

                $form.trigger("reset");
                date_picker(new Date(), '#date_assigned', 'top right');
                $('#designation').prop('disabled', false).empty().append('<option default value="">Not yet selected</option>');
                $submit.text( 'Submit' ).prop( 'disabled', false );
            },
            error : function( xhr, status ){
                alert( xhr.responseText );
            }
        } );
    }

    function validate(){
        var $form = $('form');
        $form.validate({
            rules: {
                computer_type : {
                    required : true
                },
                brand_clone_name : {
                    required : true
                },
                designation_type : {
                    required : true
                },
                designation : {
                    required : true
                }
            },
            messages : {
                computer_type : {
                    required : "Computer type is required"
                },
                brand_clone_name : {
                    required : "Brand / Clone name is required"
                },
                designation: {
                    required : "Designation is required"
                },
                designation_type : {
                    required : "Designation type is required"
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
                obj.ajax_add_computer ( $form );
                validate();
            }
        });
    }

    $('.btn-add-part').click(function(){
        var computerParts = $('.computer-parts-container');

        var computerPartItem =
        '<div class="computer-parts-item">' +
        '    <div class="col-lg-6">' +
        '        <span>Parts: </span>' +
        '        <select class="form-control" name="computer_parts[]" id="computer_parts">' +
        '            <option value="">Select Computer Part</option>' +
        '            <option value="Monitor">Monitor</option>' +
        '            <option value="Hard Drive">Hard Drive</option>' +
        '            <option value="Motherboard">Motherboard</option>' +
        '            <option value="Power Supply">Power Supply</option>' +
        '            <option value="Processor">Processor</option>' +
        '            <option value="RAM">RAM</option>' +
        '            <option value="Video Card">Video Card</option>  ' +
        '        </select>' +
        '    </div>' +
        '    <div class="col-lg-6">' +
        '        <span>Value: </span>' +
        '        <select class="form-control" name="parts_depreciation_value[]" id="parts_depreciation_value">' +
        '            <option value="">Select Depreciation Value</option>' +
        '            <option value="6 months">6 months</option>' +
        '            <option value="8 months">8 months</option>' +
        '            <option value="10 months">10 months</option>' +
        '            <option value="1 year">1 year</option>' +
        '            <option value="2 years">2 years</option>' +
        '            <option value="3 years">3 years</option>' +
        '            <option value="4 years">4 years</option>' +
        '            <option value="5 years">5 years</option>' +
        '        </select>' +
        '    </div><br/><br/><br/>' +
        '</div>';

        computerParts.append(computerPartItem);
    })
});
