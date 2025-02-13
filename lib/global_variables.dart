import 'package:ecommerce_app/data/acessories.dart';
import 'package:ecommerce_app/data/others.dart';
import 'package:ecommerce_app/models/product.dart';

import 'data/shoes.dart';
import 'data/home_appliances.dart';

final List<Product> allProducts = [
  ...shoes,
  // ...accessories,
  ...homeAppliances,
  ...accessories,
  ...others,
];
