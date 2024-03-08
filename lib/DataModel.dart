import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  Report report;
  List<HouseCuspsAndSandhi> houseCuspsAndSandhi;
  Dosha dosha;
  List<Gemstone> gemstones;

  DataModel({
    required this.report,
    required this.houseCuspsAndSandhi,
    required this.dosha,
    required this.gemstones,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        report: Report.fromJson(json["report"]),
        houseCuspsAndSandhi: List<HouseCuspsAndSandhi>.from(
            json["houseCuspsAndSandhi"]
                .map((x) => HouseCuspsAndSandhi.fromJson(x))),
        dosha: Dosha.fromJson(json["dosha"]),
        gemstones: List<Gemstone>.from(
            json["gemstones"].map((x) => Gemstone.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "report": report.toJson(),
        "houseCuspsAndSandhi":
            List<dynamic>.from(houseCuspsAndSandhi.map((x) => x.toJson())),
        "dosha": dosha.toJson(),
        "gemstones": List<dynamic>.from(gemstones.map((x) => x.toJson())),
      };
}

class Dosha {
  List<KalsarpaDosha> kalsarpaDosha;
  List<ManglikDosha> manglikDosha;
  List<SadhesatiAnalysis> sadhesatiAnalysis;

  Dosha({
    required this.kalsarpaDosha,
    required this.manglikDosha,
    required this.sadhesatiAnalysis,
  });

  factory Dosha.fromJson(Map<String, dynamic> json) => Dosha(
        kalsarpaDosha: List<KalsarpaDosha>.from(
            json["kalsarpaDosha"].map((x) => KalsarpaDosha.fromJson(x))),
        manglikDosha: List<ManglikDosha>.from(
            json["manglikDosha"].map((x) => ManglikDosha.fromJson(x))),
        sadhesatiAnalysis: List<SadhesatiAnalysis>.from(
            json["sadhesatiAnalysis"]
                .map((x) => SadhesatiAnalysis.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kalsarpaDosha":
            List<dynamic>.from(kalsarpaDosha.map((x) => x.toJson())),
        "manglikDosha": List<dynamic>.from(manglikDosha.map((x) => x.toJson())),
        "sadhesatiAnalysis":
            List<dynamic>.from(sadhesatiAnalysis.map((x) => x.toJson())),
      };
}

class KalsarpaDosha {
  String type;
  String heading;
  dynamic data;

  KalsarpaDosha({
    required this.type,
    required this.heading,
    required this.data,
  });

  factory KalsarpaDosha.fromJson(Map<String, dynamic> json) => KalsarpaDosha(
        type: json["type"],
        heading: json["heading"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "heading": heading,
        "data": data,
      };
}

class PurpleData {
  bool present;
  String oneLine;

  PurpleData({
    required this.present,
    required this.oneLine,
  });

  factory PurpleData.fromJson(Map<String, dynamic> json) => PurpleData(
        present: json["present"],
        oneLine: json["one_line"],
      );

  Map<String, dynamic> toJson() => {
        "present": present,
        "one_line": oneLine,
      };
}

class ManglikDosha {
  String type;
  String heading;
  dynamic data;

  ManglikDosha({
    required this.type,
    required this.heading,
    required this.data,
  });

  factory ManglikDosha.fromJson(Map<String, dynamic> json) => ManglikDosha(
        type: json["type"],
        heading: json["heading"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "heading": heading,
        "data": data,
      };
}

class FluffyData {
  ManglikPresentRule manglikPresentRule;
  List<dynamic> manglikCancelRule;
  bool isMarsManglikCancelled;
  String manglikStatus;
  double percentageManglikPresent;
  double percentageManglikAfterCancellation;
  String manglikReport;
  bool isPresent;
  String whatIsManglikDosha;

  FluffyData({
    required this.manglikPresentRule,
    required this.manglikCancelRule,
    required this.isMarsManglikCancelled,
    required this.manglikStatus,
    required this.percentageManglikPresent,
    required this.percentageManglikAfterCancellation,
    required this.manglikReport,
    required this.isPresent,
    required this.whatIsManglikDosha,
  });

  factory FluffyData.fromJson(Map<String, dynamic> json) => FluffyData(
        manglikPresentRule:
            ManglikPresentRule.fromJson(json["manglik_present_rule"]),
        manglikCancelRule:
            List<dynamic>.from(json["manglik_cancel_rule"].map((x) => x)),
        isMarsManglikCancelled: json["is_mars_manglik_cancelled"],
        manglikStatus: json["manglik_status"],
        percentageManglikPresent:
            json["percentage_manglik_present"]?.toDouble(),
        percentageManglikAfterCancellation:
            json["percentage_manglik_after_cancellation"]?.toDouble(),
        manglikReport: json["manglik_report"],
        isPresent: json["is_present"],
        whatIsManglikDosha: json["what_is_manglik_dosha_?"],
      );

  Map<String, dynamic> toJson() => {
        "manglik_present_rule": manglikPresentRule.toJson(),
        "manglik_cancel_rule":
            List<dynamic>.from(manglikCancelRule.map((x) => x)),
        "is_mars_manglik_cancelled": isMarsManglikCancelled,
        "manglik_status": manglikStatus,
        "percentage_manglik_present": percentageManglikPresent,
        "percentage_manglik_after_cancellation":
            percentageManglikAfterCancellation,
        "manglik_report": manglikReport,
        "is_present": isPresent,
        "what_is_manglik_dosha_?": whatIsManglikDosha,
      };
}

class ManglikPresentRule {
  List<String> basedOnAspect;
  List<String> basedOnHouse;

  ManglikPresentRule({
    required this.basedOnAspect,
    required this.basedOnHouse,
  });

  factory ManglikPresentRule.fromJson(Map<String, dynamic> json) =>
      ManglikPresentRule(
        basedOnAspect: List<String>.from(json["based_on_aspect"].map((x) => x)),
        basedOnHouse: List<String>.from(json["based_on_house"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "based_on_aspect": List<dynamic>.from(basedOnAspect.map((x) => x)),
        "based_on_house": List<dynamic>.from(basedOnHouse.map((x) => x)),
      };
}

class SadhesatiAnalysis {
  String type;
  String heading;
  dynamic data;

  SadhesatiAnalysis({
    required this.type,
    required this.heading,
    required this.data,
  });

  factory SadhesatiAnalysis.fromJson(Map<String, dynamic> json) =>
      SadhesatiAnalysis(
        type: json["type"],
        heading: json["heading"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "heading": heading,
        "data": data,
      };
}

class TentacledData {
  String considerationDate;
  bool isSaturnRetrograde;
  String moonSign;
  String saturnSign;
  String isUndergoingSadhesati;
  bool sadhesatiStatus;
  String whatIsSadhesati;

  TentacledData({
    required this.considerationDate,
    required this.isSaturnRetrograde,
    required this.moonSign,
    required this.saturnSign,
    required this.isUndergoingSadhesati,
    required this.sadhesatiStatus,
    required this.whatIsSadhesati,
  });

  factory TentacledData.fromJson(Map<String, dynamic> json) => TentacledData(
        considerationDate: json["consideration_date"],
        isSaturnRetrograde: json["is_saturn_retrograde"],
        moonSign: json["moon_sign"],
        saturnSign: json["saturn_sign"],
        isUndergoingSadhesati: json["is_undergoing_sadhesati"],
        sadhesatiStatus: json["sadhesati_status"],
        whatIsSadhesati: json["what_is_sadhesati_?"],
      );

  Map<String, dynamic> toJson() => {
        "consideration_date": considerationDate,
        "is_saturn_retrograde": isSaturnRetrograde,
        "moon_sign": moonSign,
        "saturn_sign": saturnSign,
        "is_undergoing_sadhesati": isUndergoingSadhesati,
        "sadhesati_status": sadhesatiStatus,
        "what_is_sadhesati_?": whatIsSadhesati,
      };
}

class Gemstone {
  String type;
  String heading;
  GemstoneData data;

  Gemstone({
    required this.type,
    required this.heading,
    required this.data,
  });

  factory Gemstone.fromJson(Map<String, dynamic> json) => Gemstone(
        type: json["type"],
        heading: json["heading"],
        data: GemstoneData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "heading": heading,
        "data": data.toJson(),
      };
}

class GemstoneData {
  Benefic life;
  Benefic benefic;
  Benefic lucky;

  GemstoneData({
    required this.life,
    required this.benefic,
    required this.lucky,
  });

  factory GemstoneData.fromJson(Map<String, dynamic> json) => GemstoneData(
        life: Benefic.fromJson(json["LIFE"]),
        benefic: Benefic.fromJson(json["BENEFIC"]),
        lucky: Benefic.fromJson(json["LUCKY"]),
      );

  Map<String, dynamic> toJson() => {
        "LIFE": life.toJson(),
        "BENEFIC": benefic.toJson(),
        "LUCKY": lucky.toJson(),
      };
}

class Benefic {
  String name;
  String gemKey;
  String semiGem;
  String wearFinger;
  String weightCaret;
  String wearMetal;
  String wearDay;
  String gemDeity;

  Benefic({
    required this.name,
    required this.gemKey,
    required this.semiGem,
    required this.wearFinger,
    required this.weightCaret,
    required this.wearMetal,
    required this.wearDay,
    required this.gemDeity,
  });

  factory Benefic.fromJson(Map<String, dynamic> json) => Benefic(
        name: json["name"],
        gemKey: json["gem_key"],
        semiGem: json["semi_gem"],
        wearFinger: json["wear_finger"],
        weightCaret: json["weight_caret"],
        wearMetal: json["wear_metal"],
        wearDay: json["wear_day"],
        gemDeity: json["gem_deity"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "gem_key": gemKey,
        "semi_gem": semiGem,
        "wear_finger": wearFinger,
        "weight_caret": weightCaret,
        "wear_metal": wearMetal,
        "wear_day": wearDay,
        "gem_deity": gemDeity,
      };
}

class HouseCuspsAndSandhi {
  String type;
  String heading;
  List<Datum> data;

  HouseCuspsAndSandhi({
    required this.type,
    required this.heading,
    required this.data,
  });

  factory HouseCuspsAndSandhi.fromJson(Map<String, dynamic> json) =>
      HouseCuspsAndSandhi(
        type: json["type"],
        heading: json["heading"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "heading": heading,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int house;
  String degree;
  String sign;
  String signLord;
  String startLord;
  String subLord;

  Datum({
    required this.house,
    required this.degree,
    required this.sign,
    required this.signLord,
    required this.startLord,
    required this.subLord,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        house: json["house"],
        degree: json["degree"],
        sign: json["sign"],
        signLord: json["sign_lord"],
        startLord: json["start_lord"],
        subLord: json["sub_lord"],
      );

  Map<String, dynamic> toJson() => {
        "house": house,
        "degree": degree,
        "sign": sign,
        "sign_lord": signLord,
        "start_lord": startLord,
        "sub_lord": subLord,
      };
}

class Report {
  List<FavourablePoint> favourablePoints;
  List<NumerologyReport> numerologyReport;
  List<AscendantReport> ascendantReport;

  Report({
    required this.favourablePoints,
    required this.numerologyReport,
    required this.ascendantReport,
  });

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        favourablePoints: List<FavourablePoint>.from(
            json["favourablePoints"].map((x) => FavourablePoint.fromJson(x))),
        numerologyReport: List<NumerologyReport>.from(
            json["numerologyReport"].map((x) => NumerologyReport.fromJson(x))),
        ascendantReport: List<AscendantReport>.from(
            json["ascendantReport"].map((x) => AscendantReport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "favourablePoints":
            List<dynamic>.from(favourablePoints.map((x) => x.toJson())),
        "numerologyReport":
            List<dynamic>.from(numerologyReport.map((x) => x.toJson())),
        "ascendantReport":
            List<dynamic>.from(ascendantReport.map((x) => x.toJson())),
      };
}

class AscendantReport {
  String type;
  String heading;
  AscendantReportData data;

  AscendantReport({
    required this.type,
    required this.heading,
    required this.data,
  });

  factory AscendantReport.fromJson(Map<String, dynamic> json) =>
      AscendantReport(
        type: json["type"],
        heading: json["heading"],
        data: AscendantReportData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "heading": heading,
        "data": data.toJson(),
      };
}

class AscendantReportData {
  String ascendant;
  String report;

  AscendantReportData({
    required this.ascendant,
    required this.report,
  });

  factory AscendantReportData.fromJson(Map<String, dynamic> json) =>
      AscendantReportData(
        ascendant: json["ascendant"],
        report: json["report"],
      );

  Map<String, dynamic> toJson() => {
        "ascendant": ascendant,
        "report": report,
      };
}

class FavourablePoint {
  String type;
  String heading;
  FavourablePointData data;

  FavourablePoint({
    required this.type,
    required this.heading,
    required this.data,
  });

  factory FavourablePoint.fromJson(Map<String, dynamic> json) =>
      FavourablePoint(
        type: json["type"],
        heading: json["heading"],
        data: FavourablePointData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "heading": heading,
        "data": data.toJson(),
      };
}

class FavourablePointData {
  String name;
  String dateOfBirth;
  int destinyNumber;
  int radicalNumber;
  int nameNumber;
  String evilNumber;
  String favouriteColour;
  String favouriteDay;
  String favouriteGod;
  String favouriteMantra;
  String favouriteMetal;
  String favouriteStone;
  String favouriteSubstones;
  String friendlyNumbers;
  String neutralNumber;
  String radicalRuler;

  FavourablePointData({
    required this.name,
    required this.dateOfBirth,
    required this.destinyNumber,
    required this.radicalNumber,
    required this.nameNumber,
    required this.evilNumber,
    required this.favouriteColour,
    required this.favouriteDay,
    required this.favouriteGod,
    required this.favouriteMantra,
    required this.favouriteMetal,
    required this.favouriteStone,
    required this.favouriteSubstones,
    required this.friendlyNumbers,
    required this.neutralNumber,
    required this.radicalRuler,
  });

  factory FavourablePointData.fromJson(Map<String, dynamic> json) =>
      FavourablePointData(
        name: json["name"],
        dateOfBirth: json["date_of_birth"],
        destinyNumber: json["destiny_number"],
        radicalNumber: json["radical_number"],
        nameNumber: json["name_number"],
        evilNumber: json["evil_number"],
        favouriteColour: json["favourite_colour"],
        favouriteDay: json["favourite_day"],
        favouriteGod: json["favourite_god"],
        favouriteMantra: json["favourite_mantra"],
        favouriteMetal: json["favourite_metal"],
        favouriteStone: json["favourite_stone"],
        favouriteSubstones: json["favourite_substones"],
        friendlyNumbers: json["friendly_numbers"],
        neutralNumber: json["neutral_number"],
        radicalRuler: json["radical_ruler"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "date_of_birth": dateOfBirth,
        "destiny_number": destinyNumber,
        "radical_number": radicalNumber,
        "name_number": nameNumber,
        "evil_number": evilNumber,
        "favourite_colour": favouriteColour,
        "favourite_day": favouriteDay,
        "favourite_god": favouriteGod,
        "favourite_mantra": favouriteMantra,
        "favourite_metal": favouriteMetal,
        "favourite_stone": favouriteStone,
        "favourite_substones": favouriteSubstones,
        "friendly_numbers": friendlyNumbers,
        "neutral_number": neutralNumber,
        "radical_ruler": radicalRuler,
      };
}

class NumerologyReport {
  String type;
  String heading;
  List<String> data;

  NumerologyReport({
    required this.type,
    required this.heading,
    required this.data,
  });

  factory NumerologyReport.fromJson(Map<String, dynamic> json) =>
      NumerologyReport(
        type: json["type"],
        heading: json["heading"],
        data: List<String>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "heading": heading,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}
