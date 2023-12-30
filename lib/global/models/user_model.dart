class User {
  String userId;
  String role;
  String language;
  String fullName;
  String phone;
  String emailAddress;
  String outletId;
  String designation;

  User({
    required this.userId,
    required this.role,
    required this.language,
    required this.fullName,
    required this.phone,
    required this.emailAddress,
    required this.outletId,
    required this.designation,
  });

  // Factory method to create a User instance from a JSON object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      language: json['language'],
      fullName: json['full_name'],
      phone: json['phone'],
      emailAddress: json['email_address'],
      role: json['role'],
      designation: json['designation'],
      outletId: json['outlet_id'],
    );
  }

  // Method to convert a User instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'role': role,
      'language': language,
      'full_name': fullName,
      'phone': phone,
      'email_address': emailAddress,
      'outlet_id': outletId,
      'designation': designation,
    };
  }
}
