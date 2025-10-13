class BaseModel {
  void printDetails() {
    print("BaseModel details");
  }
}

class MenuModel {
  final String name;
  final Map<String, String> prices; // Harga per ukuran: {'Small': 'Rp 12.000', 'Medium': 'Rp 15.000', 'Large': 'Rp 18.000'}
  final String? icon;
  final String imageUrl;
  final String description;
  final String category;
  final String subtitle;
  double rating; // <-- DIUBAH: 'final' dihapus agar bisa diupdate

  MenuModel({
    required this.name,
    required this.prices,
    this.icon,
    required this.imageUrl,
    required this.description,
    required this.category,
    required this.subtitle,
    this.rating = 0.0,
  });

  // Getter untuk harga default (Medium)
  String get price => prices['Medium'] ?? 'Rp 0';
}

class CartItem {
  final MenuModel menuItem;
  final String size;
  int quantity;

  CartItem({
    required this.menuItem,
    required this.size,
    this.quantity = 1,
  });

  double get totalPrice {
    // Simple price calculation, assuming price is in format "Rp X.XXX"
    final priceString = menuItem.prices[size]?.replaceAll('Rp ', '').replaceAll('.', '') ?? '0';
    final price = double.tryParse(priceString) ?? 0.0;
    return price * quantity;
  }
}

class UserModel extends BaseModel {
  String _name;
  int _age;

  UserModel(String name, int age)
      : _name = name,
        _age = age {
    initializeMenuItems();
  }

  int get age => _age;
  List<MenuModel> _menuItems = [];
  List<MenuModel> get menuItems => _menuItems;

  // New fields for favorites and cart
  List<MenuModel> _favorites = [];
  List<MenuModel> get favorites => _favorites;

  List<CartItem> _cart = [];
  List<CartItem> get cart => _cart;

  void addMenuItem(MenuModel menuItem) {
    _menuItems.add(menuItem);
  }

  void removeMenuItem(MenuModel menuItem) {
    _menuItems.remove(menuItem);
  }
  
  // v-- FUNGSI BARU INI DITAMBAHKAN --v
  // Untuk mengupdate rating item tertentu
  void updateMenuRating(String menuName, double newRating) {
    try {
      final item = _menuItems.firstWhere((menu) => menu.name == menuName);
      item.rating = newRating;
    } catch (e) {
      print("Menu item not found: $menuName");
    }
  }
  // ^-- SAMPAI SINI --^

  // Methods for favorites
  void addToFavorites(MenuModel item) {
    if (!_favorites.contains(item)) {
      _favorites.add(item);
    }
  }

  void removeFromFavorites(MenuModel item) {
    _favorites.remove(item);
  }

  bool isFavorite(MenuModel item) {
    return _favorites.contains(item);
  }

  // Methods for cart
  void addToCart(MenuModel item, String size, int quantity) {
    final existingItem = _cart.firstWhere(
      (cartItem) => cartItem.menuItem == item && cartItem.size == size,
      orElse: () => CartItem(menuItem: item, size: size, quantity: 0),
    );

    if (existingItem.quantity == 0) {
      _cart.add(CartItem(menuItem: item, size: size, quantity: quantity));
    } else {
      existingItem.quantity += quantity;
    }
  }

  void removeFromCart(CartItem item) {
    _cart.remove(item);
  }

  void updateCartItemQuantity(CartItem item, int newQuantity) {
    if (newQuantity <= 0) {
      removeFromCart(item);
    } else {
      item.quantity = newQuantity;
    }
  }

