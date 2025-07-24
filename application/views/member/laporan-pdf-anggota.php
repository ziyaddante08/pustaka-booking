<!DOCTYPE html>
<html>

<head>
    <title></title>
</head>

<body>
    <style type="text/css">
        .table-data {
            width: 100%;
            border-collapse: collapse;
        }

        .table-data tr th,
        .table-data tr td {
            border: 1px solid black;
            font-size: 11pt;
            font-family: Verdana;
            padding: 10px 10px 10px 10px;
        }

        .table-data th {
            background-color: grey;
        }

        h3 {
            font-family: Verdana;
        }
    </style>
    <h3>
        <center>LAPORAN DATA ANGGOTA</center>
    </h3>
    <br />
    <table class="table-data">
        <thead>
            <tr>
                <th>No</th>
                <th>Nama Anggota</th>
                <th>Alamat</th>
                <th>Email</th>
                <th>Profile Picture</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $no = 1;
            foreach ($laporan as $l) {
            ?>
                <tr>
                    <td scope="row"><?= $no++; ?></td>
                    <td><?= $l['nama']; ?></td>
                    <td><?= $l['alamat']; ?></td>
                    <td><?= $l['email']; ?></td>
                    <td><?= $l['image']; ?></td>
                </tr>
            <?php
            }
            ?>
        </tbody>
    </table>
</body>

</html>