class Account {
  int id;
  String email;
  String password;

  // Constructor
  Account({required this.id, required this.email, required this.password});

  // Named constructor để tạo một đối tượng từ Map
  Account.fromJson(Map<String, dynamic> json)
      : id = json['Id'],
        email = json['Email'],
        password = json['Password'];

  // Method để chuyển đối tượng thành Map
  Map<String, dynamic> toJson() => {
        'Id': id,
        'Email': email,
        'Password': password,
      };
}
