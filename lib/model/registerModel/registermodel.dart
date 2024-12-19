class RegisterUser {
  String? name;
  String? username;
  String? password;
  String? email;
  String? token;
  RegisterUser(
      {required this.email,
      required this.name,
      required this.password,
      required this.username});
  factory RegisterUser.fromJson(Map<String, dynamic> json) {
    return RegisterUser(
      email: json['email'],
      name: json['name'],
      password: json['password'],
      username: json['username'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "username": username,
      "password": password,
      "email": email
    };
  }
}
