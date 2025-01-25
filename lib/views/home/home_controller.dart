import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var categories = [].obs;
  var selectedCategory = 0.obs;
  var filteredProducts = [].obs;

  @override
  void onInit() {
    super.onInit();
    loadProductsFromJson();
  }

  void loadProductsFromJson() async {
    try {
      final String jsonString =
      await rootBundle.loadString('assets/products.json');
      final Map<String, dynamic> data = json.decode(jsonString);

      categories.value = data['categories'];
      filterProducts();
    } catch (e) {
      print("Error loading JSON: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void changeCategory(int index) {
    selectedCategory.value = index;
    filterProducts();
  }

  void filterProducts() {
    filteredProducts.value =
        categories[selectedCategory.value]['products'] ?? [];
  }
}
