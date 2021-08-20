<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Detail_transaksi extends Model
{
    use HasFactory;

    protected $fillable = [
        'kode_transaksi',
        'id_item',
        'jumlah',
        'total_hraga'
    ];
}
