import 'package:etec_flutter_firebase_cli/model/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<ProductModel> listCartproducts = <ProductModel>[].obs;
  //List<ProductModel> list = [];

  late ProductModel? product;

  get isLoading => null;
  Future<void> getProductDetail({required int id}) async {
    try {
      product = listProducts
          .where(
            (element) => element.id == id,
          )
          .firstOrNull;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addToCart(ProductModel productModel) async {
    try {
      listCartproducts.add(productModel);
    } catch (e) {
      rethrow;
    }
  }
}
