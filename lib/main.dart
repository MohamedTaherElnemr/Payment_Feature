import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_topic/core/utils/api_keys.dart';
import 'package:payment_topic/features/checkout/presentation/views/my_cart_view.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const CheckOut());
}

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}

// 1 - create payment intent(amount , currency , customerId) returns paymemt intent opject
// 2 -  create ephemeralKey(stripeVersion , customerId) and needs KeySecret
// 3- init payment sheet(merchantDisplayName , paymentIntentClientSecret)
// 4 -  present payment sheet : await Stripe.instance.presentPaymentSheet();
