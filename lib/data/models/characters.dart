class CharactersModel {
  late int id;
  late String fullName;
  late String title;
  late String family;
  late String imageUrl;
  CharactersModel({
    required this.id,
    required this.fullName,
    required this.title,
    required this.family,
    required this.imageUrl,
  });
  CharactersModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    fullName = json['fullName'];
    title = json['title'];
    family = json['family'];
    imageUrl = json['imageUrl'];
  }



}