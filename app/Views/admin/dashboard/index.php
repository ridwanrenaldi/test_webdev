<?= $this->extend('admin/layout/base') ?>

<?= $this->section('content') ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Dashboard</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Dashboard v1</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">

                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="container">
                                    <img src="<?php echo base_url('template/dist/img/AdminLTELogo.png')?>" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8; display: block; margin: auto;">
                                    <h1 class="display-4 text-center"><b>Selamat Datang!</b></h1>
                                    <p class="lead text-center">Control Panel</p>
                                </div>
                            </div>
                        </div>

                        <!-- Small boxes (Stat box) -->
                        <div class="row">
                            <div class="col-lg-6 col-6">
                                <!-- small box -->
                                <div class="small-box bg-info">
                                <div class="inner">
                                    <h3><?= $total_category ?></h3>
        
                                    <p>Category</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                </div>
                                <a href="<?= site_url('admin/category/table') ?>" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
        
                            <!-- ./col -->
                            <div class="col-lg-6 col-6">
                                <!-- small box -->
                                <div class="small-box bg-success">
                                <div class="inner">
                                    <h3><?= $total_product ?></h3>
        
                                    <p>Total Product</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-stats-bars"></i>
                                </div>
                                <a href="<?= site_url('admin/product/table') ?>" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
<?= $this->endSection() ?>