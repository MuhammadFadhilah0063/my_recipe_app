class Recipe {
  String title;
  String urlImage;
  double calorie;
  int time;
  List<String> ingredient;
  List<String> step;

  Recipe({
    required this.title,
    required this.ingredient,
    required this.step,
    this.urlImage = "assets/images/imageDefault.png",
    this.calorie = 0.0,
    this.time = 0,
  });
}
