import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_topic/core/utils/api_keys.dart';
import 'package:payment_topic/core/widgets/widgets.dart';
import 'package:payment_topic/features/checkout/presentation/data/models/amount_model/amount_model.dart';
import 'package:payment_topic/features/checkout/presentation/data/models/amount_model/details.dart';
import 'package:payment_topic/features/checkout/presentation/data/models/item_list_model/item.dart';
import 'package:payment_topic/features/checkout/presentation/data/models/item_list_model/item_list_model.dart';

import 'package:payment_topic/features/checkout/presentation/views/manager/cubit/payment_cubit.dart';
import 'package:payment_topic/features/checkout/presentation/views/thank_you_view.dart';

class customButtonBlocConsumer extends StatelessWidget {
  const customButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return ThankYoutView();
          }));
        }

        if (state is PaymentFailure) {
          Navigator.pop(context);
          SnackBar snackBar = SnackBar(content: Text(state.errorMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return customButton(
            onTap: () {
              // PaymentIntentInputModel paymentIntentInputModel =
              //     PaymentIntentInputModel(
              //         amount: '100',
              //         currency: 'USD',
              //         customerId: 'cus_OvqYKDUSuZrAEi');
              // BlocProvider.of<PaymentCubit>(context).makepayment(
              //     paymentIntentInputModel: paymentIntentInputModel);

              var amountModel = AmountModel(
                total: '100',
                currency: 'USD',
                details: Details(
                  subtotal: '100',
                  shipping: '0',
                  shippingDiscount: 0,
                ),
              );

              List<OrderItemModel> orders = [
                OrderItemModel(
                  currency: 'USD',
                  name: 'Apple',
                  price: '4',
                  quantity: 10,
                ),
                OrderItemModel(
                  currency: 'USD',
                  name: 'Apple',
                  price: '5',
                  quantity: 12,
                ),
              ];

              var itemListModel = ItemListModel(
                orders: orders,
              );
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => PaypalCheckoutView(
                  sandboxMode: true,
                  clientId: ApiKeys.payPalClientId,
                  secretKey: ApiKeys.payPalSecretKey,
                  transactions: [
                    {
                      "amount": amountModel.toJson(),
                      "description": "The payment transaction description.",
                      "item_list": itemListModel.toJson(),
                    }
                  ],
                  note: "Contact us for any questions on your order.",
                  onSuccess: (Map params) async {
                    log("onSuccess: $params");
                    Navigator.pop(context);
                  },
                  onError: (error) {
                    log("onError: $error");
                    Navigator.pop(context);
                  },
                  onCancel: () {
                    log('cancelled:');
                    Navigator.pop(context);
                  },
                ),
              ));
            },
            isLoading: state is PaymentLoading ? true : false,
            title: 'Continue');
      },
    );
  }
}
