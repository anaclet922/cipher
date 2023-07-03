// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cipher.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CipherModelAdapter extends TypeAdapter<CipherModel> {
  @override
  final int typeId = 1;

  @override
  CipherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CipherModel(
      id: fields[0] as String,
      name: fields[1] as String,
      cipher: fields[2] as String,
      type: fields[3] as String,
      createdAt: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CipherModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.cipher)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CipherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
