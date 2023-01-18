// To parse this JSON data, do
//
//     final feedModel = feedModelFromJson(jsonString);

import 'dart:convert';

List<PostModel?> feedModelFromJson(String str) => json.decode(str) == null
    ? []
    : List<PostModel?>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String feedModelToJson(List<PostModel?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class PostModel {
  PostModel({
    required this.id,
    required this.caption,
    required this.media,
    required this.createdAt,
    required this.author,
    required this.spot,
    required this.relevantComments,
    required this.numberOfComments,
    required this.likedBy,
    required this.numberOfLikes,
    required this.tags,
    required this.url,
  });

  String? id;
  Caption? caption;
  List<Media?>? media;
  DateTime? createdAt;
  Author? author;
  Spot? spot;
  dynamic relevantComments;
  int? numberOfComments;
  List<Author?>? likedBy;
  int? numberOfLikes;
  List<Tag?>? tags;
  String? url;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["id"],
        caption: Caption.fromJson(json["caption"]),
        media: json["media"] == null
            ? []
            : List<Media?>.from(json["media"]!.map((x) => Media.fromJson(x))),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        author: Author.fromJson(json["author"]),
        spot: Spot.fromJson(json["spot"]),
        relevantComments: json["relevant_comments"],
        numberOfComments: json["number_of_comments"],
        likedBy: json["liked_by"] == null
            ? []
            : List<Author?>.from(
                json["liked_by"]!.map((x) => Author.fromJson(x))),
        numberOfLikes: json["number_of_likes"],
        tags: json["tags"] == null
            ? []
            : List<Tag?>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "caption": caption,
        "media": media == null
            ? []
            : List<dynamic>.from(media!.map((x) => x!.toJson())),
        "created_at": createdAt,
        "author": author,
        "spot": spot,
        "relevant_comments": relevantComments,
        "number_of_comments": numberOfComments,
        "liked_by": likedBy == null
            ? []
            : List<dynamic>.from(likedBy!.map((x) => x!.toJson())),
        "number_of_likes": numberOfLikes,
        "tags": tags,
        "url": url,
      };
}

class Author {
  Author({
    required this.id,
    required this.username,
    required this.photoUrl,
    required this.fullName,
    required this.isPrivate,
    required this.isVerified,
    required this.followStatus,
  });

  String? id;
  String? username;
  String? photoUrl;
  String? fullName;
  bool? isPrivate;
  bool? isVerified;
  String? followStatus;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        username: json["username"],
        photoUrl: json["photo_url"],
        fullName: json["full_name"],
        isPrivate: json["is_private"],
        isVerified: json["is_verified"],
        followStatus: json["follow_status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "photo_url": photoUrl,
        "full_name": fullName,
        "is_private": isPrivate,
        "is_verified": isVerified,
        "follow_status": followStatus,
      };
}

class Caption {
  Caption({
    required this.text,
    required this.tags,
  });

  String? text;
  List<Tag?>? tags;

  factory Caption.fromJson(Map<String, dynamic> json) => Caption(
        text: json["text"],
        tags: json["tags"] == null
            ? []
            : List<Tag?>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "tags": tags == null
            ? []
            : List<dynamic>.from(tags!.map((x) => x!.toJson())),
      };
}

class Tag {
  Tag({
    this.id,
    this.displayText,
    this.tagText,
    this.url,
    this.type,
  });

  String? id;
  String? displayText;
  String? tagText;
  String? url;
  String? type;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        displayText: json["display_text"],
        tagText: json["tag_text"],
        url: json["url"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "display_text": displayText,
        "tag_text": tagText,
        "url": url,
        "type": type,
      };
}

class Media {
  Media({
    required this.url,
    required this.blurHash,
    required this.type,
  });

  String? url;
  String? blurHash;
  String? type;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        url: json["url"],
        blurHash: json["blur_hash"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "blur_hash": blurHash,
        "type": type,
      };
}

class Spot {
  Spot({
    required this.id,
    required this.name,
    required this.types,
    required this.logo,
    required this.location,
    required this.isSaved,
  });

  String? id;
  String? name;
  List<Type?>? types;
  Media? logo;
  Location? location;
  bool? isSaved;

  factory Spot.fromJson(Map<String, dynamic> json) => Spot(
        id: json["id"],
        name: json["name"],
        types: json["types"] == null
            ? []
            : List<Type?>.from(json["types"]!.map((x) => Type.fromJson(x))),
        logo: Media.fromJson(json["logo"]),
        location: Location.fromJson(json["location"]),
        isSaved: json["is_saved"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "types": types == null
            ? []
            : List<dynamic>.from(types!.map((x) => x!.toJson())),
        "logo": logo,
        "location": location,
        "is_saved": isSaved,
      };
}

class Location {
  Location({
    required this.latitude,
    required this.longitude,
    required this.display,
  });

  double? latitude;
  double? longitude;
  String? display;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"],
        longitude: json["longitude"],
        display: json["display"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "display": display,
      };
}

class Type {
  Type({
    required this.id,
    required this.name,
    required this.url,
  });

  int? id;
  String? name;
  String? url;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
      };
}
