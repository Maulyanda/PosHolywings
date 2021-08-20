<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Item;

class ItemController extends Controller
{
    
    public function index()
    {
        $items = Item::all();
        return response()->json([
          'status' => 'true',
          'data' => $items
        ], 200);
    }
    
    public function create(Request $request)
    {
        // Menambahkan Item
        $tambah = new Item;
        $tambah->nama = $request->nama;
        $tambah->sku_kode_produk = $request->sku;
        $tambah->harga = $request->harga;

        $tambah->save();

        return response()->json([
            'status' => 'true',
            'message' => 'Item Berhasil Ditambah',
            'data' => $tambah
        ], 200);

    }
    
    public function show($id)
    {
        // Menampilkan Item berdasarkan ID
        $comment= Item::find($id);
        if(is_null($comment))
        {
            return response()->json([
                'status' => 'false',
                'message' => 'Id Item Tidak ditemukan'
              ], 404);
        }
    
        return response()->json([
            'status' => 'true',
            'data' => $comment
          ], 200);
    }
    
    public function update(Request $request, $id)
    {
        // Mengubah ITEM
        $checkItem = Item::firstWhere('id', $id);
        if($checkItem){
            $item = Item::find($id);
            $item->nama = $request->nama;
            $item->harga = $request->harga;
            $item->save();

            return response()->json([
                'status' => 'true',
                'message' => 'Item Berhasil Diubah',
                'data' => $item
            ], 200);
        } else {
            return response()->json([
                'status' => 'false',
                'message' => 'Item tidak ditemukan'
            ], 404);
        }
    }

    public function destroy($id)
    {
        // Menghapus Item
        $checkItem = Item::firstWhere('id', $id);
        if($checkItem){
            Item::destroy($id);

            return response([
                'status' => 'true',
                'message' => 'Item Berhasil Dihapus'
            ], 200);
        } else {
            return response([
                'status' => 'false',
                'message' => 'Item tidak ditemukan'
            ], 404);
        }
    }
}
