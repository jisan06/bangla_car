@extends('admin.layouts.masterIndex')

@section('card_body')
    <style type="text/css">
        .addBtn{
            display: none;
        }
    </style>
    <div class="card-body">
        <div class="table-responsive">
            @php
                $sl = 0;
            @endphp

            <table id="dataTable" class="table table-bordered table-striped" width="100%" name="areaTable">
                <thead>
                    <tr style="background: #00c292; text-align: center;">
                        <th rowspan="2" width="25px">SL</th>
                        <th rowspan="2" width="90px">Date</th>
                        <th class="text-center" width="90px">Name</th>
                        <th rowspan="2" width="120px">Phone No</th>
                        <th rowspan="2" width="200px">Location</th>
                        <th rowspan="2" width="200px">Pickup Location</th>
                        <th rowspan="2" width="200px">Drop Location</th>
                        <th rowspan="2" width="50px">Status</th>
                        <th class="text-center" rowspan="2" width="90px">Action</th>
                    </tr>
                </thead>
                <tbody id="">
                	@php
                        $sl = 0;
                        foreach ($booking_list as $booking) {
                            $sl++;
                        @endphp
                        <tr>
                            <td>{{$sl}}</td>
                            <td>{{date('Y-m-d',strtotime($booking->date))}}</td>
                            <td>{{$booking->name}}</td>
                            <td>{{$booking->phone}}</td>
                            <td>{{$booking->locationName}}</td>
                            <td>{{$booking->puckup_location}}</td>
                            <td>{{$booking->drop_location}}</td>
                            <td>
                                @php
                                    echo \App\Link::status($booking->bookingId,$booking->bookingStatus);
                                @endphp
                            </td>
                            <td>
                                @php
                                    echo \App\Link::action($booking->bookingId);
                                @endphp                             
                            </td>
                        </tr>
                    @php
                        }
                    @endphp
                </tbody>
            </table>
        </div>
    </div>	
@endsection

@section('custom-js')
    <script>
        $(document).ready(function() {
            var updateThis ;       

            //ajax delete code
            $('#dataTable tbody').on( 'click', 'i.fa-trash', function () {
                $.ajaxSetup({
                  headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                  }
                });

                bookingOrderId = $(this).parent().data('id');
                var tableRow = this;
                swal({   
                    title: "Are you sure?",   
                    text: "You will not be able to recover this information!",   
                    type: "warning",   
                    showCancelButton: true,   
                    confirmButtonColor: "#DD6B55",   
                    confirmButtonText: "Yes, delete it!",   
                    cancelButtonText: "No, cancel plx!",   
                    closeOnConfirm: false,   
                    closeOnCancel: false 
                },
                function(isConfirm){   
                    if (isConfirm) {
                        $.ajax({
                            type: "POST",
                            url : "{{ route('bookingOrder.delete') }}",
                            data : {bookingOrderId:bookingOrderId},
                           
                            success: function(response) {
                                swal({
                                    title: "<small class='text-success'>Success!</small>", 
                                    type: "success",
                                    text: "Deleted Successfully!",
                                    timer: 1000,
                                    html: true,
                                });
                                $('.row_'+bookingOrderId).remove();
                            },
                            error: function(response) {
                                error = "Failed.";
                                swal({
                                    title: "<small class='text-danger'>Error!</small>", 
                                    type: "error",
                                    text: error,
                                    timer: 1000,
                                    html: true,
                                });
                            }
                        });    
                    }
                    else
                    { 
                        swal({
                            title: "Cancelled", 
                            type: "error",
                            text: "This Data Is Safe :)",
                            timer: 1000,
                            html: true,
                        });    
                    } 
                });
            });
        });
                
        //ajax status change code
        function statusChange(bookingOrderId) {
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type: "post",
                url: "{{ route('bookingOrder.status') }}",
                data: {bookingOrderId:bookingOrderId},
                success: function(response) {
                    swal({
                        title: "<small class='text-success'>Success!</small>", 
                        type: "success",
                        text: "Status Successfully Updated!",
                        timer: 1000,
                        html: true,
                    });
                },
                error: function(response) {
                    error = "Failed.";
                    swal({
                        title: "<small class='text-danger'>Error!</small>", 
                        type: "error",
                        text: error,
                        timer: 2000,
                        html: true,
                    });
                }
            });
        }
    </script>
@endsection