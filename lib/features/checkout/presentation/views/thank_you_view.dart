import 'package:flutter/material.dart';
import 'package:payment_topic/core/widgets/appbar_widget.dart';
import 'package:payment_topic/features/checkout/presentation/views/widgets/thank_you_view_body.dart';

class ThankYoutView extends StatelessWidget {
  const ThankYoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(''),
      body: ThankYouViewBody(),
    );
  }
}
