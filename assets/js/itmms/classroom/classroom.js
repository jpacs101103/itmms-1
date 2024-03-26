$( function( $ ) {
    var obj = {};

    init();
    validate();
    ajax_get_clusters();

    obj.ajax_add_classroom = function ( $form ){
        var $submit = $form.find( '[type="submit"]' );

        $.ajax( {
            url : 'ajax_classroom/add_classroom',
            type : 'post',
            dataType : 'json',
            data : $form.serialize(),
            beforeSend : function(){
                $submit.text( 'Processing...' ).prop( 'disabled', true );
            },
            success : function( result ) {
                if(result.status){
                    $( '.classroom-wrapper' ).load( 'dashboard .classroom-wrapper > li' );
                    $( '.classroom-wrapper-sidebar' ).load( 'dashboard .classroom-wrapper-sidebar > li' );
                    toastr.success( "Added!", "itmms | Room" );
                }
                else{
                    toastr.error( "Failed to add", "itmms | Room" );
                }

                $form.trigger("reset");
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
                cluster_id : {
                    required : true
                },
                room_no : {
                    required : true,
                    remote : {
                        url : 'ajax_classroom/is_classroom_no_available',
                        type : "post"
                    }
                },
                classroom_type : {
                    required : true
                }
            },
            messages : {
                cluster_id : {
                    required : "Department / Office is required"
                },
                room_no : {
                    required : "Room No. is required",
                    remote : "Room No. is not available"
                },
                classroom_type : {
                    required : "Room Type is required"
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
                obj.ajax_add_classroom ( $form );
                validate();
            }
        });
    }
});
