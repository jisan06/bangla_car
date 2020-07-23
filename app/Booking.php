<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
	protected $table = "tbl_booking";

    protected $fillable = [
    	'client_id','order_no','date','travel_time','seat_qty','location_id','puckup_location','drop_location','note','travel_status','status','created_by','updated_by'
    ];

	protected $hidden = [
		'created_at','updated_at'
	];
}
