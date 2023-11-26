import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_topic/core/utils/styles.dart';
import 'package:payment_topic/core/widgets/payment_info_item.dart';
import 'package:payment_topic/core/widgets/widgets.dart';

class thankYouCard extends StatelessWidget {
  const thankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Color(0xFFD9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 24, right: 24),
        child: Column(
          children: [
            const Text(
              'Thank you!',
              textAlign: TextAlign.center,
              style: Styles.style25,
            ),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: Styles.style20,
            ),
            const SizedBox(
              height: 42,
            ),
            PaymentInfoItem(title: 'Date', value: '01/24/2023'),
            const SizedBox(
              height: 20,
            ),
            PaymentInfoItem(title: 'Time', value: '10:15 AM'),
            const SizedBox(
              height: 20,
            ),
            PaymentInfoItem(title: 'To', value: 'Sam Louis'),
            const Divider(
              thickness: 2,
              height: 60,
            ),
            TotalSumitem(title: 'Total', value: r'$50.97'),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 305,
              height: 73,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 23, top: 16, bottom: 16, right: 98),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/images/credit_logo.svg'),
                    const SizedBox(
                      width: 23,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Credit Card ',
                            style: Styles.style18,
                          ),
                          TextSpan(
                            text: 'Mastercard **78',
                            style: TextStyle(
                              color:
                                  Colors.black.withOpacity(0.699999988079071),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  FontAwesomeIcons.barcode,
                  size: 64,
                ),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.50, color: Color(0xFF34A853)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF34A853),
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 58,
            )
          ],
        ),
      ),
    );
  }
}
