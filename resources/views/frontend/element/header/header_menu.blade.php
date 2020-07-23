<div class="header-navigation sticky-nav">
    <div class="container-fluid">
        <div class="row">
            <!-- Logo Start -->
            <div class="col-md-6 col-sm-6">
                <div class="logo">
                    <a href="{{ url('/') }}">
                        <img src="{{ asset(@$website_information->logo_one) }}" alt="" />
                    </a>
                </div>
            </div>
            <!-- Logo End -->
            <div class="col-md-6 col-sm-6">
                <div class="header_account_area">
                    <div class="main-navigation d-none d-lg-block">
                        <ul>
                            <li class="menu-dropdown">
                                <a href="{{ url('/') }}">Home</a>
                            </li>

                            <li class="menu-dropdown">
                                <a href="{{ route('booking.rootPlan') }}">Route Plan</a>
                            </li>

                            <li class="menu-dropdown">
                                <a href="{{ route('user.booking') }}">Booking</a>
                            </li>

                            @if(Auth::guard('customer')->user())
                                <li class="menu-dropdown">
                                    <a href="javascript:void(0)">{{Auth::guard('customer')->user()->name}}</a>
                                    <ul class="sub-menu">
                                            <li class="menu-dropdown position-static">
                                                <a href="{{ route('user.customerProfile') }}">Profile</a>
                                            </li>
                                            <li class="menu-dropdown position-static">
                                                <a href="{{ route('user.logout') }}">Logout</a>
                                            </li>
                                    </ul>
                                </li>
                            @else
                                <li class="menu-dropdown">
                                    <a href="{{ route('user.login') }}">Login</a>
                                </li>
                            @endif
                        </ul>
                    </div>
                
                    <!--Contact info Start -->
                    <div class="contact-link">
                        <div class="phone">
                            <i class="fa fa-phone"></i>
                            <a href="tel:(+800)345678">{{ $website_information->phone_one }}</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- mobile menu -->
        <div class="mobile-menu-area">
            <div class="mobile-menu">
                <nav id="mobile-menu-active">
                    <ul class="menu-overflow">
                        <li>
                            <a href="{{ url('/') }}">HOME</a>
                        </li>
                        <li>
                            <a href="{{ route('booking.rootPlan') }}">Route Plan</a>
                        </li>
                        <li>
                                <a href="{{ route('user.booking') }}">Booking</a>
                            </li>
                       @if(Auth::guard('customer')->user())
                            <li>
                                <a href="javascript:void(0)">{{Auth::guard('customer')->user()->name}}</a>
                                <ul>
                                        <li>
                                            <a href="{{ route('user.customerProfile') }}">Profile</a>
                                        </li>
                                        <li>
                                            <a href="{{ route('user.logout') }}">Logout</a>
                                        </li>
                                </ul>
                            </li>
                        @else
                            <li>
                                <a href="{{ route('user.login') }}">Login</a>
                            </li>
                        @endif
                        {{-- <li><a href="contact.html">Contact Us</a></li> --}}
                    </ul>
                </nav>
            </div>
        </div>
        <!-- mobile menu end-->
    </div>
</div>