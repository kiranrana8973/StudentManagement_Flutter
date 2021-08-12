import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable()
class Student {
  @JsonKey(name: '_id')
  String id;
  String fullname;
  int age;
  String gender;
  String address;
  String photo;

  Student(
      this.id, this.fullname, this.age, this.gender, this.address, this.photo);

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}


/*
"photo": "no-photo.jpg",
            "_id": "60fc544083b3b61eb80c4465",
            "fullname": "kiran rana",
            "age": 32,
            "gender": "Male",
            "address": "KTM",
*/