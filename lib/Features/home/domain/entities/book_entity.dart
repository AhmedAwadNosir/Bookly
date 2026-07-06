class BookEntity {
  final String bookid;
  final String image;
  final String title;
  final String author;
  final num price;
  final num rating;
  final int reviewsNumbers;

  BookEntity(
      {required this.image,
      required this.title,
      required this.author,
      required this.price,
      required this.rating,
      required this.reviewsNumbers,
      required this.bookid});
}
