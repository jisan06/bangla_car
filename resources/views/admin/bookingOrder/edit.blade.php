@extends('admin.layouts.masterAddEdit')

@section('card_body')
@php
    $seat_qty_list = array('1'=>'1','2'=>'2','3'=>'3','4'=>'4','5'=>'5');
@endphp
    <div class="card-body">
        <input type="hidden" name="clientId" value="{{$client->id}}">
        <input type="hidden" name="bookingId" value="{{$booking->id}}">
        <div class="row">
            <div class="col-lg-12 col-sm-12">
                <div class="form-group">
                    <label for="email">Profile Picture
                        {{-- <span class="required">*</span> 
                        (<span style="color: red;font-size:15px">Image size 600*600 px</span>) --}}
                    </label>
                    <br>
                    {{-- <input type="file" name="image" class="form-control" id="image" style="padding: 10px;"> --}}
                    @if (file_exists($client->image))
                        <img src="{{ asset($client->image) }}" height="100px">
                    @endif
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <label for="name">Client Name</label>
                <div class="form-group">
                    <input  type="text" class="form-control" value="{{$client->name}}" name="name" placeholder="client name" readonly>
                </div>
            </div>

            <div class="col-md-4">
                <label for="phone">Client Phone No</label>
                <div class="form-group">
                    <input type="text" class="form-control " name="phone" placeholder="phone no" value="{{$client->phone}}" readonly>
                </div>
            </div>

            <div class="col-md-4">
                <label for="email">Client Email</label>
                <div class="form-group">
                    <input type="email" class="form-control " name="email" placeholder="email address" value="{{$client->email}}" readonly>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <label for="booking_date">Booking Date</label>
                <div class="form-group">
                    <input  type="text" class="form-control datepicker" value="{{date('d-m-Y',strtotime($booking->date))}}" id="booking_date" name="booking_date" placeholder="Select Delivery Date" required="" readonly="">
                </div>
            </div>

            <div class="col-md-4">
                <label for="travel_time">Recomended Travel Time</label>
                <div class="form-group">
                    <input type="text" class="form-control " name="travel_time" placeholder="example: 3 pm" value="{{$booking->travel_time}}" required="">
                </div>
            </div>

            <div class="col-md-4">
                <label for="seat_qty">Recomended Seat QTY</label>
                <div class="form-group">
                    <select class="form-control" name="seat_qty" required="">
                        <option value="">Select Quantity</option>
                        @foreach ($seat_qty_list as $key=>$value)
                            @php
                                if($booking->seat_qty == $key){
                                    $selected = 'selected';
                                }else{
                                    $selected = '';
                                }
                            @endphp
                           <option {{$selected  }} value="{{$key}}">{{$value}}</option>
                        @endforeach
                    </select>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-8">
                        <label for="location_id">Location</label>
                        <div class="form-group">
                            <select class="form-control{{--  chosen-select --}}" name="location_id" required="">
                                <option value="">Select Location</option>
                                @foreach ($location_list as $location)
                                    @php
                                        if($booking->location_id == $location->id){
                                            $selected = 'selected';
                                        }else{
                                            $selected = '';
                                        }
                                    @endphp
                                   <option {{$selected}} value="{{$location->id}}">{{$location->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <label for="charge">Travel Charge</label>
                        <div class="form-group">
                            <input type="text" class="form-control " name="charge" value="{{$location_info->charge}}" required="">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <label for="puckup_location">Pickup Location</label>
                        <div class="form-group">
                            <textarea class="form-control" name="puckup_location" required>{{$booking->puckup_location}}</textarea>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <label for="drop_location">Drop Location</label>
                        <div class="form-group">
                            <textarea class="form-control" name="drop_location" required>{{$booking->drop_location}}</textarea>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <label for="drop_location">Travel Status</label>
                        <div class="form-group" style="border: 1px solid #a6a8ab;padding: 5px 10px;border-radius: 5px;">
                            <label>
                                <input type="radio" name="travel_status" value="0"> <span style="    margin-left: 5px;">Pending</span>
                            </label>

                            <label style="margin-left: 30px;">
                                <input type="radio" name="travel_status" value="1"> <span style="    margin-left: 5px;">Completed</span>
                            </label>
                        </div>
                    </div>
                </div>
                <br>
            </div>

            <div class="col-md-6">
                <label for="note">Note</label>
                <textarea class="form-control" name="note" rows="15">{{$booking->note}}</textarea>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <label for="email">Client Address</label>
                <div class="form-group">
                    <textarea class="form-control" name="address" rows="4">{{$client->address}}</textarea>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        document.forms['form'].elements['travel_status'].value = "{{$booking->travel_status}}";
    </script>
@endsection
