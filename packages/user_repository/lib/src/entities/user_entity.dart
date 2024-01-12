
class MyUserEntity {
	final String userId;
	final String email;
	final String name;
  final int age;
  final String description;
  final Map<String, dynamic> location;
  final List<dynamic> pictures;

	const MyUserEntity({
		required this.userId,
		required this.email,
		required this.name,
    required this.age,
    required this.description,
		required this.location,
    required this.pictures,
	});

	Map<String, Object?> toDocument() {
		return {
			'userId': userId,
			'email': email,
			'name': name,
      'age': age,
      'description': description,
      'location': location,
      'pictures': pictures
		};
	}

	static MyUserEntity fromDocument(Map<String, dynamic> doc) {
		return MyUserEntity(
			userId: doc['userId'], 
			email: doc['email'], 
			name: doc['name'],
      age: doc['age'], 
			description: doc['description'], 
			location: doc['location'],
      pictures: doc['pictures']
		);
	}

}