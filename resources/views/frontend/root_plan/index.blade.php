@extends('frontend.layouts.master') 

@section('content')
@section('header_link')
    <ul class="breadcrumb-links">
        <li><a href="{{ url('/') }}">Home</a></li>
        <li>Route Plan</li>
    </ul>
@endsection
<div class="login-register-area mb-60px">
    <div class="container">
        <div class="card-body">
            <h3 class="text-center">{{$title}}</h3>

            <div class="table-responsive booking_section">
                <table id="dataTable" class="table table-bordered table-striped customer_table">
                    <thead>
                        <tr>
                            <th width="25px">SL</th>
                            <th>Root Name</th>
                            <th width="120px">Fare</th>
                            <th class="text-center" rowspan="2" width="50px">Details</th>
                        </tr>

                        <tbody>
                            @php
                                $sl = 0;
                                foreach ($root_list as $root) {
                                    $sl++;
                                @endphp
                                <tr>
                                    <td>{{$sl}}</td>
                                    <td>{{$root->name}}</td>
                                    <td>{{$root->charge}}</td>
                                    <td>
                                         <a target="_blank" href="{{ route('booking.routePlaneDetails',$root->id) }}" class="">
                                            <i class="fa fa-eye"></i> View
                                         </a>
                                    </td>
                                </tr>
                            @php
                                }
                            @endphp
                        </tbody>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>  
    </div>
</div>
@endsection