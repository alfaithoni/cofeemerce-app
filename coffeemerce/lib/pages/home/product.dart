class Product {
  final String name;
  final String category;
  final double price;
  final int stock;
  final String description;
  final String image;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.stock,
    required this.description,
    required this.image,
  });
}

// List of Product instances
List<Product> products = [
  Product(
    name: 'Beans Gayo Arabica 1kg',
    category: 'Arabica',
    price: 189000,
    stock: 100,
    description:
        "(Light / 1kg) Cocok untuk manual brew via pour-over / drip / v60 yang menghasilkan rasa dan aroma yang lembut, fruity dan acidic, tanpa pahit sedikitpun. Suitable for manual brew via pour-over / drip / v60 for soft, fruity and acidic with zero bitterness.",
    image: 'assets/coffeebeans.png',
  ),
  Product(
    name: 'Beans Gayo Arabica 0.5kg',
    category: 'Arabica',
    price: 100000,
    stock: 100,
    description:
        "(Light / 0.5kg) Cocok untuk manual brew via pour-over / drip / v60 yang menghasilkan rasa dan aroma yang lembut, fruity dan acidic, tanpa pahit sedikitpun. Suitable for manual brew via pour-over / drip / v60 for soft, fruity and acidic with zero bitterness.",
    image: 'assets/coffeebeans.png',
  ),
  Product(
    name: 'Beans Gayo Robusta 1kg',
    category: 'Robusta',
    price: 200000,
    stock: 100,
    description:
        "(Light / 1kg) Cocok untuk manual brew via pour-over / drip / v60 yang menghasilkan rasa dan aroma yang lembut, fruity dan acidic, tanpa pahit sedikitpun. Suitable for manual brew via pour-over / drip / v60 for soft, fruity and acidic with zero bitterness.",
    image: 'assets/coffeebeans2.jpg',
  ),
  Product(
    name: 'Beans Gayo Robusta 0.5kg',
    category: 'Robusta',
    price: 200000,
    stock: 100,
    description:
        "(Light / 0.5kg) Cocok untuk manual brew via pour-over / drip / v60 yang menghasilkan rasa dan aroma yang lembut, fruity dan acidic, tanpa pahit sedikitpun. Suitable for manual brew via pour-over / drip / v60 for soft, fruity and acidic with zero bitterness.",
    image: 'assets/coffeebeans2.jpg',
  ),
];
