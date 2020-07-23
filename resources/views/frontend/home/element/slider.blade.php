{{-- <div class="slider-area">
    <div class="slider-active-3 owl-carousel slider-hm8 owl-dot-style">
        @foreach ($slider_list as $slider)
            <div class="slider-height-6 d-flex align-items-start justify-content-start bg-img" style="background-image: url({{ asset($slider->image) }});">
                <div class="container">
                    <div class="slider-content-1 slider-animated-1 text-left">
                        <span class="animated">{{$slider->first_title}}</span>
                        <h1 class="animated">
                            {{$slider->second_title}} 
                        </h1>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
</div> --}}

<style type="text/css">
    .backgroundDiv{
        background: #9ce0c7;
        padding: 22px 15px;
        opacity: 0.8;
        /* height: 200px; */
        min-height: 194px;
    }

    .left_top_slogan{
        font-weight: bold !important;
    }

    .carListTable{
        width: 100%;
    }

    .carListTable th,.carListTable td{
        border: 1px solid #333;
        padding: 5px;
        font-style: normal;
        font-size: 14px;
        text-transform: capitalize;
    }
</style>

<div class="slider-area">
    <div class="slider-active-3 owl-carousel slider-hm8 owl-dot-style">
        @foreach ($slider_list as $slider)
            <div class="slider-height-6 d-flex align-items-start justify-content-start bg-img" style="background-image: url({{ asset($slider->image) }});">
                <div class="container">
                    <div class="slider-content-1 slider-animated-1 text-left">
                        <span class="animated">
                            {{-- {{$slider->first_title}} --}}
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="backgroundDiv">
                                        <div class="row">
                                            <div class="col-md-4 col-xs-4">
                                                <span class="text-center text-md-left left_top_slogan">ঈদ স্পেশাল</span> 
                                            </div>
                                            <div class="col-md-4 col-xs-4">
                                                <span class="text-center left_top_slogan">ঈদ স্পেশাল</span>  
                                            </div>
                                            <div class="col-md-4 col-xs-4">
                                                <span class="text-center text-md-right left_top_slogan">ঈদ স্পেশাল</span> 
                                            </div>
                                        </div>
                                        <br>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <span style="line-height: 40px;word-spacing: 2px;font-size: 15px;">
                                                    এই ঈদে  <a>Bangla Car</a> নিয়ে এসেছে নিরাপদ বাড়ি পৌঁছানোর কর্মসূচি । আজই রেজিস্ট্রেশন করুন <a class="btn btn-primary" href="{{ route('user.login') }}" style="margin-left: 16px;padding: 2px 5px;font-size: 12px;">Registartion Here</a>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="backgroundDiv" style="padding: 5px 15px;">
                                        <h4 style="text-align: center;font-style: normal;font-weight: bold;">গাড়ি ভাড়ার তালিকা</h4>
                                        <table class="carListTable">
                                            <tr>
                                                <th>Transport Type</th>
                                                <th>Rent (Per Day)</th>
                                                <th>Per KM (Gas)</th>
                                                <th>Per KM (Oil)</th>
                                            </tr>

                                            <tr>
                                                <td>Private Car</td>
                                                <td>BDT 2500</td>
                                                <td>BDT 9</td>
                                                <td>BDT 12</td>
                                            </tr>

                                            <tr>
                                                <td>NOAH</td>
                                                <td>BDT 3000</td>
                                                <td>BDT 11</td>
                                                <td>BDT 15</td>
                                            </tr>

                                            <tr>
                                                <td>Hiace</td>
                                                <td>BDT 3500</td>
                                                <td>BDT 11</td>
                                                <td>BDT 15</td>
                                            </tr>
                                        </table>
                                        <br>
                                       <span>
                                            <span style="display: contents;text-transform: capitalize;font-weight: bold;font-size: 14px;">Note:</span>
                                            <span style="display: contents;text-transform: capitalize;font-size: 13px;">Road, bridge and parking fees should be paid extra</span>
                                        </span>
                                    </div>
                                    
                                </div>
                            </div>
                        </span>
                        <h1 class="animated">
                            {{$slider->second_title}} 
                        </h1>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
</div>