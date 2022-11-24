Davina Fardya Zulfa Izzati (2106702005)

## Tugas 7

### Stateless Widget dan Stateful Widget
Stateless widget adalah widget yang isinya tetap, sedangkan stateful widget adalah widget yang isinya dinamis.
Stateless widget tidak memiliki state, tidak dapat berubah selama program berjalan, dan hanya memiliki properti final.
Stateful widget memiliki state yang dapat berubah selama program berjalan oleh internal state.

### Daftar Widget yang Digunakan
- AppBar: menampilkan bar di bagian atas program
- Column: menyusun child widget ke bawah
- Row: menyusun child widget ke samping
- Text: menampilkan teks 'GANJIL' dan 'GENAP'
- FloatingActionButton: menampilkan tombol yang melakukan increment dan decrement pada _counter
- Icon: menampilkan ikonis - dan + pada tombol

### Fungsi setState() dan Variabel yang Terdampak
setState memberi tahu widget bahwa terdapat perubahan state pada objek sehingga widget dan descendants-nya akan di-build ulang.
Variabel yang terdampak adalah _counter, terlihat di dalam fungsinya dilakukan incerement dan decrement pada _counter.

### Perbedaan const dengan final
const mendeklarasikan variabel yang nilainya konstan dan harus sudah ada saat kompilasi.
Sementara itu, final mendeklarasikan variabel yang nilainya diketahui saat program berjalan.

### Implementasi
- Membuat proyek flutter bernama counter_7
- Membuat fungsi _decrementCounter untuk melakukan decrement terhadap nilai _counter jika nilainya lebih besar dari nol
- Membuat teks yang menampilkan 'GENAP' jika nilai _counter genap dan 'GANJIL' jika nilainya ganjil
- Membuat tombol yang memanggil fungsi _decrementCounter

## Tugas 8

### Perbedaan Navigator.push dan Navigator.pushReplacement
Navigator.push akan menampilkan layar lain di atas layar yang sedang ditampilkan, sedangkan Navigator.pushReplacement akan menggantikan layar yang sedang ditampilkan dengan layar lain.
Navigator.push mengizinkan pengguna kembali ke layar sebelumnya, Navigator.pushReplacement tidak.

### Daftar Widget yang Digunakan
Selain yang sudah digunakan pada tugas 7.

- Drawer: membuat hamburger menu
- Form: membuat form
- TextButton: menampilkan button 
- Container: sebagai tempat untuk meletakkan widget lain
- ListTile: menampilkan informasi dalam sebuah list
- DropdownButtonHideUnderline: membuat dropdown tanpa underline
- ListView: menampilkan children widget yang dapat di-scroll

### Jenis-jenis Event pada Flutter 
- onPressed: event terjadi karena widget ditekan
- onSaved: event terjadi karena ada penyimpanan data
- onChanged: event terjadi karena ada perubahan data pada widget

### Cara Navigator Mengganti Halaman
Cara kerja navigator mirip dengan stack. Isi stack tersebut adalah route.
Ketika pengguna membuka suatu halaman, dilakukan push ke dalam stack sehingga item teratas merupakan route tersebut.
Jika ingin kembali ke halaman sebelumnya, dilakukan pop untuk mengeluarkan route teratas (halaman yang sedang dibuka) sehingga route teratas yang baru adalah halaman sebelumnya.

### Implementasi
- Membuat file form.dart untuk halaman form yang berfungsi untuk menambah data budget
- Membuat file data.dart untuk menampilkan semua data budget
- Membuat file drawer.dart untuk navigasi pada bagian kiri atas aplikasi
- Menghubungkan seluruh file dengan import dan nama kelas yang sesuai

## Tugas 9

### Pengambilan Data JSON
Pengambilan data JSON bisa dilakukan tanpa membuat model terlebih dahulu. Implementasinya menggunakan built-in JSON decoder dari dart:convert.Data JSON dikirim sebagai HTTP response dalam bentuk raw data JSON String ke jsonDecode(), kemudian hasilnya akan ada pada Map<String, dynamic>.
<br>
Pengambilan data JSON tanpa membuat model terlebih dahulu dapat membuat developer sulit untuk melihat dan mengelola data tersebut.

### Daftar Widget yang Digunakan
- FutureBuilder: menampilkan data dari web service yang mendukung proses asinkron
- Checkbox: menampilkan checkbox pada page My Watch List
- Card: membuat ruang mirip kartu untuk memuat data-data mywatchlist
- SizedBox: membuat kotak dengan ukuran yang spesifik

### Mekanisme Pengambilan Data dari JSON
- Menambahkan dependensi HTTP
- Mendefinisikan model sesuai dengan data yang akan diambil
- Membuat fungsi untuk melakukan fetching data dari web service
- Melakukan HTTP request dengan method GET
- Menampilkan data yang telah dikonversi menjadi Dart object dengan FutureBuilder

### Implementasi
- Memindahkan file ke dalam folder baru pada lib untuk meningkatkan keterbacaan
- Membuat file mywatchlist.dart berisi model MyWatchList berdasarkan data JSON dari web service
- Menambahkan dependensi HTTP
- Membuat file mywatchlist_fetch.dart untuk fetch data
- Membuat file watchlistdetail.dart untuk data
- Menampilkan data pada widget