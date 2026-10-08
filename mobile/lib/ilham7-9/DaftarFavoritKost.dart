import 'package:flutter/material.dart';
import 'DetailKost.dart';

class FavoritKostPage extends StatefulWidget {
  const FavoritKostPage({super.key});

  @override
  State<FavoritKostPage> createState() => _FavoritKostPageState();
}

class _FavoritKostPageState extends State<FavoritKostPage> {
  final List<Map<String, dynamic>> kostList = [
    {
      "nama": "Kost Adiwarna",
      "harga": "Rp 1.200.000",
      "alamat": "Jl. Gegerkalong No. 12, Bandung",
      "rating": "4.9",
      "jarak": "3 km",
      "wifi": true,
      "ac": true,
      "image":
          "https://images.unsplash.com/photo-1560185008-b033106af5c3?w=500",
      "favorite": true,
    },
    {
      "nama": "Kost Melati",
      "harga": "Rp 1.000.000",
      "alamat": "Jl. Setiabudi, Bandung",
      "rating": "4.7",
      "jarak": "2 km",
      "wifi": true,
      "ac": true,
      "image":
          "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=500",
      "favorite": true,
    },
    {
      "nama": "Kost Cemara",
      "harga": "Rp 950.000",
      "alamat": "Jl. Dago, Bandung",
      "rating": "4.8",
      "jarak": "5 km",
      "wifi": true,
      "ac": true,
      "image":
          "https://images.unsplash.com/photo-1568605114967-8130f3a36994?w=500",
      "favorite": true,
    },
  ];

  void toggleFavorite(int index) {
    setState(() {
      kostList[index]["favorite"] =
          !(kostList[index]["favorite"] as bool);
    });

    final bool isFavorite = kostList[index]["favorite"] as bool;

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(
          isFavorite
              ? "${kostList[index]["nama"]} ditambahkan ke favorit"
              : "${kostList[index]["nama"]} dihapus dari favorit",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),

      // =========================
      // APP BAR
      // =========================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: Colors.black87,
          ),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        titleSpacing: 0,
        title: const Text(
          "Kost Favorit",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),

