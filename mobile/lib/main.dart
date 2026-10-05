import 'dart:io';

// Class untuk merepresentasikan data produk
class Produk {
  int id;
  String nama;
  double harga;
  int stok;

  Produk(this.id, this.nama, this.harga, this.stok);

  void tampilkanInfo() {
    print('ID: $id | Nama: $nama | Harga: Rp $harga | Stok: $stok pcs');
  }
}

void main() {
  List<Produk> daftarProduk = [];
  bool jalan = true;

  while (jalan) {
    print('\n=== APLIKASI MANAJEMEN PRODUK ===');
    print('1. Tambah Produk');
    print('2. Lihat Daftar Produk');
    print('3. Hapus Produk');
    print('4. Keluar');
    stdout.write('Pilih menu (1-4): ');
    
    String? pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        stdout.write('Masukkan ID Produk (angka): ');
        int id = int.parse(stdin.readLineSync()!);
        
        stdout.write('Masukkan Nama Produk: ');
        String nama = stdin.readLineSync()!;
        
        stdout.write('Masukkan Harga Produk: ');
        double harga = double.parse(stdin.readLineSync()!);
        
        stdout.write('Masukkan Stok Produk: ');
        int stok = int.parse(stdin.readLineSync()!);

        daftarProduk.add(Produk(id, nama, harga, stok));
        print('✅ Produk berhasil ditambahkan!');
        break;

      case '2':
        if (daftarProduk.isEmpty) {
          print('⚠️ Belum ada produk yang tersimpan.');
        } else {
          print('\n--- DAFTAR PRODUK ---');
          for (var produk in daftarProduk) {
            produk.tampilkanInfo();
          }
        }
        break;

      case '3':
        if (daftarProduk.isEmpty) {
          print('⚠️ Belum ada produk untuk dihapus.');
          break;
        }
        stdout.write('Masukkan ID Produk yang ingin dihapus: ');
        int idHapus = int.parse(stdin.readLineSync()!);
        
        int awalLength = daftarProduk.length;
        daftarProduk.removeWhere((p) => p.id == idHapus);

        if (daftarProduk.length < awalLength) {
          print('🗑️️ Produk dengan ID $idHapus berhasil dihapus.');
        } else {
          print('❌ Produk dengan ID tersebut tidak ditemukan.');
        }
        break;

      case '4':
        jalan = false;
        print('Terima kasih, program selesai!');
        break;

      default:
        print('❌ Pilihan tidak valid, coba lagi.');
    }
  }
}