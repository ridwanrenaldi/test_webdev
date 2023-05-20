<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;

class Dashboard extends BaseController
{
    public function __construct()
    {
        $this->category     = model('App\Models\Category');
        $this->product      = model('App\Models\Product');
    }

    public function index()
    {
        $data['total_category'] = $this->category->countAll();
        $data['total_product']  = $this->product->countAll();
        return view('admin/dashboard/index', $data);
    }
}
