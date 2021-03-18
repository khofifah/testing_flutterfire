class SignStatus {
  final bool status;
  final String message;

  SignStatus({
    this.status,
    this.message,
  });

  factory SignStatus.fromString(bool dataStatus, String dataMessage) {
    return SignStatus(
      status: dataStatus,
      message: dataMessage,
    );
  }

  Map toMap(SignStatus data) {
    var signData = Map<String, dynamic>();
    signData['status'] = data.status;
    signData['message'] = data.message;
    return signData;
  }
}
