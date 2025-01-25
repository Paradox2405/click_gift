import 'package:click_gift/views/checkout/confirmation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatelessWidget {
  CheckoutPage({super.key});

  final TextEditingController addressController = TextEditingController();
  final TextEditingController recipientNameController = TextEditingController();
  final RxString selectedPaymentMethod = "Credit/Debit Card".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: recipientNameController,
              decoration: const InputDecoration(
                labelText: "Recipient Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: "Address",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            Obx(() {
              return DropdownButtonFormField<String>(
                value: selectedPaymentMethod.value,
                onChanged: (value) {
                  selectedPaymentMethod.value = value!;
                },
                decoration: const InputDecoration(
                  labelText: "Payment Method",
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "Credit/Debit Card",
                    child: Text("Credit/Debit Card"),
                  ),
                  DropdownMenuItem(
                    value: "Cash on Delivery",
                    child: Text("Cash on Delivery"),
                  ),
                ],
              );
            }),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to confirmation screen
                  Get.to(() => OrderConfirmationScreen(), arguments: {
                    "recipientName": recipientNameController.text,
                    "address": addressController.text,
                    "paymentMethod": selectedPaymentMethod.value,
                  });
                },
                child: const Text("Place Order"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
