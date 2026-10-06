import 'package:flutter/material.dart';

// Import halaman Salmin (Auth)
import 'salmin/auth/splash_screen.dart';

// Import halaman Ilham (Dikomentari sementara biar nggak ada warning unused import, tapi kodenya TIDAK DIHAPUS)
// import 'ilham7-9/DaftarFavoritKost.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KostRadar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      // Saat ini kita jalankan Splash Screen dulu buat tes flow Auth (Login/Register)
      home: const SplashScreen(),

      // CATATAN BUAT ILHAM / TIM:
      // Kalau mau tes halaman Favorit punya Ilham, tinggal tukar jadi kayak gini:
      // home: const FavoritKostPage(),
    );
  }
}
