class LoginUser {
  String? username;
  String? password;
  String? token;
  LoginUser({required this.password, required this.username, this.token});
  factory LoginUser.fromJson(Map<String, dynamic> json) {
    return LoginUser(
        password: json['password'],
        username: json['username'],
        token: json['token']);
  }

  Map<String, dynamic> toJson() {
    return {"username": username, "password": password};
  }
}
