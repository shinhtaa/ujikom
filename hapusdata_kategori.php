<?php
    require("function.php");

    $id = $_GET['id'];

    if(hapus_dataktgr($id) > 0){
        echo "
            <script>
                alert('Data berhasil dihapus!'); 
                document.location.href = 'kategori.php';
            </script>
        ";
    }else{
        echo "
            <script>
                alert('Data gagal dihapus!'); 
                document.location.href = 'kategori.php';
            </script>
        ";
    }
?>

