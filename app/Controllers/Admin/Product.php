<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;

class Product extends BaseController
{
    public function __construct()
    {
        $this->category     = model('App\Models\Category');
        $this->product      = model('App\Models\Product');
        $this->uploaddir    = WRITEPATH . 'uploads/product/';
    }



    public function index()
    {
        // ===[Load a CSS And JS File]===
        $data['daterange']      = false;
        $data['icheck']         = false;
        $data['colorpicker']    = false;
        $data['select2']        = false;
        $data['inputmask']      = false;
        $data['switch']         = false;
        $data['summernote']     = false;
        $data['datatables']     = true;

        // ===[Setting View]===
        $data['title']          = 'Table Data';
        $data['breadcrumb']     = [
            'Product'   => site_url('admin/product/index'),
            'Table'     => site_url('admin/product/index'),
        ];
        $data['cardheader'] = [
            'title'     => 'Table',
            'url'       => site_url('admin/product/add'),
            'name'      => 'Add Product',
        ];


        // ===[Fetch Data]===
        $data['data'] = $this->product->findAll();

        // ===[Load View]===
        return view('admin/product/table', $data);
    }



    public function add()
    {
        // ===[Load a CSS And JS File]===
        $data['daterange']      = false;
        $data['icheck']         = false;
        $data['colorpicker']    = false;
        $data['select2']        = true;
        $data['inputmask']      = true;
        $data['switch']         = false;
        $data['summernote']     = false;
        $data['datatables']     = false;

        // ===[Setting View]===
        $data['title']          = 'Form Add';
        $data['cardheader']     = ['title' => 'Form Input'];
        $data['breadcrumb']     = [
            'Product'   => site_url('admin/product/index'),
            'Add'       => site_url('admin/product/index'),
        ];


        // ===[Insert Logic]===
        if ($this->request->getPost()) {

            // ===[Validate Image]===
            if (!$this->validate($this->product->imageRules)) {
                $notif = [
                    'status'    => 'error', 
                    'title'     => 'Oops...', 
                    'message'   => ListHtml($this->validator->getErrors(), '<ul>', '</ul>')
                ];
                return redirect()->to('admin/product/add')->with('notif', $notif)->withInput();

            } else {
                // ===[Save Image]===
                $image = $this->request->getFile('_image_');
                $imgname = NULL;

                if ($image->isValid() && !$image->hasMoved()) {
                    $imgname = $image->getRandomName();
                    $image->move($this->uploaddir, $imgname);
                }
                
                // ===[Insert Data To Database]===
                $insert = [
                    'category_id'           => $this->request->getPost('_category_'),
                    'product_code'          => strtoupper(bin2hex(random_bytes(3))),
                    'product_name'          => $this->request->getPost('_name_'),
                    'product_brand'         => $this->request->getPost('_brand_'),
                    'product_description'   => $this->request->getPost('_description_'),
                    'product_stock'         => $this->request->getPost('_stock_'),
                    'product_capital'       => $this->request->getPost('_capital_'),
                    'product_price'         => $this->request->getPost('_price_'),
                    'product_discount'      => $this->request->getPost('_discount_'),
                    'product_rating'        => $this->request->getPost('_rating_'),
                    'product_image'         => $imgname,
                ];
    
                if ($this->product->insert($insert) === false) {
                    $notif = [
                        'status'    => 'error', 
                        'title'     => 'Oops...', 
                        'message'   => ListHtml($this->product->errors(), '<ul>', '</ul>')
                    ];
                    return redirect()->to('admin/product/add')->with('notif', $notif)->withInput();

                } else {
                    $notif = [
                        'status'    => 'success', 
                        'title'     => 'Success!', 
                        'message'   => 'Success insert data', 
                        'redirect'  =>site_url('admin/product/table')
                    ];
                    return redirect()->to('admin/product/add')->with('notif', $notif);
                }
            }
        }


        // ===[Fetch Data]===
        $data['category'] = $this->category->findAll();

        // ===[Load View]===
        return view('admin/product/add', $data);
    }



