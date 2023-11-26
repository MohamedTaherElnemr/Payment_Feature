import 'package:flutter/material.dart';
import 'package:payment_topic/features/checkout/presentation/views/thank_you_view.dart';
import '../../../../../core/widgets/custom_credit_card.dart';
import '../../../../../core/widgets/payment_method_listview.dart';
import '../../../../../core/widgets/widgets.dart';

class CardDetailsViewBody extends StatefulWidget {
  const CardDetailsViewBody({super.key});

  @override
  State<CardDetailsViewBody> createState() => _CardDetailsViewBodyState();
}

class _CardDetailsViewBodyState extends State<CardDetailsViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.only(left: 12),
          child: PaymentMethodsListview(),
        )),
        SliverToBoxAdapter(
            child: CustomeCreditCard(
          autovalidateMode: autovalidateMode,
          formKey: formKey,
        )),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 25),
                child: customButton(
                  title: 'Pay',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ThankYoutView();
                      }));
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
              )),
        ),
      ],
    );
  }
}
