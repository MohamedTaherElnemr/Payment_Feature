abstract class Failure {
  final String erroMessage;

  Failure(this.erroMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.erroMessage);
}
