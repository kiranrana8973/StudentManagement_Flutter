import 'package:studentmanagement/model/student.dart';
import 'package:json_annotation/json_annotation.dart';

part 'studentresponse.g.dart';

@JsonSerializable()
class StudentResponse {
  bool success;
  int count;
  List<Student> data;

  StudentResponse(this.success, this.count, this.data);

  factory StudentResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StudentResponseToJson(this);
}

/*

    "success": true,
    "count": 3,
    "data": [
*/