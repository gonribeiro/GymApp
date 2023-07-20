class AuthenticationModel {
  String email;
  String password;

  AuthenticationModel({
    required this.email,
    required this.password,
  });

  AuthenticationModel.fromMap(Map<String, dynamic> map):
    email = map["email"],
    password = map["password"];

    Map<String, dynamic> toMap() {
      return {
        "email": email,
        "password": password,
      };
    }
}