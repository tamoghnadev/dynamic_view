// banner_widget.dart
import 'package:flutter/material.dart';
import 'package:assignment/data/data_models.dart';

class BannerWidget extends StatelessWidget {
  final List<HomepageBanner> banners;

  const BannerWidget({Key? key, required this.banners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // Adjust as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: banners.length,
        itemBuilder: (context, index) {
          final banner = banners[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.network(banner.imageUrl, fit: BoxFit.cover),
          );
        },
      ),
    );
  }
}