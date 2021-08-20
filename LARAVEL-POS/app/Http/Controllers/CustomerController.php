<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Customer;

class CustomerController extends Controller
{
    public function index()
    {
        $customer = Customer::all();
        return response()->json([
          'status' => 'true',
          'data' => $customer
        ], 200);
    }

    public function show($id)
    {
        // Menampilkan Customer berdasarkan Nomor Handphone
        $customer = Customer::firstWhere('nomor_handphone', $id);
        if($customer)
        {
            $data = Customer::where('nomor_handphone', $id)->first();
            return response()->json([
                'status' => 'true',
                'data' => $data
            ], 200);
        }else{
            return response()->json([
                'status' => 'false',
                'message' => 'Customer Tidak ditemukan'
            ], 404);
        }        
    }

    public function create(Request $request)
    {
        // Menambahkan Customer
        $tambah = new Customer;
        $checkCustomer = Customer::firstWhere('nomor_handphone', $request->nomor_handphone);
        if($checkCustomer){
            return response()->json([
                'status' => 'false',
                'message' => 'Customer dengan nomor handphone yang anda masukkan sudah ada, coba dengan nomor handphone lainnya.'
            ], 404);
        }else{
            $tambah->nomor_handphone = $request->nomor_handphone;
            $tambah->nama = $request->nama;
            $tambah->alamat = $request->alamat;

            $tambah->save();

            return response()->json([
                'status' => 'true',
                'message' => 'Customer Berhasil Ditambah',
                'data' => $tambah
            ], 200);
        }     
    }

    public function update(Request $request, $id)
    {
        // Mengubah CUSTOMER
        $checkCustomer = Customer::firstWhere('nomor_handphone', $id);
        if($checkCustomer){

            $customer = Customer::where('nomor_handphone',$id)->update([
                'nama' => $request->nama,
                'alamat' => $request->alamat
            ]);

            return response()->json([
                'status' => 'true',
                'message' => 'Customer Berhasil Diubah',
                'data' => $customer
            ], 200);
        } else {
            return response()->json([
                'status' => 'false',
                'message' => 'Customer tidak ditemukan'
            ], 404);
        }
    }

    public function destroy($id)
    {
        // Menghapus CUSTOMER
        $checkItem = Customer::firstWhere('nomor_handphone', $id);
        if($checkItem){
            Customer::where('nomor_handphone',$id)->delete();

            return response([
                'status' => 'true',
                'message' => 'Customer Berhasil Dihapus'
            ], 200);
        } else {
            return response([
                'status' => 'false',
                'message' => 'Customer tidak ditemukan'
            ], 404);
        }
    }
    
    
}
