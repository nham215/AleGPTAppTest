class Chat {
  int? id;
  String? name;
  int? userId;
  String? deletedAt;

  Chat({this.id, this.name, this.userId, this.deletedAt});

  Chat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['userId'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'userId': userId,
      'deletedAt': deletedAt,
    };
  }
}
