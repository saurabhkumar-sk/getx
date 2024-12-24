class PaginationModel {
  final dynamic id;
  final dynamic title;
  final dynamic link;
  final dynamic date;

  PaginationModel({
    this.id,
    this.title,
    this.link,
    this.date,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      PaginationModel(
        id: json["id"],
        title: json["title"],
        link: json["link"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "link": link,
        "date": date,
      };
}
