class RepositoryModel {
  int id;
  String name;
  String language;
  String description;

  RepositoryModel({this.id, this.name, this.language, this.description});

  RepositoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    language = json['language'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['language'] = this.language;
    data['description'] = this.description;
    return data;
  }
}
