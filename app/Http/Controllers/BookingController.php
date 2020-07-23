<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

use App\Booking;
use App\AreaSetup;

use DB;
class BookingController extends Controller
{  
    public function index(){
        $title = "Booking List";
        $booking_list = DB::table('tbl_booking')
                        ->select('tbl_booking.*','tbl_booking.id as bookingId','tbl_booking.status as bookingStatus','tbl_clients.*','tbl_clients.id as clientId','tbl_area.name as locationName')
                        ->join('tbl_clients','tbl_clients.id','=','tbl_booking.client_id')
                        ->join('tbl_area','tbl_area.id','=','tbl_booking.location_id')
                        ->where('tbl_clients.id',\Auth::guard('customer')->user()->id)
                        ->get();
        /*
        Booking::where('client_id',\Auth::guard('customer')->user()->id)->get()*/;
        return view('frontend.customer.booking.index')->with(compact('title','booking_list'));
    }

    public function create(){
    	$title = "Create New Booking";
    	$formLink = "user.bookingCreate";
    	$buttonName = "Save";


        $toDayDate = date("Y-m-d");
        $orderPrefix = "co-".date('ymd')."-";

        $maxOrderNo = Booking::where('date',$toDayDate)->max('order_no');

        if ($maxOrderNo)
        {
            $maxOrderNo = substr($maxOrderNo, strlen($orderPrefix));
            $orderNo = $orderPrefix.str_pad($maxOrderNo + 1, 5, '0', STR_PAD_LEFT);
        }
        else
        {
            $orderNo = $orderPrefix."00001";
        }

        $location_list = AreaSetup::orderBy('name','asc')->get();

        if(count(request()->all()) > 0){

        	if (request()->booking_date)
	        {
	            $booking_date = date('Y-m-d',strtotime(request()->booking_date));
	        }
	        else
	        {
	            $booking_date = "";
	        }

	        Booking::create([
                'client_id'=>\Auth::guard('customer')->user()->id,
	            'order_no' => $orderNo,
                'date' => $booking_date,
                'travel_time' => request()->travel_time,
                'seat_qty' => request()->seat_qty,
                'location_id' => request()->location_id,
                'puckup_location' => request()->puckup_location,
                'drop_location' => request()->drop_location,
	            'note' => request()->note,
	            'status' => '0',
	        ]);
        	return redirect(route('user.booking'))->with('message','Your Booking Created Successfully');
        }
    	return view('frontend.customer.booking.create')->with(compact('title','formLink','buttonName','orderNo','location_list'));
    }

    public function view($id){
        $title = "View Your Booking";
        $booking = Booking::find($id);
        $location = AreaSetup::find($booking->location_id);
        return view('frontend.customer.booking.view')->with(compact('title','booking','location'));
    }


    public function edit($id){
    	$title = "Edit Your Booking";
    	$buttonName = "Update";

        $booking = Booking::find($id);
        $location_list = AreaSetup::orderBy('name','asc')->get();
        if(count(request()->all()) > 0){
            if (request()->booking_date)
            {
                $booking_date = date('Y-m-d',strtotime(request()->booking_date));
            }
            else
            {
                $booking_date = "";
            }
            $booking->update([
                'date' => $booking_date,
                'travel_time' => request()->travel_time,
                'seat_qty' => request()->seat_qty,
                'location_id' => request()->location_id,
                'puckup_location' => request()->puckup_location,
                'drop_location' => request()->drop_location,
                'note' => request()->note,
                'status' => '0',
            ]);

        	return redirect(route('user.booking'))->with('message','Your Booking Updated Successfully');
        }
    	return view('frontend.customer.booking.edit')->with(compact('title','buttonName','booking','location_list'));
    }

    public function rootPlan(){
        $title = "Route Plan";
        $root_list = AreaSetup::where('status',1)->get();
        return view('frontend.root_plan.index')->with(compact('root_list','title'));
    }

    public function rootPlanDetails($id){
        $route_details = AreaSetup::find($id);
        $title = "Route Plan Details of ".$route_details->name;
        return view('frontend.root_plan.details')->with(compact('title','route_details'));
    }

}
