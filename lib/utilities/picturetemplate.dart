import 'package:flutter/material.dart';

class PictureContainer extends StatelessWidget {
  final String mountainName;
  final String rating;
  final String cityLocation;
  final String countryName;
  final String linkPic;
  final VoidCallback onToggleFavorite;
  final bool isFavorite;

  const PictureContainer({
    super.key,
    required this.cityLocation,
    required this.countryName,
    required this.mountainName,
    required this.rating,
    required this.linkPic,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image card
        Container(
          height: 380,
          width: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(linkPic),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                color: Colors.black.withOpacity(0.3),
                offset: Offset(2, 4),
              ),
            ],
          ),
        ),

        // Heart icon
        Positioned(
          top: 12,
          right: 12,
          child: GestureDetector(
            onTap: onToggleFavorite,
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 20,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
            ),
          ),
        ),

        // Info section
        Positioned(
          bottom: 12,
          left: 12,
          right: 12,
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: mountainName,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: cityLocation,
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.white, size: 16),
                        SizedBox(width: 5),
                        Text(
                          countryName,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.star_border, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text(
                          rating,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
