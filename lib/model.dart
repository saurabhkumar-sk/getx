class ExploreModel {
  bool? status;
  dynamic message;
  bool? searchToken;
  List<UserData>? data;

  ExploreModel({
    this.status,
    this.message,
    this.searchToken,
    this.data,
  });

  factory ExploreModel.fromJson(Map<String, dynamic> json) => ExploreModel(
        status: json['status'],
        message: json['message'],
        searchToken: json['search_token'],
        data: json['data'] != null
            ? (json['data'] as List)
                .map((item) => UserData.fromJson(item))
                .toList()
            : null,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'search_token': searchToken,
        'data': data?.map((item) => item.toJson()).toList(),
      };
}

class UserData {
  UserDetail? userDetail;

  UserData({this.userDetail});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        userDetail: json['user_detail'] != null
            ? UserDetail.fromJson(json['user_detail'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'user_detail': userDetail?.toJson(),
      };
}

class UserDetail {
  dynamic id;
  dynamic firstName;
  dynamic email;
  dynamic lookingGender;
  dynamic isProfileCompleted;
  dynamic latitude;
  dynamic longitude;
  dynamic education;
  dynamic phoneNumber;
  dynamic gender;
  dynamic age;
  dynamic countryCode;
  dynamic aboutUs;
  dynamic fullAddress;
  dynamic height;
  dynamic showSexual;
  dynamic showGender;
  dynamic distance;
  List<String>? images;
  dynamic isOnline;
  List<Attribute>? zodiac;
  List<Attribute>? fitness;
  List<Attribute>? personality;
  List<Attribute>? study;
  List<Attribute>? communication;
  List<Attribute>? love;
  List<Attribute>? animal;
  List<Attribute>? alcohal;
  List<Attribute>? smoke;
  List<Attribute>? foodhabit;
  List<Attribute>? socialmedia;
  List<Attribute>? sleephabit;
  List<Prompt>? prompts;
  dynamic promptAudio;
  List<Interest>? interests;
  List<Relation>? relations;
  List<Attribute>? sexual;
  List<dynamic>? lanuage;
  bool? requested;

