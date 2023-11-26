import 'package:flutter/material.dart';
import 'package:payment_topic/core/widgets/appbar_widget.dart';
import 'package:payment_topic/features/checkout/presentation/views/widgets/card_details_view_body.dart';

class CartDetailsView extends StatelessWidget {
  const CartDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar('Payment Details'),
      body: CardDetailsViewBody(),
    );
  }
}
