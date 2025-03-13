class User {
  final String id;
  final String email;
  final String? name;
  final int streaks;
  final int hearts;
  final int gems;
  final String? avatar;

  User({
    required this.id,
    required this.email,
    this.name,
    required this.streaks,
    required this.hearts,
    required this.gems,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      streaks: json['streaks'] ?? 0,
      hearts: json['hearts'] ?? 5,
      gems: json['gems'] ?? 0,
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'streaks': streaks,
      'hearts': hearts,
      'gems': gems,
      'avatar': avatar,
    };
  }
}
