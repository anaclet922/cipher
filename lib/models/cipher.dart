import 'package:hive/hive.dart';

part 'cipher.g.dart';

@HiveType(typeId: 1)
class CipherModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String cipher;
  @HiveField(3)
  String type; //cipher, password
  @HiveField(4)
  String createdAt;

  CipherModel(
      {required this.id,
        required this.name,
        required this.cipher,
        required this.type,
        required this.createdAt});

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'cipher': cipher,
    'type': type,
    'createdAt': createdAt
  };

}
