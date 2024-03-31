$( function( $ ) {
    var obj = {};

    obj.pending_services_list = $('#pending_service').DataTable({
        'processing': true,
        'serverSide': true,
        'responsive': true,
        'ajax': {
            'url' : 'ajax_user/get_pending_details_for_table',
            'data': {
                    user_type: function() {
                    return $('#user_type').text();
                    }
                }
            },
        'deferRender': true,
        'order': [[0, 'asc']],
        'columns': [
            { 'data': 'ref_no', 'sClass': 'text-center' },
            { 'data': 'computer_name' },
            { 'data': 'complaint_type', 'sClass': 'caps' },
            { 'data': 'complaint' },
            { 'data': 'complaint_details' },
            { 'data': 'unit_status', 'sClass': 'caps' },
            { 'data': 'datetime_reported' }

        ],
        'columnDefs': [
            {
                'data': 'unit_status',
                'targets': -2,
                'sortable': false,
                'render' : function ( data, type, row ) {
                    if(row.unit_status == 'under warranty') {
                        return "<span class='label label-warning'>Replaced</span>"
                    }

                    if(row.unit_status == 'close') {
                        return "<span class='label label-success'>Resolved</span>"
                    }

                    return '';
                }
            },
        ],
        'fnRowCallback': function(nRow, aData, iDisplayIndex, iDisplayIndexFull){
            var urgent = aData['is_urgent'];

            if(urgent === '1'){
                $(nRow).addClass('bg-lightBlue');
            }
        },

        'language': {
            "processing": '<div class="processing-wrapper"> \
                            <div><i class="fa fa-spinner fa-spin"></i> Fetching ... Please wait...</div> \
                        </div>',
            'emptyTable': 'No services report available in the database!',
            'zeroRecords': 'No pending services available!',
            "infoFiltered": ""
        }
    });


} );
