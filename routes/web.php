<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Auth::routes();

// Route::get('/','HomeController@index')->name('admin.index');

Route::prefix('admin')->group(function()
{
	Route::middleware('auth:admin')->group(function()
	{
		Route::group(['middleware'=>'menuPermission'],function()
		{
			//Dashboard Link url
			Route::get('/','HomeController@index')->name('admin.index');

			// Menu 
			Route::get('/menu','Admin\MenuController@index')->name('menu.index');
			Route::get('/menu-add','Admin\MenuController@add')->name('menu.add');
			Route::post('/menu-save','Admin\MenuController@save')->name('menu.save');
			Route::get('/menu-edit/{id}','Admin\MenuController@edit')->name('menu.edit');
			Route::post('/menu-update','Admin\MenuController@update')->name('menu.update');
			Route::post('/menu-status','Admin\MenuController@status')->name('menu.status');
			Route::post('/menu-delete','Admin\MenuController@delete')->name('menu.delete');
			Route::post('/menu-max-order-by','Admin\MenuController@maxOrderBY')->name('menu.maxOrderBy');

			// Menu Action
			Route::get('/menu-action/{id}','Admin\MenuActionController@index')->name('menuAction.index');
			Route::get('/menu-action-add/{menuId}','Admin\MenuActionController@add')->name('menuAction.add');
			Route::post('/menu-action-save','Admin\MenuActionController@save')->name('menuAction.save');
			Route::get('/menu-action-edit/{menuActionId}','Admin\MenuActionController@edit')->name('menuAction.edit');
			Route::post('/menu-action-update','Admin\MenuActionController@update')->name('menuAction.update');
			Route::post('/menu-action-status','Admin\MenuActionController@status')->name('menuAction.status');
			Route::post('/menu-action/delete','Admin\MenuActionController@delete')->name('menuAction.delete');

			// Menu Action Type
			Route::get('/menu-action-type','Admin\MenuActionTypeController@index')->name('menuActionType.index');
			Route::get('/menu-action-type-add','Admin\MenuActionTypeController@add')->name('menuActionType.add');
			Route::post('/menu-action-type-save','Admin\MenuActionTypeController@save')->name('menuActionType.save');
			Route::get('/menu-action-type-edit/{id}','Admin\MenuActionTypeController@edit')->name('menuActionType.edit');
			Route::post('/menu-action-type-update','Admin\MenuActionTypeController@update')->name('menuActionType.update');
			Route::post('/menu-action-type-status','Admin\MenuActionTypeController@status')->name('menuActionType.status');
			Route::post('/menu-action-delete','Admin\MenuActionTypeController@delete')->name('menuActionType.delete');

			//User Manage
			Route::get('/user','Admin\AdminController@index')->name('user.index');
			Route::get('/user-add','Admin\AdminController@addUser')->name('user.add');
			Route::post('/user-save','Admin\AdminController@saveUser')->name('user.save');
			Route::get('/user-edit/{id}','Admin\AdminController@editUser')->name('user.edit');
			Route::post('/user-upate','Admin\AdminController@updateUser')->name('user.update');
			Route::get('/user-change-password/{id}','Admin\AdminController@password')->name('user.changePassword');
			Route::post('/user-save-password','Admin\AdminController@passwordChange')->name('user.savePassword');
			Route::get('/user-profile/{id}','Admin\AdminController@userProfile')->name('user.profile');
			Route::post('/user-delete','Admin\AdminController@deleteUser')->name('user.delete');
			Route::post('/user-status','Admin\AdminController@changeUserStatus')->name('user.status');

			//User Roll Manage
			Route::get('/user-role','Admin\UserRoleController@index')->name('userRole.index');
			Route::get('/user-role-add','Admin\UserRoleController@add')->name('userRole.add');
			Route::post('/user-role-save','Admin\UserRoleController@save')->name('userRole.save');
			Route::get('/user-role-edit/{id}','Admin\UserRoleController@edit')->name('userRole.edit');
			Route::post('/user-role-upate','Admin\UserRoleController@update')->name('userRole.update');
			Route::post('/user-role-delete','Admin\UserRoleController@delete')->name('userRole.delete');
			Route::post('/user-role-status','Admin\UserRoleController@status')->name('userRole.status');
			Route::get('/user-role-permission/{id}','Admin\UserRoleController@permission')->name('userRole.permission');
			Route::post('/user-role-permission-update','Admin\UserRoleController@permissionUpdate')->name('userRole.permissionUpdate');
		
			//Site Information section
			Route::get('/website-information','Admin\WebsiteInformationController@index')->name('websiteInformation.index');
			Route::get('/website-information-add','Admin\WebsiteInformationController@add')->name('websiteInformation.add');
			Route::post('/website-information-save','Admin\WebsiteInformationController@save')->name('websiteInformation.save');
			Route::get('/website-information-edit/{id}','Admin\WebsiteInformationController@edit')->name('websiteInformation.edit');
			Route::post('/website-information-update','Admin\WebsiteInformationController@update')->name('websiteInformation.update');
		
			//Admin Information section
			Route::get('/admin-panel-information','Admin\AdminPanelInformationController@index')->name('adminPanelInformation.index');
			Route::get('/admin-panel-information-add','Admin\AdminPanelInformationController@add')->name('adminPanelInformation.add');
			Route::post('/admin-panel-information-save','Admin\AdminPanelInformationController@save')->name('adminPanelInformation.save');
			Route::get('/admin-panel-information-edit/{id}','Admin\AdminPanelInformationController@edit')->name('adminPanelInformation.edit');
			Route::post('/admin-panel-information-update','Admin\AdminPanelInformationController@update')->name('adminPanelInformation.update');

			// User Menu 
			Route::get('/front-end-menu','Admin\FrontEndMenuController@index')->name('frontEndMenu.index');
			Route::get('/front-end-menu-add','Admin\FrontEndMenuController@add')->name('frontEndMenu.add');
			Route::post('/front-end-menu-save','Admin\FrontEndMenuController@save')->name('frontEndMenu.save');
			Route::get('/front-end-menu-edit/{id}','Admin\FrontEndMenuController@edit')->name('frontEndMenu.edit');
			Route::post('/front-end-menu-update','Admin\FrontEndMenuController@update')->name('frontEndMenu.update');
			Route::post('/front-end-menu-status','Admin\FrontEndMenuController@status')->name('frontEndMenu.status');
			Route::post('/front-end-menu-menu-status','Admin\FrontEndMenuController@menuStatus')->name('frontEndMenu.menuStatus');
			Route::post('/front-end-menu-footer-menu-status','Admin\FrontEndMenuController@footerMenuStatus')->name('frontEndMenu.footerMenuStatus');
			Route::post('/front-end-menu-delete','Admin\FrontEndMenuController@delete')->name('frontEndMenu.delete');
			Route::post('/front-end-menu-max-order-by','Admin\FrontEndMenuController@maxOrderBY')->name('frontEndMenu.maxOrderBy');

			// Socila Links
			Route::get('/social-link','Admin\SocialLinksController@index')->name('socialLink.index');
			Route::get('/social-link-add','Admin\SocialLinksController@add')->name('socialLink.add');
			Route::post('/social-link-save','Admin\SocialLinksController@save')->name('socialLink.save');
			Route::get('/social-link-edit/{id}','Admin\SocialLinksController@edit')->name('socialLink.edit');
			Route::post('/social-link-update','Admin\SocialLinksController@update')->name('socialLink.update');
			Route::post('/social-link-status','Admin\SocialLinksController@status')->name('socialLink.status');
			Route::post('/social-link-delete','Admin\SocialLinksController@delete')->name('socialLink.delete');

			// Sliders
			Route::get('/sliders','Admin\SlidersController@index')->name('sliders.index');
			Route::get('/sliders-add','Admin\SlidersController@add')->name('sliders.add');
			Route::post('/sliders-save','Admin\SlidersController@save')->name('sliders.save');
			Route::get('/sliders-edit/{id}','Admin\SlidersController@edit')->name('sliders.edit');
			Route::post('/sliders-update','Admin\SlidersController@update')->name('sliders.update');
			Route::post('/sliders-status','Admin\SlidersController@status')->name('sliders.status');
			Route::post('/sliders-delete','Admin\SlidersController@delete')->name('sliders.delete');

			// Pages 
			Route::get('/page','Admin\PageController@index')->name('page.index');
			Route::get('/page-add','Admin\PageController@add')->name('page.add');
			Route::post('/page-save','Admin\PageController@save')->name('page.save');
			Route::get('/page-edit/{id}','Admin\PageController@edit')->name('page.edit');
			Route::post('/page-update','Admin\PageController@update')->name('page.update');
			Route::post('/page-status','Admin\PageController@status')->name('page.status');
			Route::post('/page-delete','Admin\PageController@delete')->name('page.delete');

			// Posts
			Route::get('/post/{id}','Admin\PostController@index')->name('post.index');
			Route::get('/post-add/{pageId}','Admin\PostController@add')->name('post.add');
			Route::post('/post-save','Admin\PostController@save')->name('post.save');
			Route::get('/post-edit/{postId}','Admin\PostController@edit')->name('post.edit');
			Route::post('/post-update','Admin\PostController@update')->name('post.update');
			Route::post('/post-status','Admin\PostController@status')->name('post.status');
			Route::post('/post/delete','Admin\PostController@delete')->name('post.delete');

			// Area/Location Setup
			Route::get('/location','Admin\AreaSetupController@index')->name('location.index');
			Route::get('/location-add','Admin\AreaSetupController@add')->name('location.add');
			Route::post('/location-save','Admin\AreaSetupController@save')->name('location.save');
			Route::get('/location-edit/{id}','Admin\AreaSetupController@edit')->name('location.edit');
			Route::post('/location-update','Admin\AreaSetupController@update')->name('location.update');
			Route::post('/location-status','Admin\AreaSetupController@status')->name('location.status');
			Route::post('/location-delete','Admin\AreaSetupController@delete')->name('location.delete');

			// Client 
			Route::get('/client','Admin\ClientController@index')->name('client.index');
			Route::get('/client-add','Admin\ClientController@add')->name('client.add');
			Route::post('/client-save','Admin\ClientController@save')->name('client.save');
			Route::get('/client-edit/{id}','Admin\ClientController@edit')->name('client.edit');
			Route::post('/client-update','Admin\ClientController@update')->name('client.update');
			Route::post('/client-status','Admin\ClientController@status')->name('client.status');
			Route::post('/client-delete','Admin\ClientController@delete')->name('client.delete');

			// Booking Order 
			Route::get('/booking-order','Admin\BookingOrderController@index')->name('bookingOrder.index');
			Route::get('/booking-order-add','Admin\BookingOrderController@add')->name('bookingOrder.add');
			Route::post('/booking-order-save','Admin\BookingOrderController@save')->name('bookingOrder.save');
			Route::get('/booking-order-edit/{id}','Admin\BookingOrderController@edit')->name('bookingOrder.edit');
			Route::post('/booking-order-update','Admin\BookingOrderController@update')->name('bookingOrder.update');
			Route::post('/booking-order-status','Admin\BookingOrderController@status')->name('bookingOrder.status');
			Route::get('/bookingOrder-view/{id}','Admin\BookingOrderController@view')->name('bookingOrder.view');
			Route::post('/booking-order-delete','Admin\BookingOrderController@delete')->name('bookingOrder.delete');

		});
	});

	//Admin Login Url
	Route::get('/login', 'Auth\AdminLoginController@showLoginForm')->name('admin.login');
	Route::post('/login', 'Auth\AdminLoginController@login');
    Route::post('/logout', 'Auth\AdminLoginController@adminLogout')->name('admin.logout');

    // Password Reset Routes...
    Route::get('/password/reset', 'Auth\AdminForgotPasswordController@passwordForget')->name('admin.password.forget');
    Route::post('/password/email', 'Auth\AdminForgotPasswordController@passwordEmail')->name('admin.password.email');
    Route::get('/new-password/{email}', 'Auth\AdminForgotPasswordController@newPassword')->name('admin.password.newPassword');
    Route::post('/password/save', 'Auth\AdminForgotPasswordController@changePasswordSave')->name('admin.password.save');
});

