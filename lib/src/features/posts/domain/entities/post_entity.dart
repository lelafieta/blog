abstract class PostEntity {
  String? id;
  String? title;
  String? body;
  List<String>? tags;
  List<Map<String, int>>? reactions;
  int? views;
  int? userId;

  PostEntity({
    this.id,
    this.title,
    this.body,
    this.tags,
    this.reactions,
    this.views,
    this.userId,
  });
}
