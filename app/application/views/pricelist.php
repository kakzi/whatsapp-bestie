<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WA Bestie | <?= $title ?></title>
    <link rel="icon" href="<?= _assets('images/favicon.png') ?>">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
    <link href="<?= _assets() ?>/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?= _assets() ?>/plugins/perfectscroll/perfect-scrollbar.css" rel="stylesheet">
    <link href="<?= _assets() ?>/plugins/pace/pace.css" rel="stylesheet">
    <link href="<?= _assets() ?>/plugins/datatables/datatables.min.css" rel="stylesheet">
    <link href="<?= _assets() ?>/plugins/select2/css/select2.min.css" rel="stylesheet">
    <link href="<?= _assets() ?>/css/main.min.css" rel="stylesheet">
    <link href="<?= _assets() ?>/css/custom.css" rel="stylesheet">
    <style>
        .select2-dropdown {
            z-index: 9999;
        }

        .form-off {
            display: none;
        }

        .form-on {
            display: block;
        }
    </style>
</head>

<body>
    <div class="app align-content-stretch d-flex flex-wrap">

        <?php require_once(VIEWPATH . '/include_head.php') ?>

        <div class="app-container">
            <div class="app-header">
                <nav class="navbar navbar-light navbar-expand-lg">
                    <div class="container-fluid">
                        <div class="navbar-nav" id="navbarNav">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link hide-sidebar-toggle-button" href="#"><i class="material-icons">first_page</i></a>
                                </li>
                                <li class="nav-item dropdown hidden-on-mobile">
                                    <a class="nav-link dropdown-toggle" href="#" id="addDropdownLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="material-icons">add</i>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="addDropdownLink">
                                        <li><a class="dropdown-item" href="#">Broadcast</a></li>
                                        <li><a class="dropdown-item" href="#">WA Blast</a></li>
                                        <li><a class="dropdown-item" href="#">Auto Responder</a></li>
                                    </ul>
                                </li>
                            </ul>

                        </div>
                        <div class="d-flex">
                            <ul class="navbar-nav">

                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="app-content">
                <div class="content-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="page-description p-0">
                                    <h4><?= $title ?></h4>
                                </div>
                            </div>
                        </div>
                        <?= _alert() ?>

                        <div class="row">
                            <div class="col">
                                <div class="card">
                                    <div class="card-body">
                                        <h5>Pricelist</h5>
                                        <div class="text-end mb-3">
                                            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add"><i class="material-icons">add</i>Add</button>
                                        </div>
                                        <table id="datatable1" class="display" style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>Nama</th>
                                                    <th>Type</th>
                                                    <th>Price</th>
                                                    <th>#</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php foreach ($respon->result() as $d) : ?>
                                                    <tr>
                                                        <td></td>
                                                        <td><?= $d->nama ?></td>
                                                        <td><?= $d->type ?></td>
                                                        <td><small><?= $d->price ?></small></td>
                                                        <td><a href="<?= base_url('autoresponder/del/') . $d->id ?>" type="button" class="btn btn-danger btn-sm"><i class="material-icons">delete_outline</i>Delete</a> </td>
                                                    </tr>
                                                <?php endforeach ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="add" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Pricelist</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form method="post">
                    <div class="modal-body">
                        <label class="form-label">Type Paket</label>
                        <select name="type" id="type-message" class="form-select">
                            <option value="0">- Pilih Paket -</option>
                            <option value="standart">Paket Standart (1 Bulan)</option>
                            <option value="reguler">Paket Reguler (6 Bulan)</option>
                            <option value="premium">Paket Premium (1 Tahun)</option>
                        </select>
                        <span class="mt-1" id="form-keyword">
                            <label class="form-label">Price</label>
                            <input type="text" class="form-control" name="price" placeholder="ex: 30000" autocomplete="off">
                        </span>
                        <span class="mt-1" id="form-message">
                            <label class="form-label">Description</label>
                            <textarea class="form-control" name="description" autocomplete="off"></textarea>
                        </span>
                        <span class="mt-1" id="form-footer">
                            <label class="form-label">Limit</label>
                            <input type="text" class="form-control" name="limit_device" placeholder="1" autocomplete="off">
                        </span>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Cancelled</button>
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Javascripts -->
    <script src="<?= _assets() ?>/plugins/jquery/jquery-3.5.1.min.js"></script>
    <script src="<?= _assets() ?>/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="<?= _assets() ?>/plugins/perfectscroll/perfect-scrollbar.min.js"></script>
    <script src="<?= _assets() ?>/plugins/pace/pace.min.js"></script>
    <script src="<?= _assets() ?>/plugins/datatables/datatables.min.js"></script>
    <script src="<?= _assets() ?>/plugins/select2/js/select2.full.min.js"></script>
    <script src="<?= _assets() ?>/js/main.min.js"></script>
    <script src="<?= _assets() ?>/js/custom.js"></script>
    <script>
        $('#datatable1').DataTable({
            responsive: true,
            // "lengthChange": false
        });

        // $('#type-message').change(function() {
        //     $(".form-on").removeClass('form-on');
        //     var tye = this.value;

        //     switch (tye) {
        //         case '0':
        //             break
        //         case '1':
        //             $("#form-device").addClass('form-on');
        //             $("#form-keyword").addClass('form-on');
        //             $("#form-message").addClass('form-on');
        //             break
        //         case '2':
        //             $("#form-device").addClass('form-on');
        //             $("#form-device").addClass('form-on');
        //             $("#form-keyword").addClass('form-on');
        //             $("#form-message").addClass('form-on');
        //             $("#form-media").addClass('form-on');
        //             break
        //         case '3':
        //             $("#form-device").addClass('form-on');
        //             $("#form-device").addClass('form-on');
        //             $("#form-keyword").addClass('form-on');
        //             $("#form-message").addClass('form-on');
        //             $("#form-button-reply").addClass('form-on');
        //             $("#form-footer").addClass('form-on');
        //             break
        //         case '4':
        //             $("#form-device").addClass('form-on');
        //             $("#form-device").addClass('form-on');
        //             $("#form-keyword").addClass('form-on');
        //             $("#form-message").addClass('form-on');
        //             $("#form-button-urlcall").addClass('form-on');
        //             $("#form-footer").addClass('form-on');
        //             break
        //         case '5':
        //             alert('Coming Soon')
        //             break
        //     }
        // })
    </script>
    <?php require_once("include_file.php") ?>
</body>

</html>