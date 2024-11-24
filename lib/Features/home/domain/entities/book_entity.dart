class BookEntity {
  final String image;
  final String titel;
  final String authorName;
  final num price;
  final num rating;

  BookEntity(
      {required this.image,
      required this.titel,
      required this.authorName,
      required this.price,
      required this.rating});
}
