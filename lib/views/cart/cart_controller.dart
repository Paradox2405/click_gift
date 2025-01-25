import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartController extends GetxController {
  var cart = <String, dynamic>{}.obs; // Observable map to store cart items
  var totalPrice = 0.0.obs; // Observable for total price

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }

  // Load the cart from SharedPreferences
  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final existingCart = prefs.getString('cart');
    if (existingCart != null) {
      cart.value = jsonDecode(existingCart);
      calculateTotalPrice();
    }
  }

  // Save the cart to SharedPreferences
  Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('cart', jsonEncode(cart.value));
  }

  // Increase the quantity of a cart item
  void increaseQuantity(String productId) {
    if (cart.containsKey(productId)) {
      cart[productId]['quantity']++;
      calculateTotalPrice();
      saveCart();
    }
  }

  // Decrease the quantity of a cart item
  void decreaseQuantity(String productId) {
    if (cart.containsKey(productId) && cart[productId]['quantity'] > 1) {
      cart[productId]['quantity']--;
      calculateTotalPrice();
      saveCart();
    }
  }

  // Remove an item from the cart
  void removeItem(String productId) {
    if (cart.containsKey(productId)) {
      cart.remove(productId);
      calculateTotalPrice();
      saveCart();
    }
  }

  // Calculate the total price of all items in the cart
  void calculateTotalPrice() {
    totalPrice.value = 0.0;
    cart.forEach((key, value) {
      totalPrice.value += value['product']['price'] * value['quantity'];
    });
  }
}
