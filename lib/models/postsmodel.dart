class Postsmodel {
  final int Userid;
  final int Id;
  final String title;
  final String body;

  Postsmodel(
      {required this.Userid,
      required this.Id,
      required this.title,
      required this.body});
  factory Postsmodel.fromjson(Map<String, dynamic> json) {
    return Postsmodel(
        Userid: json["userId"],
        Id: json["id"],
        title: json["title"],
        body: json["body"]);
  }
}
