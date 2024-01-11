class MessageModel {
  int id;
  int chatId;
  String content;
  String senderType;
  DateTime? time;

  MessageModel(
      {required this.id,
      required this.chatId,
      required this.content,
      required this.senderType,
      this.time});

  bool get isUserMessage => senderType == 'user';

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
        id: map['id'],
        chatId: map['chatId'],
        content: map['content'],
        senderType: map['senderType'],
        time: map['time']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'chatId': chatId,
      'content': content,
      'senderType': senderType,
      'time': time,
    };
  }

  @override
  String toString() {
    return 'Message{id: $id,chatId: $chatId, content: $content, senderType: $senderType, time: $time}';
  }
}
