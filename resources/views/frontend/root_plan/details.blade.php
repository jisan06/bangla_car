@extends('frontend.layouts.master') 

@section('content')
@section('header_link')
    <ul class="breadcrumb-links">
        <li><a href="{{ url('/') }}">Home</a></li>
        <li><a href="{{ route('booking.rootPlan') }}">Route Plan</a></li>
        <li>Route Plan Details</li>
    </ul>
@endsection
<style type="text/css">
    .routeDetails {
        color: #4e4e4e;
        font-weight: bold;
        font-size: 16px;
    }
</style>

<div class="login-register-area mb-60px mt-30px">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 ml-auto mr-auto">
                <div class="login-register-wrapper">
                    <div class="login-register-tab-list nav">
                        <a class="active" data-toggle="tab">
                            <h4>{{$title}}</h4>
                        </a>
                    </div>
                    <div class="tab-content">
                        <div id="lg1" class="tab-pane active">
                            <div class="login-form-container" style="height: 200px;background: #fbfbfb;text-align: center;">
                                <div class="login-register-form">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 ml-auto mr-auto">
                                            <span class="routeDetails">{{$route_details->root_plan}}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection