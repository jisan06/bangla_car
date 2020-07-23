<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Booking;
use App\Client;
use App\Admin;
use App\AreaSetup;

use DB;

class BookingOrderController extends Controller
{
    public function index()
    {
    	$title = "Booking Order Setup";

    	$booking_list = DB::table('tbl_booking')
                        ->select('tbl_booking.*','tbl_booking.id as bookingId','tbl_booking.status as bookingStatus','tbl_clients.*','tbl_clients.id as clientId','tbl_area.name as locationName')
                        ->leftjoin('tbl_clients','tbl_clients.id','=','tbl_booking.client_id')
                        ->leftjoin('tbl_area','tbl_area.id','=','tbl_booking.location_id')
                        ->get();

    	return view('admin.bookingOrder.index')->with(compact('title','booking_list'));
    }

    public function add()
    {
    	$title = "Add Booking Order";
    	$formLink = "Booking.save";
    	$buttonName = "Save";

    	$services = Service::orderBy('name','asc')->get();
    	$serviceTypes = ServiceType::orderBy('name','asc')->get();
        $deliveryTypes = DeliveryType::orderBy('name','asc')->get();

    	$zones = DB::table('view_zones')->select('view_zones.*')->orderBy('view_zones.zone_type')->get();

        $toDayDate = date("Y-m-d");
        $orderPrefix = "co-".date('ymd')."-";

        $maxOrderNo = Booking::where('date',$toDayDate)->where('booked_type','Client')->max('order_no');

        if ($maxOrderNo)
        {
            $maxOrderNo = substr($maxOrderNo, strlen($orderPrefix));
            $orderNo = $orderPrefix.str_pad($maxOrderNo + 1, 5, '0', STR_PAD_LEFT);
        }
        else
        {
            $orderNo = $orderPrefix."00001";
        }

        // echo $orderNo; exit();

    	return view('admin.bookingOrder.add')->with(compact('title','formLink','buttonName','services','serviceTypes','zones','orderNo','deliveryTypes'));
    }

    public function save(Request $request)
    {
    	// dd($request->all());

        if ($request->bookingDate)
        {
            $bookingDate = date('Y-m-d',strtotime($request->bookingDate));
        }
        else
        {
            $bookingDate = "";
        }

        $senderZone = explode(',',$request->senderZone);
        $senderZoneId = $senderZone[0];
        $senderZoneType = $senderZone[1];

        $receiverZone = explode(',',$request->receiverZone);
        $receiverZoneId = $receiverZone[0];
        $receiverZoneType = $receiverZone[1];

        if ($request->clientId)
        {
            $senderId = $request->clientId;
        }
        else
        {
            if ($request->senderType == "Client")
            {            
                $client = Client::create([
                    'user_role_id' => 4,
                    'name' => $request->senderName,
                    'phone' => $request->senderPhoneNumber,
                    'address' => $request->address,
                    'password' => bcrypt('123456'),
                    'created_by' => $this->userId,
                ]);
            }
            else
            {
                $user = Admin::create( [           
                    'role' => 12,     
                    'name' => $request->senderName,
                    'phone' => $request->senderPhoneNumber,
                    'password' => bcrypt('123456'),                      
                ]);

                $client = Marchant::create([
                    'user_id' => $user->id,
                    'user_role_id' => 12,
                    'name' => $request->senderName,
                    'contact_person_phone' => $request->senderPhoneNumber,
                    'address' => $request->address,
                    'created_by' => $this->userId,
                ]);
            }

            $senderId = $client->id;
        }        

        Booking::create([
            'order_no' => $request->orderNo,
            'date' => $bookingDate,
            'booked_type' => $request->senderType,
            'sender_id' => $senderId,
            'sender_name' => $request->senderName,
            'sender_phone' => $request->senderPhoneNumber,
            'sender_zone_type' => $senderZoneType,
            'sender_zone_id' => $senderZoneId,
            'sender_address' => $request->senderAddress,
            'receiver_name' => $request->receiverName,
            'receiver_phone' => $request->receiverPhoneNumber,
            'receiver_zone_type' => $receiverZoneType,
            'receiver_zone_id' => $receiverZoneId,
            'receiver_address' => $request->receiverAddress,
            'remarks' => $request->remarks,
            'courier_type_id' => $request->serviceId,
            'delivery_type_id' => $request->serviceTypeId,
            'charge_name' => $request->chargeName,
            'delivery_charge_unit' => $request->deliveryChargeUnit,
            'uom' => $request->uom,
            'delivery_charge' => $request->deliveryCharge,
            'cod' => $request->cod,
            'delivery_duration_id' => $request->deliveryTypeId,
            'created_by' => $this->userId,
        ]);

        return redirect(route('bookingOrder.index'))->with('msg','Order Booked Successfully');
    }

