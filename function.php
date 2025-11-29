<?php
// Koneksi ke database
$conn = mysqli_connect("localhost", "root", "", "simbs");

function query($query) {
  global $conn;
  $result = mysqli_query($conn, $query);
    if (!$result) {
        die("Query Error: " . mysqli_error($conn));
    }
  $rows = [];
  while ($row = mysqli_fetch_assoc($result)) {
      $rows[] = $row;
  }
  return $rows;
}

$query = query("SELECT buku.judul, buku.penulis, buku.deskripsi, buku.tahun_terbit, buku.gambar, kategori.nama_kategori
                FROM buku INNER JOIN kategori ON buku.id_kategori = kategori.id_kategori ORDER BY kategori.tanggal_input DESC");



// Fungsi hapus data buku
function hapus_data($id){
    global $conn;

    $query = "DELETE FROM buku WHERE id_buku = '$id'";
    $result = mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}

// Fungsi hapus data kategori
function hapus_dataktgr($id){
    global $conn;

    $query = "DELETE FROM kategori WHERE id_kategori = '$id'";
    $result = mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}



// fungsi ubah data
function ubah_data($data){
    global $conn;

    $id             = $data['id_buku'];
    $judul          = $data['judul'];
    $penulis        = $data['penulis'];
    $deskripsi      = $data['deskripsi'];
    $kategori       = $data['id_kategori'];
    $tahun_terbit   = $data['tahun_terbit'];
    $gambar_lama    = $data['gambar_lama'];

    if ($_FILES['gambar']['error'] === 4) {
        $gambar = $gambar_lama;
    } else {
        $gambar = upload_gambar($judul, $kategori);
    }

    $query = "UPDATE buku SET
              judul = '$judul',
              penulis = '$penulis',
              deskripsi = '$deskripsi',
              id_kategori = '$kategori',
              tahun_terbit = '$tahun_terbit',
              gambar = '$gambar'
              WHERE id_buku = $id";

    mysqli_query($conn, $query);
    return mysqli_affected_rows($conn);
}

// Fungsi ubah data kategori
function ubah_dataktgr($data){
    global $conn;

    $id             = $data['id_kategori'];
    $nama_kategori  = $data['nama_kategori'];

    $query = "UPDATE kategori SET
              nama_kategori = '$nama_kategori'
              WHERE id_kategori = $id";

    mysqli_query($conn, $query);
    return mysqli_affected_rows($conn);
}



// fungsi untuk menambahkan data buku
function tambah_data($data) {
    global $conn;

    $judul          = $data['judul'];
    $penulis        = $data['penulis'];
    $deskripsi      = $data['deskripsi'];
    $id_kategori    = $data['kategori'];
    $tahun_terbit   = $data['tahun_terbit'];

    $gambar = upload_gambar($judul, $penulis); 
    if( !$gambar ) {
        return false;
    }

    $query = "INSERT INTO buku (judul, penulis, id_kategori, deskripsi, tahun_terbit, gambar)
              VALUES ('$judul', '$penulis', '$id_kategori', '$deskripsi', '$tahun_terbit', '$gambar')";

    mysqli_query($conn, $query);
    return mysqli_affected_rows($conn);
}

//Fungsi untuk menambahkan data kategori
function tambah_dataktgr($data) {
    global $conn;

    $nama_kategori         = $data['nama_kategori'];

    $query = "INSERT INTO kategori (nama_kategori)
              VALUES ('$nama_kategori')";

    mysqli_query($conn, $query);
    return mysqli_affected_rows($conn);
}



// fungsi untuk mencari data buku
function search_data($keyword){
    global $conn;

    $query = "SELECT buku.id_buku, buku.judul, buku.penulis, buku.deskripsi, buku.tahun_terbit, buku.gambar, buku.tanggal_input, kategori.nama_kategori
              FROM buku
              INNER JOIN kategori ON buku.id_kategori = kategori.id_kategori
              WHERE buku.judul LIKE '%$keyword%'
              OR buku.penulis LIKE '%$keyword%'
              OR buku.tahun_terbit LIKE '%$keyword%'
              OR buku.deskripsi LIKE '%$keyword%'
              OR kategori.nama_kategori LIKE '%$keyword%'";

	return query($query);
}

// Fungsi untuk mencari data kategori
function search_dataktgr($keyword){
    global $conn;

    $query = "SELECT * FROM kategori
              WHERE kategori.nama_kategori LIKE '%$keyword%'";

	return query($query);
}



// fungsi untuk upload gambar
function upload_gambar($judul, $penulis) {


    // setting gambar
    $namaFile = $_FILES['gambar']['name'];
    $ukuranFile = $_FILES['gambar']['size'];
    $error = $_FILES['gambar']['error'];
    $tmpName = $_FILES['gambar']['tmp_name'];


    // cek apakah tidak ada gambar yang diupload
    if( $error === 4 ) {
        echo "<script>
                alert('pilih gambar terlebih dahulu!');
              </script>";
        return false;
    }


    // cek apakah yang diupload adalah gambar
    $ekstensiGambarValid = ['jpg', 'jpeg', 'png'];
    $ekstensiGambar = explode('.', $namaFile);
    $ekstensiGambar = strtolower(end($ekstensiGambar));
    if( !in_array($ekstensiGambar, $ekstensiGambarValid) ) {
        echo "<script>
                alert('yang anda upload bukan gambar!');
              </script>";
        return false;
    }


    // cek jika ukurannya terlalu besar
    // maks --> 2MB
    if( $ukuranFile > 2000000 ) {
        echo "<script>
                alert('ukuran gambar terlalu besar!');
              </script>";
        return false;
    }


    // lolos pengecekan, gambar siap diupload
    // generate nama gambar baru
    $namaFileBaru = $judul . "_" . $penulis;
    $namaFileBaru .= '.';
    $namaFileBaru .= $ekstensiGambar;


    move_uploaded_file($tmpName, 'img/' . $namaFileBaru);


    return $namaFileBaru;
}



// Fungsi register data
function register($data_register){
    global $conn;


    // kita tampung dulu data-data yang dikirimkan dari file register.php melalui $data_register ke dalam variabel
   
    $username = strtolower($data_register['username']);
    $email = $data_register['email'];
    $password = mysqli_real_escape_string($conn, $data_register['password']);


    // cek username sudah ada atau belum
    $query = mysqli_query($conn, "SELECT username FROM user WHERE username = '$username'");

    $result = mysqli_fetch_assoc($query);


    if($result != NULL){
        return "Username sudah terdaftar di database!";
    }

    // cek email sudah ada atau belum
    $query = mysqli_query($conn, "SELECT email FROM user WHERE email = '$email'");

    $result = mysqli_fetch_assoc($query);


    if($result != NULL){
        return "Email sudah terdaftar di database!";
    }


    // alert password
    if(strlen($password) < 8){
        return "Password minimal 8 karakter!";
    }

    // enkripsi password
    $password = password_hash($password, PASSWORD_DEFAULT);


    // tambahkan userbaru ke database
    mysqli_query($conn, "INSERT INTO user (id_user, username, email, password) VALUES('', '$username', '$email', '$password')");
   
    return true;




}


// Fungsi login data
function login($data){
    global $conn;


    $username = $data['username'];
    $password = $data['password'];


    // cek username sudah ada atau belum
    $query = "SELECT * FROM user WHERE username = '$username'";
    $result = mysqli_query($conn, $query);


    // var_dump($result);
    // die;


     // Cek user ada atau tidak
    if(mysqli_num_rows($result) === 1){
        $row = mysqli_fetch_assoc($result);


        // var_dump($row);
        // die;


        // Verify password
        if(password_verify($password, $row["password"])) {
            $_SESSION['login'] = true;
            $_SESSION['username'] = $row['username'];
            // echo "masuk sini";
            return true;
        } else {
            // echo "tidak masuk";
            return "Password salah!";
        }


    } else {
        return "Username tidak ditemukan!"; // username tidak ditemukan
    }
   
}


?>