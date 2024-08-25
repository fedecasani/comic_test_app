part of 'comic_model.dart';

class ComicAdapter extends TypeAdapter<Comic> {
  @override
  final int typeId = 0;

  @override
  Comic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Comic(
      name: fields[0] as String,
      imageUrl: fields[1] as String,
      issueNumber: fields[2] as String,
      dateAdded: fields[3] as String,
      description: fields[4] as String,
      creators: (fields[5] as List).cast<String>(),
      characters: (fields[6] as List).cast<String>(),
      teams: (fields[7] as List).cast<String>(),
      locations: (fields[8] as List).cast<String>(),
      concepts: (fields[9] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Comic obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.issueNumber)
      ..writeByte(3)
      ..write(obj.dateAdded)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.creators)
      ..writeByte(6)
      ..write(obj.characters)
      ..writeByte(7)
      ..write(obj.teams)
      ..writeByte(8)
      ..write(obj.locations)
      ..writeByte(9)
      ..write(obj.concepts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComicAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
