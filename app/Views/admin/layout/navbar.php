
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
        </ul>

        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">



            <li class="nav-item">
                <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                    <i class="fas fa-expand-arrows-alt"></i>
                </a>
            </li>

            <li class="nav-item dropdown user-menu border-left">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
                    <img src="<?= session()->imageurl ?>" class="user-image img-circle elevation-2" alt="User Image">
                    <span class="d-none d-md-inline"><?= session()->name ?></span>
                </a>
                <ul class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                    <!-- User image -->
                    <li class="user-header bg-info">
                        <img src="<?= session()->imageurl ?>" class="img-circle elevation-2" alt="User Image">

                        <p>
                            <?= session()->name ?> - <?= session()->role ?>
                            <small>Member since <?= session()->created ?></small>
                        </p>
                    </li>

                    <!-- Menu Footer-->
                    <li class="user-footer">
                        <a href="<?= site_url('admin/profile/info') ?>" class="btn btn-default btn-flat">Profile</a>
                        <a href="<?= site_url('auth/logout') ?>" class="btn btn-default btn-flat float-right">Sign out</a>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>
