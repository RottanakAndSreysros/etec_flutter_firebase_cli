import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductModel extends GetxController {
  final int id;
  final String name;
  final String shop;
  final double price;
  final String image;
  final Color color;
  final String description;
  final double total;

  ProductModel({
    required this.id,
    required this.name,
    required this.shop,
    required this.price,
    required this.image,
    required this.color,
    required this.description,
    required this.total,
  });
}

List<ProductModel> listProducts = [
  ProductModel(
    id: 1,
    name: "Rice",
    shop: "IT shop",
    price: 2.3,
    image: "asset/image/rice.png",
    color: Colors.blue,
    description: 'Hello everyone! How are you?',
    total: 0,
  ),
  ProductModel(
    id: 2,
    name: "Roset chicken",
    shop: "IT shop",
    price: 2.3,
    image: "asset/image/roast chicken.png",
    color: Colors.red,
    description: 'Hello everyone! What are you doing?',
    total: 0,
  ),
  ProductModel(
    id: 3,
    name: "Sa",
    shop: "IT shop",
    price: 2.3,
    image: "asset/image/sa.png",
    color: Colors.yellow,
    description: 'Hello everyone! What do you think?',
    total: 0,
  ),
  ProductModel(
    id: 4,
    name: "Salad",
    shop: "IT shop",
    price: 2.3,
    image: "asset/image/salad.png",
    color: Colors.green,
    description: 'Hello everyone! What is your name?',
    total: 0,
  ),
  ProductModel(
    id: 5,
    name: "Sandwich",
    shop: "IT shop",
    price: 2.3,
    image: "asset/image/sandwich.png",
    color: Colors.pink,
    description: 'Hello everyone !What is that?',
    total: 0,
  ),
  ProductModel(
    id: 6,
    name: "Sasauge",
    shop: "IT shop",
    price: 2.3,
    image: "asset/image/sasauge.png",
    color: Colors.purple,
    description: 'Hello everyone!',
    total: 0,
  ),
  ProductModel(
    id: 7,
    name: "Seaf",
    shop: "IT shop",
    price: 2.3,
    image: "asset/image/seafppd.png",
    color: Colors.blue,
    description: 'Hello! What is your name?',
    total: 0,
  ),
  ProductModel(
    id: 8,
    name: "Staek",
    shop: "IT shop",
    price: 2.3,
    image: "asset/image/staek.png",
    color: Colors.blueGrey,
    description: 'Where are you from?',
    total: 0,
  ),
  ProductModel(
    id: 9,
    name: "Yogurt",
    shop: "IT shop",
    price: 2.3,
    image: "asset/image/re.jpg",
    color: Colors.pink,
    description: 'How are you?',
    total: 0,
  ),
];
