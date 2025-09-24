import 'dart:ui';

import 'package:flutter/material.dart';
import '../model/user_model.dart';
import 'profile_page.dart'; // Tambahkan import untuk ProfilePage
import 'detail_page.dart'; // Tambahkan import untuk DetailPage

class HomePage extends StatefulWidget {
  final String email;
  final String name; // Added name parameter

  const HomePage({super.key, required this.email, required this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedCategory = "Kopi";

  late UserModel user; // Declare user as late

  @override
  void initState() {
    super.initState();
    user = UserModel(widget.name, 25); // Initialize user in initState
    _tabController = TabController(length: 7, vsync: this);

    // Set initial category to "Coffee"
    selectedCategory = "Coffee";
  }

  List<MenuModel> _getFilteredMenu(String category) {
    return user.menuItems.where((item) => item.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E9E2),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              " Coffeshop Kalcer",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xFF00BFFF),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ProfilePage(email: widget.email, name: widget.name),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.account_circle, color: Colors.white),
                      const SizedBox(width: 8),
                      Text(
                        "HI, ${widget.email}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        centerTitle: false,
        backgroundColor: const Color(0xFF4E342E),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: const Color(0xFF00BFFF),
          labelColor: const Color(0xFF00BFFF),
          unselectedLabelColor: Colors.white,
          labelStyle: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          tabs: const [
            Tab(text: "Coffee"),
            Tab(text: "Cold Coffee"),
            Tab(text: "Non-Coffee"),
            Tab(text: "Pastries & Snacks"),
            Tab(text: "Dessert"),
            Tab(text: "Light Meals"),
            Tab(text: "Refreshments"),
          ],
          onTap: (index) {
            setState(() {
              selectedCategory = _tabController.index == 0
                  ? "Coffee"
                  : _tabController.index == 1
                  ? "Cold Coffee"
                  : _tabController.index == 2
                  ? "Non-Coffee"
                  : _tabController.index == 3
                  ? "Snacks"
                  : _tabController.index == 4
                  ? "Dessert"
                  : _tabController.index == 5
                  ? "Light Meals"
                  : "Refreshments";
            });
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: _getFilteredMenu(selectedCategory).length,
          itemBuilder: (context, index) {
            final menuItem = _getFilteredMenu(selectedCategory)[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(menuItem: menuItem),
                  ),
                );
              },
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: const Color(0xFFFFF8E1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'menu_image_${menuItem.name}',
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: AspectRatio(
                          aspectRatio: 4 / 3,
                          child: Image.asset(
                            menuItem.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              menuItem.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              menuItem.price,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF6F4E37),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF4E342E),
        icon: const Icon(Icons.shopping_cart, color: Colors.white),
        label: const Text(
          "Order Now",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Fitur order coming soon!"),
              duration: Duration(seconds: 1),
            ),
          );
        },
      ),
    );
  }
}
