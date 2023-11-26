import 'package:flutter/material.dart';
import 'package:payment_topic/features/checkout/presentation/views/widgets/my_cart_view_body.dart';

import '../../../../core/widgets/appbar_widget.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar('My Cart'),
      body: MyCartViewBody(),
    );
  }
}
