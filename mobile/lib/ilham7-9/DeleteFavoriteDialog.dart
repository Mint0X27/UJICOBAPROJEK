import 'dart:ui';
import 'package:flutter/material.dart';

class DeleteFavoriteDialog extends StatelessWidget {
  final String namaKost;
  final VoidCallback onDelete;

  const DeleteFavoriteDialog({
    super.key,
    required this.namaKost,
    required this.onDelete,
  });

  static void show(
    BuildContext context, {
    required String namaKost,
    required VoidCallback onDelete,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Delete",
      barrierColor: Colors.black.withOpacity(0.3),
      transitionDuration: const Duration(milliseconds: 200),

      pageBuilder: (context, animation, secondaryAnimation) {
        return DeleteFavoriteDialog(
          namaKost: namaKost,
          onDelete: onDelete,
        );
      },

      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [

            // Icon Delete
            Container(
              width: 55,
              height: 55,

              decoration: const BoxDecoration(
                color: Color(0xffffeeee),
                shape: BoxShape.circle,
              ),

              child: const Icon(
                Icons.delete_outline,
                color: Colors.red,
                size: 30,
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              "Hapus dari Favorit?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "$namaKost akan dihapus dari daftar\nfavorit Anda.",
              textAlign: TextAlign.center,

              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 22),

            Row(
              children: [

                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    child: const Text(
                      "Batal",
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),

                    onPressed: () {
                      Navigator.pop(context);
                      onDelete();
                    },

                    child: const Text(
                      "Hapus",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}