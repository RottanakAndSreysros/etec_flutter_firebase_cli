import 'package:etec_flutter_firebase_cli/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.id});

  final int id;
  final productController = Get.put(ProductController());
  final RxDouble total = 0.obs as RxDouble;
  final RxInt qty = 1.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      initState: (state) {
        productController.getProductDetail(id: id);
      },
      init: productController,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Back"),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 300,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: Colors.amber,
                          ),
                        ]),
                    child: Container(
                      height: 250,
                      width: 250,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          image:
                              AssetImage("${productController.product?.image}"),
                          //fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${productController.product?.name}",
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${productController.product?.price} \$",
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${productController.product?.shop}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "${productController.product?.description}",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    maxLines: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          onPressed: () {
                            print("=============Hello");
                          },
                          icon: const Icon(Icons.remove),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        height: 40,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          onPressed: () {
                            qty.value += 1;
                            total.value +=
                                (productController.product!.price) * qty.value;
                            print(
                                "=============Hi ${qty.value} , ${total.value}");
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: const Padding(
                padding: EdgeInsets.all(13.0),
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
