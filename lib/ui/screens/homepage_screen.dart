// homepage_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assignment/bloc/homepage_bloc.dart';
import 'package:assignment/data/data_models.dart';
import 'package:assignment/ui/widgets/category_list_widget.dart';
import 'package:assignment/ui/widgets/product_list_widget.dart';
import 'package:assignment/ui/widgets/banner_widget.dart'; // Import BannerWidget
import 'package:assignment/ui/widgets/seller_list_widget.dart'; // Import SellerListWidget
import 'package:assignment/service_locator.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<HomepageBloc>()..add(LoadHomepageEvent()),
      child: BlocBuilder<HomepageBloc, HomepageState>(
        builder: (context, state) {
          print("HomepageScreen: Bloc State: $state");

          if (state is HomepageLoadingState) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          } else if (state is HomepageErrorState) {
            return Scaffold(body: Center(child: Text('Error: ${state.errorMessage}')));
          } else if (state is HomepageLoadedState) {
            print("HomepageScreen: Components received: ${state.components.length}");
            if (state.components.isEmpty) {
              return const Scaffold(body: Center(child: Text("No data to display")));
            }
            return Scaffold(
              appBar: AppBar(title: const Text('Dynamic Homepage')),
              body: ListView.builder(
                itemCount: state.components.length,
                itemBuilder: (context, index) {
                  final component = state.components[index];
                  print("HomepageScreen: Component Type: ${component.type}");
                  switch (component.type) {
                    case 'Banner':
                      print("HomepageScreen: Rendering Banner Widget");
                      List<HomepageBanner> banners = (component.data as List)
                          .map((item) => HomepageBanner.fromJson(item as Map<String, dynamic>))
                          .toList();
                      return BannerWidget(banners: banners); // Use BannerWidget
                    case 'Category':
                      print("HomepageScreen: Rendering Category Widget");
                      List<Category> categories = (component.data as List)
                          .map((item) => Category.fromJson(item as Map<String, dynamic>))
                          .toList();
                      return CategoryListWidget(categories: categories);
                    case 'Products': // Corrected case to 'Products' (plural)
                      print("HomepageScreen: Rendering Products Widget");
                      List<Product> products = (component.data as List)
                          .map((item) => Product.fromJson(item as Map<String, dynamic>))
                          .toList();
                      return ProductListWidget(products: products);
                    case 'Seller':
                      print("HomepageScreen: Rendering Seller Widget");
                      // Assuming you have Seller model and SellerListWidget
                      // List<Seller> sellers = (component.data as List).map(...).toList(); // Parse Seller data
                      return SellerListWidget(); // Placeholder for SellerListWidget
                    default:
                      print("HomepageScreen: Unknown Component Type: ${component.type}");
                      return const SizedBox.shrink();
                  }
                },
              ),
            );
          } else {
            return const Scaffold(body: Center(child: Text('Unknown state')));
          }
        },
      ),
    );
  }
}