class Surah {
  int? number;
  int? sequence;
  int? numberOfVerses;
  Name? name;
  Revelation? revelation;
  Tafsir? tafsir;

  Surah(
      {this.number,
      this.sequence,
      this.numberOfVerses,
      this.name,
      this.revelation,
      this.tafsir});

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        number: json['number'],
        sequence: json['sequence'],
        numberOfVerses: json['numberOfVerses'],
        name: json['name'] != null ? Name.fromJson(json['name']) : null,
        revelation: json['revelation'] != null
            ? Revelation.fromJson(json['revelation'])
            : null,
        tafsir: json['tafsir'] != null ? Tafsir.fromJson(json['tafsir']) : null,
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "sequence": sequence,
        "numberOfVerses": numberOfVerses,
        "name": name?.toJson(),
        "revelation": revelation?.toJson(),
        "tafsir": tafsir?.toJson(),
      };
}

class Name {
  String? short;
  String? long;
  Translation? transliteration;
  Translation? translation;

  Name({this.short, this.long, this.transliteration, this.translation});

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        short: json['short'],
        long: json['long'],
        translation: json['translation'] != null
            ? Translation.fromJson(json['translation'])
            : null,
        transliteration: json['transliteration'] != null
            ? Translation.fromJson(json['transliteration'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
        "transliteration": transliteration?.toJson(),
        "translation": translation?.toJson(),
      };
}

class Translation {
  String? en;
  String? id;

  Translation({this.en, this.id});

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        en: json["en"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "id": id,
      };
}

class Revelation {
  String? arab;
  String? en;
  String? id;

  Revelation({this.arab, this.en, this.id});

  factory Revelation.fromJson(Map<String, dynamic> json) => Revelation(
        arab: json['arab'],
        en: json['en'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "en": en,
        "id": id,
      };
}

class Tafsir {
  String? id;

  Tafsir({this.id});

  factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
