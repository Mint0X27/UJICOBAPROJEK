import 'package:flutter/material.dart';

class AppColors {
  // Warna Utama (Primary) - Biru seperti di logo & tombol
  static const Color primary = Color(0xFF2563EB); // Biru KostRadar
  static const Color primaryDark = Color(
    0xFF1D4ED8,
  ); // Biru lebih gelap (untuk hover/pressed)
  static const Color primaryLight = Color(
    0xFFDBEAFE,
  ); // Biru sangat muda (untuk background badge)

  // Background
  static const Color background = Color(0xFFFFFFFF); // Putih
  static const Color backgroundLight = Color(0xFFF9FAFB); // Abu-abu sangat muda

  // Teks
  static const Color textPrimary = Color(
    0xFF111827,
  ); // Hitam/abu-abu gelap (judul)
  static const Color textSecondary = Color(
    0xFF6B7280,
  ); // Abu-abu (subtitle/deskripsi)
  static const Color textHint = Color(
    0xFF9CA3AF,
  ); // Abu-abu terang (placeholder input)

  // Border & Input
  static const Color border = Color(0xFFD1D5DB); // Abu-abu border input
  static const Color inputBackground = Color(
    0xFFF3F4F6,
  ); // Background input field

  // Success & Error (untuk nanti di Login/Register)
  static const Color success = Color(0xFF10B981); // Hijau
  static const Color error = Color(0xFFEF4444); // Merah

  // Putih & Hitam murni
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
}
