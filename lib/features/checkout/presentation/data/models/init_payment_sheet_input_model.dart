class InitPaymentSheetInputModel {
  final String secretKey;
  final String customerId;
  final String ephemeralKey;

  InitPaymentSheetInputModel(
      {required this.secretKey,
      required this.customerId,
      required this.ephemeralKey});
}
