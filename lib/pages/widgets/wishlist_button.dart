import 'package:flutter/material.dart';

class WishlistButton extends StatefulWidget {
  const WishlistButton({super.key});

  @override
  _WishlistButtonState createState() => _WishlistButtonState();
}

class _WishlistButtonState extends State<WishlistButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isClicked = !isClicked; // Toggle status klik
        });
      },
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle, // Membuat tombol berbentuk lingkaran
          color: Colors.white, // Background putih
        ),
        padding: const EdgeInsets.all(2), // Padding di sekitar gambar
        child: Image.asset(
          isClicked
              ? 'assets/images/btn_wishlist_clicked.png' // Gambar warna orange
              : 'assets/images/btn_wishlist.png', // Gambar warna putih
          width: 40,
        ),
      ),
    );
  }
}
