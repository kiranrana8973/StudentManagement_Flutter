import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

// to generate the above file
// flutter pub run build_runner build
@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  String id;
  @JsonKey(name: 'fname')
  String fname;
  @JsonKey(name: 'lname')
  String lname;
  @JsonKey(name: 'username')
  String username;
  @JsonKey(name: 'password')
  String password;

  User(
      {this.id = "",
      this.fname = "",
      this.lname = "",
      this.username = "",
      this.password = ""});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
