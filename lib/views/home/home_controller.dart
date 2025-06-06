import 'dart:convert';

import 'package:click_gift/routes/routes.dart';
import 'package:click_gift/services/auth_service.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var categories = [].obs;
  var selectedCategory = 0.obs;
  var filteredProducts = [].obs;
  var userName = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadProductsFromJson();
  }

  void loadProductsFromJson() async {
    User? user = await AuthService.getUser();
    userName.value = user!.name;
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

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(Routes.login);
  }
}
