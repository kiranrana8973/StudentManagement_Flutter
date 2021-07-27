// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['_id'] as String,
    fname: json['fname'] as String,
    lname: json['lname'] as String,
    username: json['username'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'fname': instance.fname,
      'lname': instance.lname,
      'username': instance.username,
      'password': instance.password,
    };
