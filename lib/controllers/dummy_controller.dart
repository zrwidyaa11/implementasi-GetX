import 'package:get/get.dart';
import '../models/dummy_model.dart';

class DummyController extends GetxController {
  var dummyList = <DummyModel>[].obs;

  @override
  void onInit() {
    fetchDummyData();
    super.onInit();
  }

  void fetchDummyData() {
    var dummyData = [
      DummyModel(
        id: 1,
        name: 'Ayam Bakar',
        description: 'Ayam bakar adalah sebuah hidangan Asia Tenggara Maritim, terutama hidangan Indonesia atau Malaysia, dari ayam yang dipanggang di atas arang.',
        
      ),
      DummyModel(
        id: 2,
        name: 'Nasi Kuning',
        description: 'Nasi kuning adalah makanan khas Indonesia. Makanan ini terbuat dari beras yang dimasak bersama dengan kunyit serta santan dan rempah-rempah. Dengan ditambahkannya bumbu-bumbu dan santan, nasi kuning memiliki rasa yang lebih gurih daripada nasi putih.',
       
      ),
      DummyModel(
        id: 3,
        name: 'Pecel',
        description: 'Makanan pecel adalah makanan yang menggunakan bumbu sambal kacang sebagai bahan utamanya yang dicampur dengan aneka jenis sayuran.',
        
      ),
      DummyModel(
        id: 4,
        name: 'Sayur Lodeh',
        description: 'Sayur lodeh merupakan makanan khas Indonesia, terutama daerah Jawa. Sayur lodeh menggunakan santan sebagai bahan utamanya. sayur lodeh memiliki beragam variasi bumbu hingga membuat santan berwarna kuning hingga kuning kemerahan.',
       
      ),
      DummyModel(
        id: 5,
        name: 'Nasi Campur',
        description: 'Nasi campur (Nasi Rames) adalah salah satu hidangan khas Suku Jawa. yang terdiri atas nasi putih yang dihidangkan dengan bermacam-macam lauk. Lauk yang digunakan diantaranya sambal goreng, abon, serundeng, tahu goreng, ikan goreng, telur, ayam goreng, dan lain-lain.',
       
      ),
      DummyModel(
        id: 6,
        name: 'Perkedel',
        description: 'Perkedel atau bergedel adalah makanan khas Indonesia yang terbuat dari kentang yang telah digoreng atau direbus sebelum dilumatkan, lalu dicampur dengan daging cincang, irisan daun bawang serta daun seledri dan bumbu, dibentuk bulat-bulat gepeng, dicelupkan ke dalam kocokan telur ayam lalu digoreng.',
       
      ),
    ];

    dummyList.assignAll(dummyData);
  }

  void addMenuItem(String name, String description) {
    int newId = dummyList.length + 1; // Generate a new ID
    dummyList.add(DummyModel(id: newId, name: name, description: description));
    update(); // Update GetX state
  }

  void deleteMenuItem(int index) {
    dummyList.removeAt(index);
    update(); // Update GetX state
  }

  void updateMenuItem(int index, String name, String description) {
    dummyList[index] = DummyModel(id: index + 1, name: name, description: description);
    update(); // Update GetX state
  }
}