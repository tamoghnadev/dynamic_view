// data_models.dart
class Category {
  final String name;
  final String imageUrl;

  Category({required this.name, required this.imageUrl});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['cat_name'] ?? 'Category Name', // Corrected key to 'cat_name' based on API response
      imageUrl: json['cat_image'] ?? '', // Corrected key to 'cat_image' based on API response
    );
  }
}

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] ?? 'Product Name',
      description: json['description'] ?? 'Product Description',
      price: (json['price'] ?? 0.0).toDouble(),
      imageUrl: json['image_url'] ?? '',
    );
  }
}

class HomepageBanner {
  final String bannerName;
  final String imageUrl;
  final String redirectTo;
  final String redirectId;

  HomepageBanner({required this.bannerName, required this.imageUrl, required this.redirectTo, required this.redirectId});

  factory HomepageBanner.fromJson(Map<String, dynamic> json) {
    return HomepageBanner(
      bannerName: json['banner_name'] ?? 'Banner Name',
      imageUrl: json['appbanner_image'] ?? '', // Corrected key based on API response
      redirectTo: json['redirect_to'] ?? '',
      redirectId: json['redirect_id'] ?? '',
    );
  }
}

class HomepageComponent {
  final String type;
  final dynamic data;

  HomepageComponent({required this.type, required this.data});

  factory HomepageComponent.fromJson(Map<String, dynamic> json) {
    return HomepageComponent(
      type: json['viewtype'] ?? 'unknown', // Corrected key to 'viewtype'
      data: json['data'], // Data will be parsed based on 'type'
    );
  }
}