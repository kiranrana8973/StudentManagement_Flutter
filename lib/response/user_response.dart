import 'package:json_annotation/json_annotation.dart';
import '../model/user.dart';
part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "data")
  User user;

  UserResponse(this.success, this.user);

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
