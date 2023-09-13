class Category {
  int id;
  String thumbnail;
  String name;
  int noOfCourses;

  Category({
    required this.id,
    required this.name,
    required this.noOfCourses,
    required this.thumbnail,
  });
}

List<Category> categoryList = [
  Category(
    id: 1,
    name: 'Tiếng Việt',
    noOfCourses: 55,
    thumbnail: 'assets/icons/laptop.jpg',
  ),
  Category(
    id: 2,
    name: 'Tập Viết',
    noOfCourses: 20,
    thumbnail: 'assets/icons/accounting.jpg',
  ),
  Category(
    id: 3,
    name: 'Toán',
    noOfCourses: 16,
    thumbnail: 'assets/icons/photography.jpg',
  ),
  // Category(
  //   name: 'Product Design',
  //   noOfCourses: 25,
  //   thumbnail: 'assets/icons/design.jpg',
  // ),
];
