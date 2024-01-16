import 'food.dart';

class FoodGenerator {
  static List<Food> generateDummyFoods() {
    return [
      Food(
        id: "1",
        name: "Nasi Goreng",
        thumbnailURL:
            "https://asset.kompas.com/crops/MrdYDsxogO0J3wGkWCaGLn2RHVc=/84x60:882x592/750x500/data/photo/2021/11/17/61949959e07d3.jpg",
        price: "180.00฿",
      ),
      Food(
        id: "2",
        name: "Sate Ayam",
        thumbnailURL:
            "https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2023/07/14053934/Mudah-Dibuat-di-Rumah-Ini-Resep-Sate-Ayam-Bumbu-Kacang-yang-Lezat-.jpg",
        price: "200.00฿",
      ),
      Food(
        id: "3",
        name: "Ayam Bakar Taliwang",
        thumbnailURL:
            "https://img-global.cpcdn.com/recipes/e5b0b5783763b1c1/1200x630cq70/photo.jpg",
        price: "250.00฿",
      ),
      Food(
        id: "4",
        name: "Bebek Goreng",
        thumbnailURL:
            "https://asset.kompas.com/crops/UhV2ngrlUWo92yJyruxM7I-vSNE=/69x65:869x598/750x500/data/photo/2021/11/25/619f7dc86e939.jpg",
        price: "180.00฿",
      ),
      Food(
        id: "5",
        name: "Bakso",
        thumbnailURL:
            "https://ychef.files.bbci.co.uk/1280x720/p0g4wzlc.jpg",
        price: "170.00฿",
      ),
    ];
  }
}