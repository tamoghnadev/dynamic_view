import 'package:assignment/data/data_models.dart';
import 'package:flutter/material.dart';

class CategoryListWidget extends StatelessWidget {
  final List<Category> categories;

  const CategoryListWidget({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // Example height
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryItemWidget(category: category);
        },
      ),
    );
  }
}

class CategoryItemWidget extends StatelessWidget {
  final Category category;

  const CategoryItemWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            category.imageUrl,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
          ),
        ),
        const SizedBox(height: 8),
        Text(category.name),
      ],
    );
  }
}