    public function edit($id)
    {
        // ===[Load a CSS And JS File]===
        $data['daterange']      = false;
        $data['icheck']         = false;
        $data['colorpicker']    = false;
        $data['select2']        = false;
        $data['inputmask']      = false;
        $data['switch']         = false;
        $data['summernote']     = false;
        $data['datatables']     = false;


        // ===[Setting View]===
        $data['title']          = 'Form Edit';
        $data['cardheader']     = ['title' => 'Form Input'];
        $data['breadcrumb']     = [
            'Product'   => site_url('admin/product/index'),
            'Edit'      => site_url('admin/product/index'),
        ];

        // ===[Update Logic]===
        if ($this->request->getPost()) {

            // ===[Validate Image]===
            if (!$this->validate($this->product->imageRules)) {
                $notif = [
                    'status'    => 'error', 
                    'title'     => 'Oops...', 
                    'message'   => ListHtml($this->validator->getErrors(), '<ul>', '</ul>')
                ];
                return redirect()->to('admin/product/add')->with('notif', $notif)->withInput();

            } else {
                
                // ===[Insert Data To Database]===
                $update = [
                    'category_id'           => $this->request->getPost('_category_'),
                    'product_name'          => $this->request->getPost('_name_'),
                    'product_brand'         => $this->request->getPost('_brand_'),
                    'product_description'   => $this->request->getPost('_description_'),
                    'product_stock'         => $this->request->getPost('_stock_'),
                    'product_capital'       => $this->request->getPost('_capital_'),
                    'product_price'         => $this->request->getPost('_price_'),
                    'product_discount'      => $this->request->getPost('_discount_'),
                    'product_rating'        => $this->request->getPost('_rating_'),
                ];
                
                // ===[Save Image If Uploaded]===
                $image = $this->request->getFile('_image_');
                if ($image->isValid() && !$image->hasMoved()) {
                    $imgname = $image->getRandomName();
                    $update['product_image'] = $imgname;
                    $image->move($this->uploaddir, $imgname);

                    $product = $this->product->find($id);
                    delete_file($this->uploaddir.$product['product_image']);
                }

    
                if ($this->product->update($id, $update) === false) {
                    $notif = [
                        'status'    => 'error', 
                        'title'     => 'Oops...', 
                        'message'   => ListHtml($this->product->errors(), '<ul>', '</ul>')
                    ];
                    return redirect()->to('admin/product/add')->with('notif', $notif)->withInput();

                } else {
                    $notif = [
                        'status'    => 'success', 
                        'title'     => 'Success!', 
                        'message'   => 'Success update data', 
                        'redirect'  => site_url('admin/product/table')
                    ];
                    return redirect()->to('admin/product/add')->with('notif', $notif);
                }
            }
        }

        // ===[Fetch Data]===
        $data['data'] = $this->product->find($id);
        $data['category'] = $this->category->findAll();
        if (!$data['data']) {
            throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
        }

        // ===[Load View]===
        return view('admin/product/edit', $data);
    }



    public function delete($id){
        // ===[If Data Not Found]===
        if (!$this->product->find($id)) {
            $notif = [
                'status'    => 'error', 
                'title'     => 'Oops...', 
                'message'   => 'Data not found!',
            ];
            return redirect()->to('admin/product/table')->with('notif', $notif);

        // ===[Logic Delete]===
        } else {
            $product = $this->product->find($id);
            delete_file($this->uploaddir.$product['product_image']);

            $this->product->delete($id); // useSoftDeletes = false "Check The Model"

            $notif = [
                'status'    => 'success', 
                'title'     => 'Success!', 
                'message'   => 'Success delete data',
            ];
            return redirect()->to('admin/product/table')->with('notif', $notif);
        }
    }



    function sync_data() {
        $client = \Config\Services::curlrequest();

        $url = 'https://dummyjson.com/products';
        $headerData = array(
            'Content-Type' => 'application/json',
            'Accept' => 'application/json',
        );

        $response = $client->request('GET', $url, ['debug' => true,  'headers'=>$headerData]);
        $body = json_decode($response->getBody());

        // echo "<pre>";
        // print_r($body->products);
        // echo "</pre>";
        // die;

        if ($response->getStatusCode() == 200) {
            foreach ($body->products as $key => $value) {
                $data = [
                    'category_name'         => $value->category,
                    'category_description'  => $value->category
                ];
    
                $check_category = $this->category->where('category_name', $value->category)->first();
                
                if ($check_category) {
                    $submit = $this->category->update($check_category['category_id'], $data);
                    $category_id = $check_category['category_id'];
                } else {
                    $submit = $this->category->insert($data);
                    if ($submit === false) {
                        print_r($this->category->errors());
                        die;
                    } else {
                        $category_id = $this->category->getInsertID();
                    }
                }
                
                $data = [
                    'product_id'            => $value->id,
                    'category_id'           => $category_id,
                    'product_code'          => strtoupper(bin2hex(random_bytes(3))),
                    'product_name'          => $value->title,
                    'product_brand'         => $value->brand,
                    'product_description'   => $value->description,
                    'product_stock'         => $value->stock,
                    'product_capital'       => NULL,
                    'product_price'         => $value->price,
                    'product_discount'      => $value->discountPercentage,
                    'product_rating'        => $value->rating,
                    'product_image'         => $value->thumbnail,
                ];

                $check_product = $this->product->where('product_id', $value->id)->first();
                if ($check_product) {
                    $submit = $this->product->update($check_product['product_id'], $data);
                } else {
                    $submit = $this->product->insert($data);
                }

                
                if ($submit === false) {
                    $notif = [
                        'status'    => 'error', 
                        'title'     => 'Oops...', 
                        'message'   => ListHtml($this->product->errors(), '<ul>', '</ul>')
                    ];
                    echo "<pre>";
                    print_r($notif);
                    echo "</pre>";
                    die;
        
                } else {
                    $notif = [
                        'status'    => 'success', 
                        'title'     => 'Success!', 
                        'message'   => 'Successful data synchronization',
                    ];
                }
            }

        } else {
            $notif = [
                'status'    => 'error', 
                'title'     => 'Oops...', 
                'message'   => 'Data not found',
            ];
        }

        return redirect()->to('admin/product/table')->with('notif', $notif);
    }
}
