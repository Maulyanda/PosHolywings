<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// CRUD ITEM
Route::apiResource('/item', App\Http\Controllers\ItemController::class);
Route::get('/item/{id}', [App\Http\Controllers\ItemController::class, 'show']);
Route::post('/item/create', [App\Http\Controllers\ItemController::class, 'create']);
Route::put('/item/update/{id}', [App\Http\Controllers\ItemController::class, 'update']);
Route::delete('/item/delete/{id}', [App\Http\Controllers\ItemController::class, 'destroy']);

// CRUD CUSTOMER
Route::apiResource('/customer', App\Http\Controllers\CustomerController::class);
Route::get('/customer/{id}', [App\Http\Controllers\CustomerController::class, 'show']);
Route::post('/customer/create', [App\Http\Controllers\CustomerController::class, 'create']);
Route::put('/customer/update/{id}', [App\Http\Controllers\CustomerController::class, 'update']);
Route::delete('/customer/delete/{id}', [App\Http\Controllers\CustomerController::class, 'destroy']);

// TRANSAKSI
Route::post('/transaksi/create', [App\Http\Controllers\TransaksiController::class, 'transaksi']);
Route::post('/transaksi/show', [App\Http\Controllers\TransaksiController::class, 'cekTransaksi']);
