// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student(
    json['fullname'] as String,
    json['age'] as int,
    json['gender'] as String,
    json['address'] as String,
    json['photo'] as String,
  );
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'fullname': instance.fullname,
      'age': instance.age,
      'gender': instance.gender,
      'address': instance.address,
      'photo': instance.photo,
    };
