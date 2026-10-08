import 'package:flutter/material.dart';
import 'admin_chat_detail_page.dart';

class AdminChatPage extends StatefulWidget {
  const AdminChatPage({super.key});

  @override
  State<AdminChatPage> createState() => _AdminChatPageState();
}

class _AdminChatPageState extends State<AdminChatPage> {
  int selectedTab = 0;

  final List<Map<String, dynamic>> chats = [
    {
      'name': 'Alya Putri',
      'kost': 'Kost Adawarna • Kamar 04',
      'message': 'Apakah kamar Kost Adawarna masih tersedia?',
      'time': '10.30',
      'unread': true,
    },
    {
      'name': 'Budi Santoso',
      'kost': 'Kost Melati • Kamar 12',
      'message': 'Terima kasih informasinya Pak, besok saya...',
      'time': 'Kemarin',
      'unread': false,
    },
    {
      'name': 'Siti Rahma',
      'kost': 'Kost Ceria • Kamar 02',
      'message': 'Apakah bisa jadwal survey hari Sabtu ini?',
      'time': '12 Sep',
      'unread': true,
    },
    {
      'name': 'Dimas Pratama',
      'kost': 'Kost Adawarna • Kamar 08',
      'message': 'Bukti transfer deposit sudah dikirim ya Pak.',
      'time': '08 Sep',
      'unread': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredChats = selectedTab == 0
        ? chats
        : chats.where((chat) => chat['unread'] == true).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'KOSTRADAR ADMIN',
              style: TextStyle(
                fontSize: 10,
                color: Color(0xFF8A8A8A),
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Chat',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: const Color(0xFFE8F0FE),
              child: const Icon(
                Icons.person,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          // HEADER PESAN MASUK
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pesan Masuk',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Kelola pertanyaan calon penyewa kost Anda',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.tune),
                ),
              ],
            ),
          ),

          // TAB
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Row(
              children: [
                _buildTab(
                  title: 'Semua',
                  index: 0,
                  count: chats.length,
                ),
                const SizedBox(width: 8),
                _buildTab(
                  title: 'Belum',
                  index: 1,
                  count: chats.where((chat) => chat['unread'] == true).length,
                ),
              ],
            ),
          ),

          // DAFTAR CHAT
          Expanded(
            child: filteredChats.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat_bubble_outline,
                          size: 60,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Belum ada pesan',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Pesan dari calon penyewa akan muncul di sini.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 100),
                    itemCount: filteredChats.length,
                    itemBuilder: (context, index) {
                      final chat = filteredChats[index];

                      return _buildChatItem(chat);
                    },
                  ),
          ),
        ],
      ),

      // RESPONSE CEPAT
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 4,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.bolt,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Response Cepat = Kost Penuh',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Rata-rata respon Anda saat ini: 12 Menit',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 6),

            // NAVIGATION
            const SafeArea(
              top: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _NavigationItem(
                    icon: Icons.home_outlined,
                    label: 'Home',
                  ),
                  _NavigationItem(
                    icon: Icons.list_alt_outlined,
                    label: 'Data Kost',
                  ),
                  _NavigationItem(
                    icon: Icons.chat_bubble,
                    label: 'Chat',
                    active: true,
                  ),
                  _NavigationItem(
                    icon: Icons.person_outline,
                    label: 'Profil',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab({
    required String title,
    required int index,
    required int count,
  }) {
    final isSelected = selectedTab == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFE8F0FE)
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.blue : Colors.grey.shade700,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              '$count',
              style: TextStyle(
                fontSize: 11,
                color: isSelected ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatItem(Map<String, dynamic> chat) {
    final bool unread = chat['unread'] == true;

    return InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminChatDetailPage(
          nama: chat['name'],
          kost: chat['kost'].toString().split(' • ')[0],
          kamar: chat['kost'].toString().split(' • ').length > 1
              ? chat['kost'].toString().split(' • ')[1]
              : '',
          pesanAwal: chat['message'],
        ),
      ),
    );
  },
  
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey.shade200,
              child: const Icon(
                Icons.person,
                color: Colors.grey,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          chat['name'],
                          style: TextStyle(
                            fontWeight:
                                unread ? FontWeight.bold : FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                        chat['time'],
                        style: TextStyle(
                          fontSize: 10,
                          color: unread ? Colors.blue : Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 3),

                  Text(
                    chat['kost'],
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          chat['message'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11,
                            color: unread
                                ? Colors.black87
                                : Colors.grey.shade600,
                          ),
                        ),
                      ),

                      if (unread)
                        Container(
                          width: 18,
                          height: 18,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;

  const _NavigationItem({
    required this.icon,
    required this.label,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 21,
            color: active ? Colors.blue : Colors.grey,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 9,
              color: active ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}