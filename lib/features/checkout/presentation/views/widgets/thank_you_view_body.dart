import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_check_icon.dart';
import '../../../../../core/widgets/custom_dashed_line.dart';
import '../../../../../core/widgets/thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 50,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const thankYouCard(),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            left: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            right: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          const Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: customCheckIcon(),
          ),
          Positioned(
              bottom: MediaQuery.sizeOf(context).height * 0.2 + 20,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  children: customDashedLine(),
                ),
              ))
        ],
      ),
    );
  }
}
