import 'package:dartz/dartz.dart';
import 'package:payment_topic/core/errors/failures.dart';
import 'package:payment_topic/core/utils/stripe_service.dart';
import 'package:payment_topic/features/checkout/presentation/data/models/payment_intent_input_model.dart';
import 'package:payment_topic/features/checkout/presentation/data/repos/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    StripeService stripeService = StripeService();
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);

      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
