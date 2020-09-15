import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) => json.encode(data.toJson());

class RegisterResponse {
  RegisterResponse({
    this.message,
  });

  String message;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
