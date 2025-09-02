class Message {
  final String message;
  final int mailMe;
  final int mailReceveur;

  const Message({
    required this.message,
    required this.mailMe,
    required this.mailReceveur,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      mailMe: json["mailMe"],
      message: json["message"],
      mailReceveur: json["mailReceveur"],
    );
  }
  Map<String, dynamic> toJson() {
    return {"mailMe": mailMe, "message": message, "mailReceveur": mailReceveur};
  }
}
