import 'package:flutter/material.dart';
import 'dart:ui';
import '../model/user_model.dart';
import 'profile_page.dart';
import 'detail_page.dart';
import 'favourite_page.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  final String email;
  final String name;

  const HomePage({super.key, required this.email, required this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final UserModel user;
  late final List<String> _categories;
  String _selectedCategory = "Coffee";
  int _bottomNavIndex = 0;
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    user = UserModel(widget.name, 25);
    _categories = user.menuItems.map((item) => item.category).toSet().toList();
    if (_categories.contains("Coffee")) {
      _categories.remove("Coffee");
      _categories.insert(0, "Coffee");
      _selectedCategory = "Coffee";
    } else if (_categories.isNotEmpty) {
      _selectedCategory = _categories.first;
    }
  }

  List<MenuModel> _getFilteredMenu() {
    return user.menuItems
        .where((item) =>
            (_searchQuery.isEmpty ? item.category == _selectedCategory : true) &&
            (_searchQuery.isEmpty ||
             item.name.toLowerCase().contains(_searchQuery) ||
             item.category.toLowerCase().contains(_searchQuery)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: _buildPageContent(),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildPageContent() {
    switch (_bottomNavIndex) {
      case 0:
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            const SizedBox(height: 20),
            _buildHeader(),
            const SizedBox(height: 24),
            _buildSearchBarAndFilter(),
            const SizedBox(height: 24),
            _buildSectionTitle("Categories"),
            const SizedBox(height: 16),
            _buildCategoryChips(),
            const SizedBox(height: 24),
            _buildCoffeeCardsList(),
            const SizedBox(height: 24),
            _buildSpecialOfferTitle(),
            const SizedBox(height: 16),
            _buildSpecialOfferCard(),
            const SizedBox(height: 24),
          ],
        );
      case 1:
        return FavouritePage(user: user);
      case 2:
        return CartPage(user: user);
      default:
        return const Center(child: Text("Page not found"));
    }
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "CoffeShop Kalcer",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4E342E),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Selamat datang, ${widget.name}!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.brown.shade700,
              ),
            ),
          ],
        ),
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
          child: CircleAvatar(
            radius: 24,
            backgroundColor: Colors.brown.shade100,
            child: const Icon(
              Icons.person,
              color: Color(0xFF4E342E),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBarAndFilter() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: (value) {
              setState(() {
                _searchQuery = value.toLowerCase();
              });
            },
            decoration: InputDecoration(
              hintText: "Find your coffee and snacks",
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF1E3923),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.tune, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildCategoryChips() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = category == _selectedCategory;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCategory = category;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF1E3923) : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCoffeeCardsList() {
    final filteredMenu = _getFilteredMenu();
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filteredMenu.length,
        itemBuilder: (context, index) {
          return _buildCoffeeCard(filteredMenu[index]);
        },
      ),
    );
  }

  Widget _buildCoffeeCard(MenuModel item) {
    return GestureDetector(
      // v-- LOGIKA NAVIGASI DIUBAH DI SINI --v
      onTap: () async {
        // Tunggu hasil dari DetailPage
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              menuItem: item,
              user: user, // Kirim instance user ke detail page
            ),
          ),
        );

        // Jika DetailPage mengembalikan `true`, refresh halaman ini
        if (result == true) {
          setState(() {});
        }
      },
      // ^-- SAMPAI SINI --^
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.asset(
                    item.imageUrl,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 140,
                      color: Colors.grey[200],
                      child: const Icon(Icons.broken_image, color: Colors.grey),
                    ),
                  ),
                ),
                // v-- WIDGET RATING DITAMBAHKAN DI SINI --v
                Positioned(
                  top: 8,
                  left: 8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        color: Colors.black.withOpacity(0.4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.star,
                                color: Colors.amber, size: 14),
                            const SizedBox(width: 4),
                            Text(
                              item.rating.toStringAsFixed(1),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // ^-- SAMPAI SINI --^
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    item.subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.price,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color(0xFF1E3923),
                          shape: BoxShape.circle,
                        ),
                        child:
                            const Icon(Icons.add, color: Colors.white, size: 20),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecialOfferTitle() {
    return const Row(
      children: [
        Text(
          "Special offer ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
        Text("🔥", style: TextStyle(fontSize: 20)),
      ],
    );
  }

  Widget _buildSpecialOfferCard() {
    final specialOfferItem = user.menuItems.firstWhere(
        (item) => item.category == "Snacks",
        orElse: () => user.menuItems.first);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              specialOfferItem.imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 100,
                height: 100,
                color: Colors.grey[200],
                child: const Icon(Icons.broken_image, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "5 Coffee Beans You Must Try!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  specialOfferItem.subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      specialOfferItem.price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Color(0xFF1E3923),
                        shape: BoxShape.circle,
                      ),
                      child:
                          const Icon(Icons.add, color: Colors.white, size: 20),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, "Home", 0),
          _buildNavItem(Icons.favorite, "Favourite", 1),
          _buildNavItem(Icons.shopping_cart, "Cart", 2),
          _buildNavItem(Icons.person, "Profile", 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _bottomNavIndex == index;
    return GestureDetector(
      onTap: () {
        if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  ProfilePage(email: widget.email, name: widget.name),
            ),
          );
        } else {
          setState(() {
            _bottomNavIndex = index;
          });
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFF1E3923) : Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xFF1E3923) : Colors.grey,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}