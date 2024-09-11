class Commentsmodel {
  final int Postid;
  final int id;
  final String email;
  final String name;
  final String body;

  Commentsmodel(
      {required this.Postid,
      required this.id,
      required this.email,
      required this.name,
      required this.body});
  factory Commentsmodel.fromjson(Map<String, dynamic> json) {
    return Commentsmodel(
        Postid: json["postId"],
        id: json["id"],
        email: json["email"],
        name: json["name"],
        body: json["body"]);
  }
}
