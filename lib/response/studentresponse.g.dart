// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studentresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentResponse _$StudentResponseFromJson(Map<String, dynamic> json) {
  return StudentResponse(
    json['success'] as bool,
    json['count'] as int,
    (json['data'] as List<dynamic>)
        .map((e) => Student.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$StudentResponseToJson(StudentResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };
