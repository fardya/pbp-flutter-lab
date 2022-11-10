
## Tugas 7
Davina Fardya Zulfa Izzati (2106702005)

### Stateless Widget dan Stateful Widget
Stateless widget adalah widget yang isinya tetap, sedangkan stateful widget adalah widget yang isinya dinamis.
Stateless widget tidak memiliki state, tidak dapat berubah selama program berjalan, dan hanya memiliki properti `final`.
Stateful widget memiliki state yang dapat berubah selama program berjalan oleh internal state.

### Daftar Widget yang Digunakan
- AppBar: menampilkan bar di bagian atas program
- Column: menyusun child widget ke bawah
- Row: menyusun child widget ke samping
- Text: menampilkan teks 'GANJIL' dan 'GENAP'
- FloatingActionButton: menampilkan tombol yang melakukan increment dan decrement pada `_counter`
- Icon: menampilkan ikonis - dan + pada tombol

### Fungsi `setState()` dan Variabel yang Terdampak
`setState` memberi tahu widget bahwa terdapat perubahan state pada objek sehingga widget dan descendants-nya akan di-build ulang.
Variabel yang terdampak adalah `_counter`, terlihat di dalam fungsinya dilakukan incerement dan decrement pada `_counter`.

### Perbedaan `const` dengan `final`
`const` mendeklarasikan variabel yang nilainya konstan dan harus sudah ada saat kompilasi.
Sementara itu, `final` mendeklarasikan variabel yang nilainya diketahui saat program berjalan.

### Implementasi
- Membuat proyek flutter bernama counter_7
- Membuat fungsi `_decrementCounter` untuk melakukan decrement terhadap nilai `_counter` jika nilainya lebih besar dari nol
- Membuat teks yang menampilkan 'GENAP' jika nilai `_counter` genap dan 'GANJIL' jika nilainya ganjil
- Membuat tombol yang memanggil fungsi `_decrementCounter`