<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Transaksi;
use App\Models\Item;
use App\Models\Customer;
use App\Models\Detail_transaksi;

class TransaksiController extends Controller
{
    //
    public function transaksi(Request $request)
    {
        $q = Transaksi::max('id');
        $prx = date('dmY');

        if($q > 0){
            $tmp = ((int)$q) + 1;
            $kd = 'TRX-'.$prx.sprintf("%06s", $tmp);

        }else{
            $kd = 'TRX-'.$prx.sprintf("%06s", '1');
        }

        $item = $request->id_item;
        $array = explode('.', $item);

        $transaksi = new Transaksi;
        $transaksi->kode_transaksi = $kd;
        $transaksi->nomor_handphone = $request->nomor_handphone;
        $transaksi->save();
        
        foreach ($array as $values){
            $jumlah = explode('-', $values);

            $checkItem = Item::where('id', $jumlah[0])->first();
            $harga = $checkItem->harga*$jumlah[1];

            $data = Detail_transaksi::create([
                'kode_transaksi' => $kd,
                'id_item' => $jumlah[0],
                'jumlah' => $jumlah[1],
                'total_hraga' => $harga
            ]);       
        }

        return response()->json([
            'status' => 'true',
            'message' => 'Transaksi Berhasil Ditambah',
            'data' => $transaksi
        ], 200);
    }


    public function cekTransaksi(Request $request)
    {
        // Menampilkan Customer berdasarkan Nomor Handphone
        $kodeTransaksi = $request->kode_transaksi;
        $checkTransaksi = Transaksi::firstWhere('kode_transaksi', $kodeTransaksi);
        
        if($checkTransaksi)
        {
            $data = Detail_transaksi::join('items', 'detail_transaksis.id_item', '=', 'items.id')
            ->select('detail_transaksis.*',
             'items.nama as nama_item')
            ->where('kode_transaksi', $kodeTransaksi)->get();
            
            $pelanggan = Transaksi::join('customers', 'transaksis.nomor_handphone', '=', 'customers.nomor_handphone')
            ->select('transaksis.kode_transaksi',
             'customers.nama as nama_customer',
             'transaksis.nomor_handphone')
            ->where('kode_transaksi', $kodeTransaksi)->get();

            return response()->json([
                'status' => 'true',
                'pelanggan' => $pelanggan,
                'pembelian' => $data
            ], 200);
        }else{
            return response()->json([
                'status' => 'false',
                'message' => 'Transaksi Tidak ditemukan'
            ], 404);
        }        
    }
}
