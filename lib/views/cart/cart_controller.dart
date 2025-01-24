import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  var cartItems = <String>[].obs;

  void addItem(String item) {
    cartItems.add(item);
    saveCartToPreferences();
  }

  void removeItem(String item) {
    cartItems.remove(item);
    saveCartToPreferences();
  }

  void saveCartToPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('cartItems', cartItems.toList());
  }

  void loadCartFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartItems.value = prefs.getStringList('cartItems') ?? [];
  }
}
