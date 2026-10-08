import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../utils/constants.dart';
import 'search_results_screen.dart'; // <-- Import Search Results Screen

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  String _selectedPriceRange = 'Rp 400.000 - Rp 1.000.000';
  String _selectedLocation = 'Jati';
  String _selectedAvailability = 'Tersedia';

  final Map<String, bool> _facilities = {
    'WiFi': true,
    'AC': true,
    'Kamar Mandi Dalam': false,
    'Dapur': false,
    'Parkir': false,
  };

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Pencarian Kost',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _searchController.clear();
                _selectedPriceRange = 'Rp 400.000 - Rp 1.000.000';
                _selectedLocation = 'Jati';
                _selectedAvailability = 'Tersedia';
                _facilities.updateAll((key, value) => false);
              });
            },
            child: const Text(
              'Reset',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: AppColors.textSecondary,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Cari nama kost atau lokasi...',
                        hintStyle: TextStyle(
                          color: AppColors.textHint,
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  if (_searchController.text.isNotEmpty)
                    GestureDetector(
                      onTap: () => setState(() => _searchController.clear()),
                      child: const Icon(
                        Icons.close,
                        color: AppColors.textSecondary,
                        size: 20,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildDropdownSection(
              title: 'Rentang Harga',
              value: _selectedPriceRange,
              items: [
                'Rp 400.000 - Rp 1.000.000',
                'Rp 1.000.000 - Rp 2.000.000',
                'Rp 2.000.000 - Rp 3.000.000',
                '> Rp 3.000.000',
              ],
              onChanged: (val) => setState(() => _selectedPriceRange = val!),
            ),
            const SizedBox(height: 24),
            const Text(
              'Fasilitas',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: _facilities.keys.map((facility) {
                  return CheckboxListTile(
                    title: Text(
                      facility,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    value: _facilities[facility],
                    activeColor: AppColors.primary,
                    checkColor: AppColors.white,
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    onChanged: (bool? value) {
                      setState(() {
                        _facilities[facility] = value!;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),
            _buildDropdownSection(
              title: 'Lokasi',
              value: _selectedLocation,
              items: ['Jati', 'Jati Metro', 'Jati Perumnas'],
              onChanged: (val) => setState(() => _selectedLocation = val!),
            ),
            const SizedBox(height: 24),
            _buildDropdownSection(
              title: 'Ketersediaan Kamar',
              value: _selectedAvailability,
              items: ['Tersedia', 'Hampir Penuh', 'Penuh'],
              onChanged: (val) => setState(() => _selectedAvailability = val!),
              showStatusDot: true,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // NAVIGASI KE HASIL PENCARIAN
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchResultsScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Terapkan Filter',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownSection({
    required String title,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    bool showStatusDot = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.backgroundLight,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.textSecondary,
              ),
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Row(
                    children: [
                      if (showStatusDot && item == 'Tersedia') ...[
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.success,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                      Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
