import 'package:click_gift/components/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ProductController extends GetxController {
  var cart = <String, dynamic>{}.obs; // Observable cart map
  var quantity = 1.obs; // Observable quantity for the product

  void addToCart(String productId, Map<String, dynamic> productDetails) async {
    final prefs = await SharedPreferences.getInstance();

    // Load existing cart from SharedPreferences
    final existingCart = prefs.getString('cart');
    if (existingCart != null) {
      cart.value = jsonDecode(existingCart);
    }

    // Check if the product is already in the cart
    if (cart.containsKey(productId)) {
      cart[productId]['quantity'] += quantity.value;
    } else {
      cart[productId] = {
        'product': productDetails,
        'quantity': quantity.value,
      };
    }

    // Save the updated cart to SharedPreferences
    prefs.setString('cart', jsonEncode(cart.value));
    Get.back();
    showCustomSnackbar(
      title: "Success",
      message: "${productDetails['name']} added to the cart!",
     backgroundColor: Colors.greenAccent
    );

  }

  void increaseQuantity() {
    quantity++;
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }
}
