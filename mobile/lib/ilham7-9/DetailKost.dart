import 'package:flutter/material.dart';

class DetailKostPage extends StatefulWidget {
  const DetailKostPage({super.key});

  @override
  State<DetailKostPage> createState() => _DetailKostPageState();
}

class _DetailKostPageState extends State<DetailKostPage> {
  // Status favorit
  bool isFavorite = false;

  // Fungsi mengubah status favorit
  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(
          isFavorite
              ? "Kost ditambahkan ke favorit"
              : "Kost dihapus dari favorit",
        ),
      ),
    );
  }

  // Fungsi tombol kembali
  void goBack() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [
          // =========================
          // CONTENT
          // =========================
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // =========================
                // FOTO KOST
                // =========================
                Stack(
                  children: [
                    Image.network(
                      "https://images.unsplash.com/photo-1560185008-b033106af5c3",
                      height: 330,
                      width: double.infinity,
                      fit: BoxFit.cover,

                      // Jika gambar gagal dimuat
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 330,
                          width: double.infinity,
                          color: Colors.grey.shade300,
                          child: const Center(
                            child: Icon(
                              Icons.image_not_supported,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),

                    // =========================
                    // TOMBOL KEMBALI
                    // =========================
                    Positioned(
                      top: 40,
                      left: 20,
                      child: circleButton(
                        icon: Icons.arrow_back_ios_new,
                        onTap: goBack,
                      ),
                    ),

                    // =========================
                    // TOMBOL SHARE
                    // =========================
                    Positioned(
                      top: 40,
                      right: 70,
                      child: circleButton(
                        icon: Icons.share_outlined,
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Fitur bagikan akan segera tersedia",
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // =========================
                    // FAVORIT
                    // =========================
                    Positioned(
                      top: 40,
                      right: 20,
                      child: circleButton(
                        icon: isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color:
                            isFavorite ? Colors.red : Colors.black,
                        onTap: toggleFavorite,
                      ),
                    ),

                    // =========================
                    // JUMLAH FOTO
                    // =========================
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.photo_library_outlined,
                              size: 14,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "1 / 5 Foto",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // =========================
                // DETAIL KOST
                // =========================
                Container(
                  transform: Matrix4.translationValues(
                    0,
                    -20,
                    0,
                  ),
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      // =========================
                      // BADGE
                      // =========================
                      Row(
                        children: [
                          badge(
                            "Campur",
                            Colors.grey.shade200,
                            Colors.black,
                          ),

                          const SizedBox(width: 8),

                          badge(
                            "✓ Terverifikasi",
                            Colors.green.shade100,
                            Colors.green.shade700,
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      // =========================
                      // NAMA KOST
                      // =========================
                      const Text(
                        "Kost Adiwarna",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // =========================
                      // ALAMAT
                      // =========================
                      Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.blue,
                            size: 18,
                          ),

                          const SizedBox(width: 5),

                          Expanded(
                            child: Text(
                              "Jl. Gegerkalong No. 12, Bandung",
                              style: TextStyle(
                                color:
                                    Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // =========================
                      // HARGA
                      // =========================
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius:
                              BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                              children: [
                                const Text(
                                  "Harga Sewa Bulanan",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),

                                Container(
                                  padding:
                                      const EdgeInsets
                                          .symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration:
                                      BoxDecoration(
                                    color: Colors
                                        .grey.shade300,
                                    borderRadius:
                                        BorderRadius
                                            .circular(
                                                20),
                                  ),
                                  child: const Text(
                                    "Termasuk Listrik",
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 8),

                            const Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Rp 1.200.000",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 22,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),

                                SizedBox(width: 5),

                                Padding(
                                  padding:
                                      EdgeInsets.only(
                                          bottom: 3),
                                  child: Text(
                                    "/bulan",
                                    style: TextStyle(
                                      color:
                                          Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 15),

                      // =========================
                      // KETERSEDIAAN KAMAR
                      // =========================
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius:
                              BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.circle,
                              size: 10,
                              color: Colors.green,
                            ),

                            const SizedBox(width: 10),

                            const Expanded(
                              child: Text(
                                "Ketersediaan Kamar",
                              ),
                            ),

                            Text(
                              "Tersedia 3 kamar",
                              style: TextStyle(
                                color:
                                    Colors.green.shade800,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      // =========================
                      // FASILITAS
                      // =========================
                      const Text(
                        "Fasilitas Utama",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: facility(
                              Icons.wifi,
                              "WiFi",
                            ),
                          ),
                          Expanded(
                            child: facility(
                              Icons.ac_unit,
                              "AC",
                            ),
                          ),
                          Expanded(
                            child: facility(
                              Icons.bathroom,
                              "K. Mandi\nDalam",
                            ),
                          ),
                          Expanded(
                            child: facility(
                              Icons.kitchen,
                              "Dapur",
                            ),
                          ),
                          Expanded(
                            child: facility(
                              Icons.directions_car,
                              "Parkir",
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      // =========================
                      // DESKRIPSI
                      // =========================
                      const Text(
                        "Deskripsi",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "Kost nyaman dengan lingkungan aman "
                        "dan strategis. Dekat kampus, "
                        "tempat makan, serta akses "
                        "transportasi umum. Fasilitas "
                        "lengkap untuk mahasiswa.",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // =========================
          // BOTTOM BUTTON
          // =========================
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                15,
                12,
                15,
                20,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black12,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // =========================
                  // CHAT
                  // =========================
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: OutlinedButton.icon(
                        style:
                            OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Colors.blue,
                          ),
                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(
                                    12),
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(
                                  context)
                              .showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Halaman chat belum dibuat",
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.chat_bubble_outline,
                        ),
                        label: const Text(
                          "Chat",
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  // =========================
                  // FAVORIT BAWAH
                  // =========================
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton.icon(
                        style:
                            ElevatedButton.styleFrom(
                          backgroundColor:
                              isFavorite
                                  ? Colors.red
                                  : Colors.blue,
                          foregroundColor:
                              Colors.white,
                          elevation: 0,
                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(
                                    12),
                          ),
                        ),
                        onPressed: toggleFavorite,
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons
                                  .favorite_border,
                        ),
                        label: Text(
                          isFavorite
                              ? "Sudah Favorit"
                              : "Tambah Favorit",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CIRCLE BUTTON
  // ============================================================
  Widget circleButton({
    required IconData icon,
    required VoidCallback onTap,
    Color color = Colors.black,
  }) {
    return Material(
      color: Colors.white.withOpacity(0.85),
      shape: const CircleBorder(),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            icon,
            size: 20,
            color: color,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // BADGE
  // ============================================================
  Widget badge(
    String text,
    Color backgroundColor,
    Color textColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ============================================================
  // FACILITY
  // ============================================================
  Widget facility(
    IconData icon,
    String title,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.blue,
            size: 22,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}