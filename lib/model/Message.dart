class MessageModel {
  int chatId;
  String content;
  String senderType;

  MessageModel(
      {required this.chatId, required this.content, required this.senderType});

  bool get isUserMessage => senderType == 'user';

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      chatId: map['chatId'],
      content: map['content'],
      senderType: map['senderType'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chatId': chatId,
      'content': content,
      'senderType': senderType,
    };
  }

  @override
  String toString() {
    return 'Message{chatId: $chatId, content: $content, senderType: $senderType}';
  }
}
