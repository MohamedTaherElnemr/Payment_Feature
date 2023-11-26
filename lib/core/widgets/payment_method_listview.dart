import 'package:flutter/cupertino.dart';
import 'package:payment_topic/core/widgets/payment_method_tiem.dart';

class PaymentMethodsListview extends StatefulWidget {
  const PaymentMethodsListview({super.key});

  @override
  State<PaymentMethodsListview> createState() => _PaymentMethodsListviewState();
}

class _PaymentMethodsListviewState extends State<PaymentMethodsListview> {
  final List<String> images = const [
    'assets/images/card.svg',
    'assets/images/paypal.svg'
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                activeIndex = index;
                setState(() {});
              },
              child: paymentMethodItem(
                  isActive: activeIndex == index, image: images[index])),
          separatorBuilder: (context, index) => const SizedBox(
                width: 15,
              ),
          itemCount: images.length),
    );
  }
}