  UserDetail({
    this.id,
    this.firstName,
    this.email,
    this.lookingGender,
    this.isProfileCompleted,
    this.latitude,
    this.longitude,
    this.education,
    this.phoneNumber,
    this.gender,
    this.age,
    this.countryCode,
    this.aboutUs,
    this.fullAddress,
    this.height,
    this.showSexual,
    this.showGender,
    this.distance,
    this.images,
    this.isOnline,
    this.zodiac,
    this.fitness,
    this.personality,
    this.study,
    this.communication,
    this.love,
    this.animal,
    this.alcohal,
    this.smoke,
    this.foodhabit,
    this.socialmedia,
    this.sleephabit,
    this.prompts,
    this.promptAudio,
    this.interests,
    this.relations,
    this.sexual,
    this.lanuage,
    this.requested,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        id: json['id'],
        firstName: json['first_name'],
        email: json['email'],
        lookingGender: json['looking_gender'],
        isProfileCompleted: json['is_profile_completed'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        education: json['education'],
        phoneNumber: json['phone_number'],
        gender: json['gender'],
        age: json['age'],
        countryCode: json['country_code'],
        aboutUs: json['about_us'],
        fullAddress: json['full_address'],
        height: json['height'],
        showSexual: json['show_sexual'],
        showGender: json['show_gender'],
        distance: json['distance'],
        images:
            (json['images'] as List?)?.map((item) => item as String).toList(),
        isOnline: json['is_online'],
        zodiac: (json['zodiac'] as List?)
            ?.map((item) => Attribute.fromJson(item))
            .toList(),
        fitness: (json['fitness'] as List?)
            ?.map((item) => Attribute.fromJson(item))
            .toList(),
        personality: (json['personality'] as List?)
            ?.map((item) => Attribute.fromJson(item))
            .toList(),
        study: (json['study'] as List?)
            ?.map((item) => Attribute.fromJson(item))
            .toList(),
        communication: (json['communication'] as List?)
            ?.map((item) => Attribute.fromJson(item))
            .toList(),
        love: (json['love'] as List?)
            ?.map((item) => Attribute.fromJson(item))
            .toList(),
        animal: (json['animal'] as List?)
            ?.map((item) => Attribute.fromJson(item))
            .toList(),
        alcohal: (json['alcohal'] as List?)
            ?.map((item) => Attribute.fromJson(item))
            .toList(),
        smoke: (json['smoke'] as List?)
            ?.map((item) => Attribute.fromJson(item))
            .toList(),
        foodhabit: (json['foodhabit'] as List?)
            ?.map((item) => Attribute.fromJson(item))
            .toList(),
        socialmedia: (json['socialmedia'] as List?)
            ?.map((item) => Attribute.fromJson(item))
            .toList(),
        sleephabit: (json['sleephabit'] as List?)
            ?.map((item) => Attribute.fromJson(item))
            .toList(),
        prompts: (json['prompts'] as List?)
            ?.map((item) => Prompt.fromJson(item))
            .toList(),
        promptAudio: json['prompt_audio'],
        interests: (json['interests'] as List?)
            ?.map((item) => Interest.fromJson(item))
            .toList(),
        relations: (json['relations'] as List?)
            ?.map((item) => Relation.fromJson(item))
            .toList(),
        sexual: (json['sexual'] as List?)
            ?.map((item) => Attribute.fromJson(item))
            .toList(),
        lanuage: json['lanuage'],
        requested: json['requested'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'email': email,
        'looking_gender': lookingGender,
        'is_profile_completed': isProfileCompleted,
        'latitude': latitude,
        'longitude': longitude,
        'education': education,
        'phone_number': phoneNumber,
        'gender': gender,
        'age': age,
        'country_code': countryCode,
        'about_us': aboutUs,
        'full_address': fullAddress,
        'height': height,
        'show_sexual': showSexual,
        'show_gender': showGender,
        'distance': distance,
        'images': images,
        'is_online': isOnline,
        'zodiac': zodiac?.map((item) => item.toJson()).toList(),
        'fitness': fitness?.map((item) => item.toJson()).toList(),
        'personality': personality?.map((item) => item.toJson()).toList(),
        'study': study?.map((item) => item.toJson()).toList(),
        'communication': communication?.map((item) => item.toJson()).toList(),
        'love': love?.map((item) => item.toJson()).toList(),
        'animal': animal?.map((item) => item.toJson()).toList(),
        'alcohal': alcohal?.map((item) => item.toJson()).toList(),
        'smoke': smoke?.map((item) => item.toJson()).toList(),
        'foodhabit': foodhabit?.map((item) => item.toJson()).toList(),
        'socialmedia': socialmedia?.map((item) => item.toJson()).toList(),
        'sleephabit': sleephabit?.map((item) => item.toJson()).toList(),
        'prompts': prompts?.map((item) => item.toJson()).toList(),
        'prompt_audio': promptAudio,
        'interests': interests?.map((item) => item.toJson()).toList(),
        'relations': relations?.map((item) => item.toJson()).toList(),
        'sexual': sexual?.map((item) => item.toJson()).toList(),
        'lanuage': lanuage,
        'requested': requested,
      };
}

class Attribute {
  int? id;
  dynamic name;

  Attribute({this.id, this.name});

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class Prompt {
  int? id;
  dynamic name;

  Prompt({this.id, this.name});

  factory Prompt.fromJson(Map<String, dynamic> json) => Prompt(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class Interest {
  int? id;
  dynamic name;
  dynamic image;

  Interest({this.id, this.name, this.image});

  factory Interest.fromJson(Map<String, dynamic> json) => Interest(
        id: json['id'],
        name: json['name'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}

class Relation {
  int? id;
  dynamic name;

  Relation({this.id, this.name});

  factory Relation.fromJson(Map<String, dynamic> json) => Relation(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