        // =========================
        // JUMLAH FAVORIT
        // =========================
        actions: [
          Container(
            margin: const EdgeInsets.only(
              right: 16,
              top: 13,
              bottom: 13,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffFFF0F0),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.favorite,
                  size: 13,
                  color: Colors.red,
                ),
                const SizedBox(width: 4),
                Text(
                  "${kostList.where((item) => item["favorite"] == true).length} Tersimpan",
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // =========================
      // BODY
      // =========================
      body: Column(
        children: [
          // =========================
          // INFO LOKASI
          // =========================
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(
              16,
              5,
              16,
              10,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.blue,
                  size: 16,
                ),
                const SizedBox(width: 4),
                const Text(
                  "Bandung",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  "• ${kostList.length} Kost Tersimpan",
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                const Text(
                  "Sinkron Otomatis",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),

          // =========================
          // CONTENT
          // =========================
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                14,
                10,
                14,
                100,
              ),
              child: Column(
                children: [
                  // =========================
                  // BANNER PENGINGAT
                  // =========================
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xffF7F7F7),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 31,
                          height: 31,
                          decoration: BoxDecoration(
                            color: const Color(0xffEDF5FF),
                            borderRadius:
                                BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.notifications_none,
                            color: Colors.blue,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Text(
                            "Ketersediaan kamar dan harga dapat berubah "
                            "sewaktu-waktu. Hubungi pemilik untuk booking segera.",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                              height: 1.35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // =========================
                  // DAFTAR KOST
                  // =========================
                  ListView.separated(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(),
                    itemCount: kostList.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      return kostCard(
                        index,
                        kostList[index],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // =========================
      // BOTTOM NAVIGATION
      // =========================
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
              children: [
                bottomMenu(
                  Icons.home_outlined,
                  "Home",
                  false,
                  () {
                    showFeatureMessage("Home");
                  },
                ),
                bottomMenu(
                  Icons.favorite,
                  "Favorit",
                  true,
                  () {},
                ),
                bottomMenu(
                  Icons.chat_bubble_outline,
                  "Chat",
                  false,
                  () {
                    showFeatureMessage("Chat");
                  },
                ),
                bottomMenu(
                  Icons.person_outline,
                  "Profil",
                  false,
                  () {
                    showFeatureMessage("Profil");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // =============================================================
  // KARTU KOST
  // =============================================================
  Widget kostCard(
    int index,
    Map<String, dynamic> data,
  ) {
    final bool isFavorite = data["favorite"] as bool;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DetailKostPage(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            // =========================
            // GAMBAR KOST
            // =========================
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  Image.network(
                    data["image"],
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) {
                      return Container(
                        width: 90,
                        height: 90,
                        color: Colors.grey.shade200,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.home,
                          color: Colors.grey,
                          size: 35,
                        ),
                      );
                    },
                  ),

                  // =========================
                  // RATING
                  // =========================
                  Positioned(
                    bottom: 5,
                    left: 5,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(0.85),
                        borderRadius:
                            BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.green,
                            size: 10,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            data["rating"],
                            style: const TextStyle(
                              fontSize: 9,
                              fontWeight:
                                  FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            // =========================
            // DETAIL KOST
            // =========================
            Expanded(
              child: SizedBox(
                height: 90,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            data["nama"],
                            maxLines: 1,
                            overflow:
                                TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight:
                                  FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),

                        // =========================
                        // ICON FAVORIT
                        // =========================
                        InkWell(
                          onTap: () =>
                              toggleFavorite(index),
                          borderRadius:
                              BorderRadius.circular(20),
                          child: Padding(
                            padding:
                                const EdgeInsets.all(3),
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons
                                      .favorite_border,
                              size: 19,
                              color: isFavorite
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    // =========================
                    // HARGA
                    // =========================
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: data["harga"],
                            style: const TextStyle(
                              color: Color(0xff0068D9),
                              fontSize: 13,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: "/bulan",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 8,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 4),

                    // =========================
                    // ALAMAT
                    // =========================
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 11,
                          color: Colors.black54,
                        ),
                        const SizedBox(width: 2),
                        Expanded(
                          child: Text(
                            data["alamat"],
                            maxLines: 1,
                            overflow:
                                TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 9,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    // =========================
                    // FASILITAS & JARAK
                    // =========================
                    Row(
                      children: [
                        const Icon(
                          Icons.wifi,
                          size: 11,
                          color: Colors.black54,
                        ),
                        const SizedBox(width: 3),
                        const Text(
                          "WiFi",
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.black54,
                          ),
                        ),

                        const SizedBox(width: 6),

                        const Icon(
                          Icons.ac_unit,
                          size: 10,
                          color: Colors.black54,
                        ),
                        const SizedBox(width: 2),
                        const Text(
                          "AC",
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.black54,
                          ),
                        ),

                        const Spacer(),

                        Container(
                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color:
                                const Color(0xffE9F7EE),
                            borderRadius:
                                BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                color: Colors.green,
                                size: 6,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                "Tersedia ${data["jarak"]}",
                                style:
                                    const TextStyle(
                                  color: Colors.green,
                                  fontSize: 8,
                                  fontWeight:
                                      FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =============================================================
  // BOTTOM NAV ITEM
  // =============================================================
  Widget bottomMenu(
    IconData icon,
    String label,
    bool active,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 21,
              color: active
                  ? const Color(0xff3488E9)
                  : Colors.grey,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 9,
                fontWeight: active
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: active
                    ? const Color(0xff3488E9)
                    : Colors.grey,
              ),
            ),

            const SizedBox(height: 4),

            if (active)
              Container(
                width: 24,
                height: 3,
                decoration: BoxDecoration(
                  color: const Color(0xff3488E9),
                  borderRadius:
                      BorderRadius.circular(10),
                ),
              )
            else
              const SizedBox(height: 3),
          ],
        ),
      ),
    );
  }

  void showFeatureMessage(String feature) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(
          "Halaman $feature belum dibuat",
        ),
      ),
    );
  }
}