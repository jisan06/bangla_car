<!DOCTYPE html>

<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="MobileOptimized" content="320" />

	<meta name="csrf-token" content="{{ csrf_token() }}">
	<meta name="title" content="{{ @$metaTag['meta_title'] }}">
	<meta name="keywords" content="{{ @$metaTag['meta_keyword'] }}">
	<meta name="description" content="{{ @$metaTag['meta_keyword'] }}" />
	<meta name="author" content="{{@$website_information->website_name}}" />
	<!-- Favicon -->
	<link rel="icon" type="image/icon" href="{{ asset('/').@$website_information->fav_icon }}">

	{{-- website title --}}
	<title>
		{{ @$website_information->website_name }} 
		@if(@$title) {{ @$website_information->prefix_title }} @endif {{ @$title }}
	</title>

	@include('frontend.element.header.header_asset')
</head>

	<body>
		<div id="main">
			<header class="main-header">
				@include('frontend.element.header.header_top')
				@include('frontend.element.header.header_menu')
			</header>
			@if(URL::current() != url('/'))
				<section class="breadcrumb-area">
	                <div class="container">
	                    <div class="row">
	                        <div class="col-md-12">
	                            <div class="breadcrumb-content">
	                            	@yield('header_link')
	                                
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </section>
            @endif

			<div class="main_content">
				@yield('content')
			</div>
			

			<footer class="footer-area">
				@include('frontend.element.footer.footer_bottom')
			</footer>
		</div>
		@include('frontend.element.footer.footer_asset')
		@yield('custom_js')
	</body>
</html>