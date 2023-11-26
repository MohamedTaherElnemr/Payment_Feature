import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_topic/core/utils/api_keys.dart';
import 'package:payment_topic/core/utils/api_service.dart';
import 'package:payment_topic/features/checkout/presentation/data/models/init_payment_sheet_input_model.dart';
import 'package:payment_topic/features/checkout/presentation/data/models/payment_intent_input_model.dart';
import 'package:payment_topic/features/checkout/presentation/data/models/payment_intent_model/payment_intent_model.dart';

import '../../features/checkout/presentation/data/models/epemeral_key_model/epemeral_key_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
        body: paymentIntentInputModel.toJson(),
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/payment_intents',
        token: ApiKeys.secretKey);

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      //main parameters
      merchantDisplayName: 'Mohamed',
      paymentIntentClientSecret: initPaymentSheetInputModel.secretKey,
      customerEphemeralKeySecret: initPaymentSheetInputModel.ephemeralKey,
      customerId: initPaymentSheetInputModel.customerId,
    ));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
        body: {'customer': customerId},
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKeys.secretKey,
        headers: {
          'Authorization': "Bearer ${ApiKeys.secretKey}",
          "Stripe-Version": "2023-10-16"
        });

    var ephemeralKey = EphemeralKeyModel.fromJson(response.data);

    return ephemeralKey;
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);

    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
        secretKey: paymentIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.customerId,
        ephemeralKey: ephemeralKeyModel.secret!);

    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);

    await displayPaymentSheet();
  }
}
