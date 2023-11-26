import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_topic/features/checkout/presentation/data/repos/checkout_repo_impl.dart';
import 'package:payment_topic/features/checkout/presentation/views/manager/cubit/payment_cubit.dart';
import '../../../../../core/widgets/payment_methods_bottom_sheet.dart';
import '../../../../../core/widgets/widgets.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset('assets/images/basket.png')),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
            title: "Order Subtotal",
            value: r'$42.97',
          ),
          const OrderInfoItem(
            title: "Discount",
            value: r'$0',
          ),
          const OrderInfoItem(
            title: "Shipping",
            value: r'$8',
          ),
          const Divider(
            thickness: 2,
            height: 34,
            color: Color(0xFFC6C6C6),
          ),
          const TotalSumitem(title: 'Total', value: r'$50.97'),
          const SizedBox(
            height: 16,
          ),
          customButton(
            title: 'Complete Payment',
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  context: context,
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => PaymentCubit(CheckoutRepoImpl()),
                      child: PaymentMethodBottomSheet(),
                    );
                  });
            },
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
