import 'package:flutter/material.dart';
import 'package:ecommerce_app/pages/acessories_page.dart';
import 'package:ecommerce_app/pages/home_appliances_page.dart';
import 'package:ecommerce_app/pages/others_page.dart';
import 'package:ecommerce_app/pages/profile_page.dart';
import 'package:ecommerce_app/pages/shoes_page.dart';
import 'package:ecommerce_app/screen/cart_screen.dart';
import 'package:ecommerce_app/screen/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // categories indexing ko lagi
  final Map<String, Widget> filters = {
    "All": ProductList(),
    "Accessories": AcessoriesPage(),
    "Shoes": ShoesPage(),
    "Home Appliances": HomeAppliancesPage(),
    "Others": OthersPage(),
  };
//  bottom ko navigation ko lagi
  String selectedCategory = 'All';
  int _currentIndex = 0;

  //  bottom navigation bar ko lis page
  final List<Widget> pages = [
    ProductList(),
    CartScreen(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: const BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text(
                    "Products\nCollection",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Search",
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (BuildContext context, int index) {
                  final category = filters.keys.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      child: Chip(
                        label: Text(category),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: selectedCategory == category
                              ? Colors.white
                              : Colors.black,
                        ),
                        backgroundColor: selectedCategory == category
                            ? Theme.of(context).colorScheme.primary
                            : const Color.fromARGB(255, 254, 244, 244),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            //  selected category bottom ko lagi
            Expanded(
              child: _currentIndex == 0
                  ? filters[selectedCategory] ?? ProductList()
                  : pages[_currentIndex], //bottom ko lagi
            ),
          ],
        ),
      ),
//#############################
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 35,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          )
        ],
      ),
    );
  }
}