    public function edit($bookedOrderId)
    {
    	$title = "Edit Booked Order";
    	$formLink = "bookingOrder.update";
    	$buttonName = "Update";

        $booking = Booking::find($bookedOrderId);
        $client = Client::where('id',$booking->client_id)->first();
        $location_list = AreaSetup::orderBy('name','asc')->get();
        $location_info = AreaSetup::find($booking->location_id);

    	return view('admin.bookingOrder.edit')->with(compact('title','formLink','buttonName','location_list','booking','client','location_info'));
    }

    public function update(Request $request)
    {
        $booking = Booking::find($request->bookingId);
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
                'travel_status' => request()->travel_status,/*
                'status' => '1',*/
            ]);

        return redirect(route('bookingOrder.index'))->with('msg','Bookking Updated Successfully');
    }

    public function view($bookedOrderId)
    {
    	$title = "View Booked Order";

    	$bookedOrder = Booking::select('tbl_booking_orders.*','tbl_services.name as serviceName','tbl_service_types.name as serviceTypeName','tbl_delivery_types.name as deliveryTypeName')
    		->leftJoin('tbl_services','tbl_services.id','=','tbl_booking_orders.courier_type_id')
            ->leftJoin('tbl_service_types','tbl_service_types.id','=','tbl_booking_orders.delivery_type_id')
    		->leftJoin('tbl_delivery_types','tbl_delivery_types.id','=','tbl_booking_orders.delivery_duration_id')
    		->where('tbl_booking_orders.id',$bookedOrderId)
    		->orderBy('id','desc')
    		->first();

    	$senderInfo = DB::table('view_zones')
    		->select('view_zones.*')
    		->where('zone_type',$bookedOrder->sender_zone_type)
    		->where('zone_id',$bookedOrder->sender_zone_id)
    		->first();

    	$receiverInfo = DB::table('view_zones')
    		->select('view_zones.*')
    		->where('zone_type',$bookedOrder->receiver_zone_type)
    		->where('zone_id',$bookedOrder->receiver_zone_id)
    		->first();

    	// dd($receiverInfo);

    	return view('admin.BookingOrder.view')->with(compact('title','bookedOrder','senderInfo','receiverInfo'));
    }

    public function getClientInfo(Request $request)
    {
        $senderPhoneNumber = $request->senderPhoneNumber;

        // $clientInfo = Client::where('phone',$senderPhoneNumber)->first();
        // $clientInfo = Client::where('phone','like','%'.$senderPhoneNumber.'%')->first();

        $clientInfo = DB::table('view_clients')
            ->select('view_clients.*')
            ->where('clientPhone',$senderPhoneNumber)
            // ->where('clientPhone','like','%'.$senderPhoneNumber.'%')
            ->first();

        // dd($clientInfo);

        if ($clientInfo)
        {
            $senderName = $clientInfo->clientName;
            $senderAddress = $clientInfo->clientAddress;
            $clientId = $clientInfo->clientId;
            $clientType = $clientInfo->clientType;
            $clientUserRoleId = $clientInfo->clientUserRoleId;
        }
        else
        {
            $senderName = "";
            $senderAddress = "";
            $clientId = "";
            $clientType = "";
            $clientUserRoleId = "";
        }
        
        if($request->ajax())
        {
            return response()->json([
                'senderName' => $senderName,
                'senderAddress'=> $senderAddress,
                'clientId'=> $clientId,
                'clientType'=> $clientType,
                'clientUserRoleId'=> $clientUserRoleId,
            ]);
        }
    }

    public function getChargeInfo(Request $request)
    {
        if ($request->senderType == 'Merchant' && $request->clientId != '')
        {
            $charge = ChargeForMerchant::where('merchant_id',$request->clientId)
                ->where('service_type_id',$request->serviceTypeId)
                ->where('service_id',$request->serviceId)
                ->first();
        }
        else
        {
            $charge = ChargeForClient::where('service_type_id',$request->serviceTypeId)
                ->where('service_id',$request->serviceId)
                ->first();
        }

        if ($charge)
        {
            $chargeName = $charge->name;
            $charge = $charge->charge;
        }
        else
        {
            $chargeName = "";
            $charge = "";
        }
        
    	
        if($request->ajax())
        {
            return response()->json([
                'chargeName'=>$chargeName,
                'charge'=>$charge,
            ]);
        }
    }

    public function delete(Request $request)
    {
    	Booking::where('id',$request->bookingOrderId)->delete();
    }

    public function status(Request $request)
    {
        $Booking = Booking::find($request->bookingOrderId);

        if ($Booking->status == 1)
        {
            $Booking->update( [               
                'status' => 0                
            ]);
        }
        else
        {
            $Booking->update( [               
                'status' => 1                
            ]);
        }
    }
}