  double get cartTotal {
    return _cart.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  void initializeMenuItems() {
    // Coffee
    addMenuItem(
      MenuModel(
        name: "Espresso",
        prices: {'Small': 'Rp 12.000', 'Medium': 'Rp 15.000', 'Large': 'Rp 18.000'},
        icon: "☕",
        imageUrl: "assets/espresso.jpg",
        description: "Kopi pekat dengan rasa yang kuat.",
        category: "Coffee",
        subtitle: "Strong & Bold",
        rating: 4.8,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Americano",
        prices: {'Small': 'Rp 15.000', 'Medium': 'Rp 18.000', 'Large': 'Rp 21.000'},
        icon: "☕",
        imageUrl: "assets/americano.jpg",
        description: "Kopi hitam dengan rasa yang kuat.",
        category: "Coffee",
        subtitle: "Pure Black Coffee",
        rating: 4.5,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Cappuccino",
        prices: {'Small': 'Rp 19.000', 'Medium': 'Rp 22.000', 'Large': 'Rp 25.000'},
        icon: "☕",
        imageUrl: "assets/cappuccino.jpg",
        description: "Kopi dengan susu dan foam yang lembut.",
        category: "Coffee",
        subtitle: "With Oat Milk",
        rating: 4.7,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Caffè Latte",
        prices: {'Small': 'Rp 19.000', 'Medium': 'Rp 22.000', 'Large': 'Rp 25.000'},
        icon: "☕",
        imageUrl: "assets/latte.jpg",
        description: "Kopi dengan susu yang lembut.",
        category: "Coffee",
        subtitle: "Smooth and Creamy",
        rating: 4.6,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Mocha",
        prices: {'Small': 'Rp 22.000', 'Medium': 'Rp 25.000', 'Large': 'Rp 28.000'},
        icon: "☕",
        imageUrl: "assets/mocca.jpg",
        description: "Kopi dengan campuran coklat.",
        category: "Coffee",
        subtitle: "Rich Chocolate Blend",
        rating: 4.8,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Caramel Macchiato",
        prices: {'Small': 'Rp 23.000', 'Medium': 'Rp 26.000', 'Large': 'Rp 29.000'},
        icon: "☕",
        imageUrl: "assets/macchiato.jpg",
        description: "Kopi dengan rasa karamel yang lembut.",
        category: "Coffee",
        subtitle: "Sweet Caramel Drizzle",
        rating: 4.9,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Flat White",
        prices: {'Small': 'Rp 21.000', 'Medium': 'Rp 24.000', 'Large': 'Rp 27.000'},
        icon: "☕",
        imageUrl: "assets/flat_white.jpg",
        description: "Kopi dengan susu yang lembut dan creamy.",
        category: "Coffee",
        subtitle: "Velvety Microfoam",
        rating: 4.7,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Iced Americano",
        prices: {'Small': 'Rp 17.000', 'Medium': 'Rp 20.000', 'Large': 'Rp 23.000'},
        icon: "🧊",
        imageUrl: "assets/iced_americano.jpg",
        description: "Americano dingin yang menyegarkan.",
        category: "Cold Coffee",
        subtitle: "Chilled & Refreshing",
        rating: 4.5,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Iced Latte",
        prices: {'Small': 'Rp 21.000', 'Medium': 'Rp 24.000', 'Large': 'Rp 27.000'},
        icon: "🧊",
        imageUrl: "assets/iced_latte.jpg",
        description: "Latte dingin yang menyegarkan.",
        category: "Cold Coffee",
        subtitle: "Cool and Creamy",
        rating: 4.6,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Iced Mocha",
        prices: {'Small': 'Rp 24.000', 'Medium': 'Rp 27.000', 'Large': 'Rp 30.000'},
        icon: "🧊",
        imageUrl: "assets/iced_mocha.jpg",
        description: "Mocha dingin yang menyegarkan.",
        category: "Cold Coffee",
        subtitle: "Icy Chocolate Kick",
        rating: 4.7,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Iced Caramel Macchiato",
        prices: {'Small': 'Rp 27.000', 'Medium': 'Rp 30.000', 'Large': 'Rp 33.000'},
        icon: "🧊",
        imageUrl: "assets/iced_macchiato.jpg",
        description: "Caramel Macchiato dingin yang menyegarkan.",
        category: "Cold Coffee",
        subtitle: "Cold & Sweet",
        rating: 4.8,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Cold Brew",
        prices: {'Small': 'Rp 27.000', 'Medium': 'Rp 30.000', 'Large': 'Rp 33.000'},
        icon: "🧊",
        imageUrl: "assets/cold_brew.jpg",
        description: "Kopi dingin dengan rasa yang kuat.",
        category: "Cold Coffee",
        subtitle: "Smooth, Low Acidity",
        rating: 4.9,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Green Tea Latte",
        prices: {'Small': 'Rp 21.000', 'Medium': 'Rp 24.000', 'Large': 'Rp 27.000'},
        icon: "🍵",
        imageUrl: "assets/greentea_latte.jpg",
        description: "Latte dengan rasa green tea.",
        category: "Non-Coffee",
        subtitle: "Earthy Matcha Flavor",
        rating: 4.6,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Matcha Frappé",
        prices: {'Small': 'Rp 23.000', 'Medium': 'Rp 26.000', 'Large': 'Rp 29.000'},
        icon: "🍵",
        imageUrl: "assets/matcha_frappe.jpg",
        description: "Frappé dengan rasa matcha.",
        category: "Non-Coffee",
        subtitle: "Blended Icy Matcha",
        rating: 4.7,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Red Velvet Latte",
        prices: {'Small': 'Rp 22.000', 'Medium': 'Rp 25.000', 'Large': 'Rp 28.000'},
        icon: "🍵",
        imageUrl: "assets/red_velvet.jpg",
        description: "Latte dengan rasa red velvet.",
        category: "Non-Coffee",
        subtitle: "Sweet Cake Flavor",
        rating: 4.8,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Taro Latte",
        prices: {'Small': 'Rp 22.000', 'Medium': 'Rp 25.000', 'Large': 'Rp 28.000'},
        icon: "🍵",
        imageUrl: "assets/taro_latte.jpg",
        description: "Latte dengan rasa taro.",
        category: "Non-Coffee",
        subtitle: "Creamy & Nutty",
        rating: 4.6,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Hot Chocolate",
        prices: {'Small': 'Rp 19.000', 'Medium': 'Rp 22.000', 'Large': 'Rp 25.000'},
        icon: "🍫",
        imageUrl: "assets/hot_chocolate.jpg",
        description: "Minuman coklat hangat yang lezat.",
        category: "Non-Coffee",
        subtitle: "Rich & Warming",
        rating: 4.9,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Croissant Butter",
        prices: {'Small': 'Rp 15.000', 'Medium': 'Rp 18.000', 'Large': 'Rp 21.000'},
        icon: "🥐",
        imageUrl: "assets/croissant_butter.jpg",
        description: "Pastry renyah dengan rasa butter.",
        category: "Snacks",
        subtitle: "Flaky & Buttery",
        rating: 4.7,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Chocolate Croissant",
        prices: {'Small': 'Rp 17.000', 'Medium': 'Rp 20.000', 'Large': 'Rp 23.000'},
        icon: "🥐",
        imageUrl: "assets/chocolate_croissant.jpg",
        description: "Croissant dengan isian coklat.",
        category: "Snacks",
        subtitle: "With Gooey Chocolate",
        rating: 4.8,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Cinnamon Roll",
        prices: {'Small': 'Rp 19.000', 'Medium': 'Rp 22.000', 'Large': 'Rp 25.000'},
        icon: "🍩",
        imageUrl: "assets/cinnamon_roll.jpg",
        description: "Roti gulung dengan rasa kayu manis.",
        category: "Snacks",
        subtitle: "Warm & Spiced",
        rating: 4.9,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Muffin (Blueberry/Chocolate)",
        prices: {'Small': 'Rp 15.000', 'Medium': 'Rp 18.000', 'Large': 'Rp 21.000'},
        icon: "🧁",
        imageUrl: "assets/muffin.jpg",
        description: "Kue lembut dengan rasa blueberry atau coklat.",
        category: "Snacks",
        subtitle: "Moist & Fluffy",
        rating: 4.6,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Donut (Classic/Glazed)",
        prices: {'Small': 'Rp 9.000', 'Medium': 'Rp 12.000', 'Large': 'Rp 15.000'},
        icon: "🍩",
        imageUrl: "assets/donut.jpg",
        description: "Donat klasik atau dengan glaze.",
        category: "Snacks",
        subtitle: "Soft & Sweet",
        rating: 4.5,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "French Fries",
        prices: {'Small': 'Rp 15.000', 'Medium': 'Rp 18.000', 'Large': 'Rp 21.000'},
        icon: "🍟",
        imageUrl: "assets/french_fries.jpg",
        description: "Kentang goreng renyah.",
        category: "Snacks",
        subtitle: "Crispy & Salty",
        rating: 4.4,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Chicken Wings",
        prices: {'Small': 'Rp 25.000', 'Medium': 'Rp 28.000', 'Large': 'Rp 31.000'},
        icon: "🍗",
        imageUrl: "assets/chicken_wings.jpg",
        description: "Sayap ayam goreng dengan bumbu spesial.",
        category: "Snacks",
        subtitle: "Spicy & Savory",
        rating: 4.8,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Cheesecake",
        prices: {'Small': 'Rp 15.000', 'Medium': 'Rp 18.000', 'Large': 'Rp 21.000'},
        icon: "🍰",
        imageUrl: "assets/cheesecake.jpg",
        description: "Kue keju yang lembut dan lezat.",
        category: "Dessert",
        subtitle: "Creamy & Rich",
        rating: 4.9,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Chocolate Croissant",
        prices: {'Small': 'Rp 17.000', 'Medium': 'Rp 20.000', 'Large': 'Rp 23.000'},
        icon: "🥐",
        imageUrl: "assets/chocolate_croissant.jpg",
        description: "Croissant dengan isian coklat.",
        category: "Dessert",
        subtitle: "A Perfect Sweet Treat",
        rating: 4.8,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Tiramisu",
        prices: {'Small': 'Rp 17.000', 'Medium': 'Rp 20.000', 'Large': 'Rp 23.000'},
        icon: "🍰",
        imageUrl: "assets/tiramisu.jpg",
        description: "Kue kopi dengan lapisan mascarpone.",
        category: "Dessert",
        subtitle: "Classic Italian Dessert",
        rating: 4.9,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Brownies with Ice Cream",
        prices: {'Small': 'Rp 22.000', 'Medium': 'Rp 25.000', 'Large': 'Rp 28.000'},
        icon: "🍫",
        imageUrl: "assets/brownies.jpg",
        description: "Brownies dengan tambahan es krim.",
        category: "Dessert",
        subtitle: "Warm & Fudgy",
        rating: 5.0,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Panna Cotta",
        prices: {'Small': 'Rp 23.000', 'Medium': 'Rp 26.000', 'Large': 'Rp 29.000'},
        icon: "🍮",
        imageUrl: "assets/panna_cotta.jpg",
        description: "Dessert Italia yang lembut dan manis.",
        category: "Dessert",
        subtitle: "Silky & Smooth",
        rating: 4.8,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Club Sandwich",
        prices: {'Small': 'Rp 29.000', 'Medium': 'Rp 32.000', 'Large': 'Rp 35.000'},
        icon: "🥪",
        imageUrl: "assets/club_sandwich.jpg",
        description: "Sandwich dengan isian daging dan sayuran.",
        category: "Light Meals",
        subtitle: "Hearty & Filling",
        rating: 4.7,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Chicken Burger",
        prices: {'Small': 'Rp 32.000', 'Medium': 'Rp 35.000', 'Large': 'Rp 38.000'},
        icon: "🍔",
        imageUrl: "assets/chicken_burger.jpg",
        description: "Burger dengan isian ayam goreng.",
        category: "Light Meals",
        subtitle: "Juicy Chicken Patty",
        rating: 4.6,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Beef Burger",
        prices: {'Small': 'Rp 35.000', 'Medium': 'Rp 38.000', 'Large': 'Rp 41.000'},
        icon: "🍔",
        imageUrl: "assets/beef_burger.jpg",
        description: "Burger dengan isian daging sapi.",
        category: "Light Meals",
        subtitle: "Classic Beef Patty",
        rating: 4.8,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Pasta Aglio Olio",
        prices: {'Small': 'Rp 29.000', 'Medium': 'Rp 32.000', 'Large': 'Rp 35.000'},
        icon: "🍝",
        imageUrl: "assets/pasta.jpg",
        description: "Pasta dengan toping udang yang lezat.",
        category: "Light Meals",
        subtitle: "Garlic & Olive Oil",
        rating: 4.7,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Grilled Chicken",
        prices: {'Small': 'Rp 37.000', 'Medium': 'Rp 40.000', 'Large': 'Rp 43.000'},
        icon: "🍗",
        imageUrl: "assets/grilled_chicken.jpg",
        description: "Ayam panggang dengan bumbu spesial.",
        category: "Light Meals",
        subtitle: "Healthy & Flavorful",
        rating: 4.9,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Lemon Tea (Hot/Iced)",
        prices: {'Small': 'Rp 15.000', 'Medium': 'Rp 18.000', 'Large': 'Rp 21.000'},
        icon: "🍋",
        imageUrl: "assets/lemon_tea.jpg",
        description: "Teh dengan rasa lemon yang menyegarkan.",
        category: "Refreshments",
        subtitle: "Zesty & Refreshing",
        rating: 4.5,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Lychee Tea",
        prices: {'Small': 'Rp 17.000', 'Medium': 'Rp 20.000', 'Large': 'Rp 23.000'},
        icon: "🍹",
        imageUrl: "assets/lychee_tea.jpg",
        description: "Teh dengan rasa leci yang manis.",
        category: "Refreshments",
        subtitle: "Sweet & Fragrant",
        rating: 4.6,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Peach Tea",
        prices: {'Small': 'Rp 17.000', 'Medium': 'Rp 20.000', 'Large': 'Rp 23.000'},
        icon: "🍑",
        imageUrl: "assets/peach_tea.jpg",
        description: "Teh dengan rasa peach yang segar.",
        category: "Refreshments",
        subtitle: "Fruity & Aromatic",
        rating: 4.6,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Mineral Water",
        prices: {'Small': 'Rp 7.000', 'Medium': 'Rp 10.000', 'Large': 'Rp 13.000'},
        icon: "💧",
        imageUrl: "assets/mineral.jpg",
        description: "Air mineral yang menyegarkan.",
        category: "Refreshments",
        subtitle: "Pure & Simple",
        rating: 4.0,
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Sparkling Water",
        prices: {'Small': 'Rp 12.000', 'Medium': 'Rp 15.000', 'Large': 'Rp 18.000'},
        icon: "✨",
        imageUrl: "assets/sparkling.jpg",
        description: "Air mineral dengan soda.",
        category: "Refreshments",
        subtitle: "Bubbly & Crisp",
        rating: 4.2,
      ),
    );
  }

  @override
  void printDetails() {
    super.printDetails();
    print("UserModel: Name = $_name, Age = $_age");
    print("Menu Items: ${_menuItems.map((item) => item.name).join(", ")}");
  }
}