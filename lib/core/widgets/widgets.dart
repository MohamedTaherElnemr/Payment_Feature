import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_topic/core/utils/styles.dart';

class customButton extends StatelessWidget {
  const customButton({
    super.key,
    this.onTap,
    required this.title,
    this.isLoading = false,
  });

  final Function()? onTap;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Text(
                  '$title',
                  textAlign: TextAlign.center,
                  style: Styles.style22,
                ),
              ),
        decoration: ShapeDecoration(
          color: Color(0xFF34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${title}',
          textAlign: TextAlign.center,
          style: Styles.style18,
        ),
        const Spacer(),
        Text(
          '${value}',
          textAlign: TextAlign.center,
          style: Styles.style18,
        ),
      ],
    );
  }
}

class TotalSumitem extends StatelessWidget {
  const TotalSumitem({super.key, required this.title, required this.value});
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${title}',
          textAlign: TextAlign.center,
          style: Styles.style24,
        ),
        const Spacer(),
        Text(
          '${value}',
          textAlign: TextAlign.center,
          style: Styles.style24,
        ),
      ],
    );
  }
}
