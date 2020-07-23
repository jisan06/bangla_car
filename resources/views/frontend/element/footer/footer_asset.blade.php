<script src="{{ asset('public/frontend') }}/assets/js/vendor/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
<script src="{{ asset('public/frontend') }}/assets/js/vendor/modernizr-3.7.1.min.js"></script>
<script src="{{ asset('public/frontend') }}/assets/js/plugins.min.js"></script>
<script src="{{ asset('/public/admin-elite/assets/node_modules/datatables/jquery.dataTables.min.js') }}"></script>

<!-- Main Activation JS -->
<script src="{{ asset('public/frontend') }}/assets/js/main.js"></script>

<script src="{{ asset('/public/admin-elite/dist/js/chosen.jquery.js') }}"></script>

	<!-- end JS -->
	@yield('custom_js')
	<script>
	$( function() {
		$( ".add_datepicker" ).datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd-mm-yy',
        }).datepicker('setDate', 'today');

        $( ".datepicker" ).datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd-mm-yy',
        });
	} );
</script>

<script type="text/javascript">
	$(".chosen-select").chosen({search_contains: true});
</script>

<script>
    $(document).ready(function() {
        var updateThis ;

        // Switchery
        var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
        $('.js-switch').each(function() {
            new Switchery($(this)[0], $(this).data());
        });

        var table = $('#dataTable').DataTable( {
            "orderable": false,
            "bSort" : false,
            "pageLength": 25,
        } );
        table.on( 'order.dt search.dt', function () {
            table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
                cell.innerHTML = i+1;
            } );
        } ).draw();

    });
                
</script>