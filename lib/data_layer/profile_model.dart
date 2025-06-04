class ProfileModel {
  String name;
  String username;
  String website;
  String bio;
  String email;
  String phone;
  String gender;

  // Constructor to initialize the fields
  ProfileModel({
    required this.name,
    required this.username,
    required this.website,
    required this.bio,
    required this.email,
    required this.phone,
    required this.gender,
  });

  // Factory constructor to create an instance from a JSON map
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      username: json['username'],
      website: json['website'],
      bio: json['bio'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
    );
  }

  // Method to convert the instance into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'website': website,
      'bio': bio,
      'email': email,
      'phone': phone,
      'gender': gender,
    };
  }
}
