import 'package:flutter/material.dart';
import 'DeleteFavoriteDialog.dart';

class FavoritKostPage extends StatefulWidget {
  const FavoritKostPage({super.key});

  @override
  State<FavoritKostPage> createState() => _FavoritKostPageState();
}

class _FavoritKostPageState extends State<FavoritKostPage> {

  // Data kost favorit
  final List<Map<String, dynamic>> kostList = [
    {
      "nama": "Kost Adiwarna",
      "harga": "Rp 1.200.000",
      "favorite": true,
    },
  ];

  // Fungsi membuka dialog hapus favorit
  void hapusFavorit(int index) {
    DeleteFavoriteDialog.show(
      context,
      namaKost: kostList[index]["nama"],
      onDelete: () {

        // Menghapus data dari daftar favorit
        setState(() {
          kostList.removeAt(index);
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Kost berhasil dihapus dari favorit"),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}