// Route::get('/home', 'HomeController@index')->name('home');


//Frontend part start here
Route::get('/','FrontendController@index')->name('home.index');

Route::any('/route-plan', 'BookingController@rootPlan')->name('booking.rootPlan');
Route::any('/route-plan-details/{id}', 'BookingController@rootPlanDetails')->name('booking.routePlaneDetails');

Route::prefix('user')->group(function(){
		Route::namespace('Auth\Customer')->group(function () { 
			Route::match(['GET', 'POST'], '/registration', 'CustomerAuthController@registration')->name('user.registration');
			Route::match(['GET'], '/verification', 'CustomerAuthController@completeRegistration')->name('user.verificationLink');

			Route::match(['GET', 'POST'], '/login', 'CustomerAuthController@login')->name('user.login');
		});
	});

	//code for custom/user
	Route::prefix('user')->group(function(){
		//authentication for customer
		Route::middleware('auth:customer')->group(function(){
			Route::any('/dashboard', 'CustomerController@dashboard')->name('user.dashboard');
			Route::any('/profile', 'CustomerController@profile')->name('user.customerProfile');
			Route::any('/profile-edit', 'CustomerController@editProfile')->name('user.editProfile');
			Route::any('/booking', 'BookingController@index')->name('user.booking');
			Route::any('/booking/create', 'BookingController@create')->name('user.bookingCreate');
			Route::any('/booking/edit/{id}', 'BookingController@edit')->name('user.bookingEdit');
			Route::any('/booking/view/{id}', 'BookingController@view')->name('user.bookingView');

			Route::any('/logout', 'Auth\Customer\CustomerAuthController@logout')->name('user.logout');
		});

	});

