{{-- <div class="header-top-nav">
    <div class="container-fluid">
        <div class="row">
            <!--Left Start-->
            <div class="col-lg-4 col-md-4">
                <div class="left-text">
                </div>
            </div>
            <div class="col-lg-8 col-md-8 text-right">
                <div class="header-right-nav">
                    <div class="dropdown-navs">
                        <ul>
                            <li class="dropdown xs-after-n">
                                <a class="angle-icon" href="#">Account</a>
                                <ul class="dropdown-nav">
                                    @if(Auth::guard('customer')->user())
                                        <li><a href="{{ route('user.booking') }}">Booking</a></li>
                                        <li><a href="{{ route('user.logout') }}">Logout</a></li>
                                    @else
                                        <li><a href="{{route('user.login')}}">Login</a></li>
                                    @endif
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div> --}}