import 'package:flutter/cupertino.dart';
import 'package:payment_topic/core/widgets/payment_method_listview.dart';

import 'custom_button_bloc_consumer.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentMethodsListview(),
          const SizedBox(
            height: 16,
          ),
          customButtonBlocConsumer(),
        ],
      ),
    );
  }
}
