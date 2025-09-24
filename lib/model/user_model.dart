class BaseModel {
  void printDetails() {
    print("BaseModel details");
  }
}

class MenuModel {
  final String name;
  final String price;
  final String? icon; // Make 'icon' optional
  final String imageUrl; // New property for menu image
  final String description; // New property for menu description
  final String category; // New property for menu category

  MenuModel({
    required this.name,
    required this.price,
    this.icon, // Optional parameter
    required this.imageUrl,
    required this.description,
    required this.category, // Initialize category
  });
}

class UserModel extends BaseModel {
  String _name;
  int _age;

  UserModel(String name, int age) : _name = name, _age = age {
    initializeMenuItems();
  }
 

  // Getter for age
  int get age => _age;

  List<MenuModel> _menuItems = [];

  // Getter for menu items
  List<MenuModel> get menuItems => _menuItems;

  // Method to add a menu item
  void addMenuItem(MenuModel menuItem) {
    _menuItems.add(menuItem);
  }

  // Method to remove a menu item
  void removeMenuItem(MenuModel menuItem) {
    _menuItems.remove(menuItem);
  }

  void initializeMenuItems() {
    // Coffee
    addMenuItem(
      MenuModel(
        name: "Espresso",
        price: "Rp 15.000",
        icon: "☕",
        imageUrl: "assets/espresso.jpg",
        description: "Kopi pekat dengan rasa yang kuat.",
        category: "Coffee",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Americano",
        price: "Rp 18.000",
        icon: "☕",
        imageUrl: "assets/americano.jpg",
        description: "Kopi hitam dengan rasa yang kuat.",
        category: "Coffee",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Cappuccino",
        price: "Rp 22.000",
        icon: "☕",
        imageUrl: "assets/cappuccino.jpg",
        description: "Kopi dengan susu dan foam yang lembut.",
        category: "Coffee",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Caffè Latte",
        price: "Rp 22.000",
        icon: "☕",
        imageUrl: "assets/latte.jpg",
        description: "Kopi dengan susu yang lembut.",
        category: "Coffee",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Mocha",
        price: "Rp 25.000",
        icon: "☕",
        imageUrl: "assets/mocca.jpg",
        description: "Kopi dengan campuran coklat.",
        category: "Coffee",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Caramel Macchiato",
        price: "Rp 26.000",
        icon: "☕",
        imageUrl: "assets/macchiato.jpg",
        description: "Kopi dengan rasa karamel yang lembut.",
        category: "Coffee",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Flat White",
        price: "Rp 24.000",
        icon: "☕",
        imageUrl: "assets/flat_white.jpg",
        description: "Kopi dengan susu yang lembut dan creamy.",
        category: "Coffee",
      ),
    );

    // Cold Coffee
    addMenuItem(
      MenuModel(
        name: "Iced Americano",
        price: "Rp 20.000",
        icon: "🧊",
        imageUrl: "assets/iced_americano.jpg",
        description: "Americano dingin yang menyegarkan.",
        category: "Cold Coffee",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Iced Latte",
        price: "Rp 24.000",
        icon: "🧊",
        imageUrl: "assets/iced_latte.jpg",
        description: "Latte dingin yang menyegarkan.",
        category: "Cold Coffee",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Iced Mocha",
        price: "Rp 27.000",
        icon: "🧊",
        imageUrl: "assets/iced_mocha.jpg",
        description: "Mocha dingin yang menyegarkan.",
        category: "Cold Coffee",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Iced Caramel Macchiato",
        price: "Rp 30.000",
        icon: "🧊",
        imageUrl: "assets/iced_macchiato.jpg",
        description: "Caramel Macchiato dingin yang menyegarkan.",
        category: "Cold Coffee",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Cold Brew",
        price: "Rp 30.000",
        icon: "🧊",
        imageUrl: "assets/cold_brew.jpg",
        description: "Kopi dingin dengan rasa yang kuat.",
        category: "Cold Coffee",
      ),
    );

    // Non-Coffee
    addMenuItem(
      MenuModel(
        name: "Green Tea Latte",
        price: "Rp 24.000",
        icon: "🍵",
        imageUrl: "assets/greentea_latte.jpg",
        description: "Latte dengan rasa green tea.",
        category: "Non-Coffee",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Matcha Frappé",
        price: "Rp 26.000",
        icon: "🍵",
        imageUrl: "assets/matcha_frappe.jpg",
        description: "Frappé dengan rasa matcha.",
        category: "Non-Coffee",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Red Velvet Latte",
        price: "Rp 25.000",
        icon: "🍵",
        imageUrl: "assets/red_velvet_latte.jpg",
        description: "Latte dengan rasa red velvet.",
        category: "Non-Coffee",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Taro Latte",
        price: "Rp 25.000",
        icon: "🍵",
        imageUrl: "assets/taro_latte.jpg",
        description: "Latte dengan rasa taro.",
        category: "Non-Coffee",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Hot Chocolate",
        price: "Rp 22.000",
        icon: "🍫",
        imageUrl: "assets/hot_chocolate.jpg",
        description: "Minuman coklat hangat yang lezat.",
        category: "Non-Coffee",
      ),
    );

    // Pastries & Snacks
    addMenuItem(
      MenuModel(
        name: "Croissant Butter",
        price: "Rp 18.000",
        icon: "🥐",
        imageUrl: "assets/croissant_butter.jpg",
        description: "Pastry renyah dengan rasa butter.",
        category: "Snacks",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Chocolate Croissant",
        price: "Rp 20.000",
        icon: "🥐",
        imageUrl: "assets/chocolate_croissant.jpg",
        description: "Croissant dengan isian coklat.",
        category: "Snacks",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Cinnamon Roll",
        price: "Rp 22.000",
        icon: "🍩",
        imageUrl: "assets/cinnamon_roll.jpg",
        description: "Roti gulung dengan rasa kayu manis.",
        category: "Snacks",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Muffin (Blueberry/Chocolate)",
        price: "Rp 18.000",
        icon: "🧁",
        imageUrl: "assets/muffin.jpg",
        description: "Kue lembut dengan rasa blueberry atau coklat.",
        category: "Snacks",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Donut (Classic/Glazed)",
        price: "Rp 12.000",
        icon: "🍩",
        imageUrl: "assets/donut.jpg",
        description: "Donat klasik atau dengan glaze.",
        category: "Snacks",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "French Fries",
        price: "Rp 18.000",
        icon: "🍟",
        imageUrl: "assets/french_fries.jpg",
        description: "Kentang goreng renyah.",
        category: "Snacks",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Chicken Wings",
        price: "Rp 28.000",
        icon: "🍗",
        imageUrl: "assets/chicken_wings.jpg",
        description: "Sayap ayam goreng dengan bumbu spesial.",
        category: "Snacks",
      ),
    );

    // Dessert
    addMenuItem(
      MenuModel(
        name: "Cheesecake",
        price: "Rp 18.000",
        icon: "🍰",
        imageUrl: "assets/cheesecake.jpg",
        description: "Kue keju yang lembut dan lezat.",
        category: "Dessert",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Chocolate Croissant",
        price: "Rp 20.000",
        icon: "🥐",
        imageUrl: "assets/chocolate_croissant.jpg",
        description: "Croissant dengan isian coklat.",
        category: "Dessert",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Tiramisu",
        price: "Rp 20.000",
        icon: "🍰",
        imageUrl: "assets/tiramisu.jpg",
        description: "Kue kopi dengan lapisan mascarpone.",
        category: "Dessert",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Brownies with Ice Cream",
        price: "Rp 25.000",
        icon: "🍫",
        imageUrl: "assets/brownies_with_ice_cream.jpg",
        description: "Brownies dengan tambahan es krim.",
        category: "Dessert",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Panna Cotta",
        price: "Rp 26.000",
        icon: "🍮",
        imageUrl: "assets/panna_cotta.jpg",
        description: "Dessert Italia yang lembut dan manis.",
        category: "Dessert",
      ),
    );

    // Light Meals
    addMenuItem(
      MenuModel(
        name: "Club Sandwich",
        price: "Rp 32.000",
        icon: "🥪",
        imageUrl: "assets/club_sandwich.jpg",
        description: "Sandwich dengan isian daging dan sayuran.",
        category: "Light Meals",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Chicken Burger",
        price: "Rp 35.000",
        icon: "🍔",
        imageUrl: "assets/chicken_burger.jpg",
        description: "Burger dengan isian ayam goreng.",
        category: "Light Meals",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Beef Burger",
        price: "Rp 38.000",
        icon: "🍔",
        imageUrl: "assets/beef_burger.jpg",
        description: "Burger dengan isian daging sapi.",
        category: "Light Meals",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Pasta Aglio Olio",
        price: "Rp 32.000",
        icon: "🍝",
        imageUrl: "assets/pasta_aglio_olio.jpg",
        description: "Pasta dengan rasa bawang putih dan minyak zaitun.",
        category: "Light Meals",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Grilled Chicken",
        price: "Rp 40.000",
        icon: "🍗",
        imageUrl: "assets/grilled_chicken.jpg",
        description: "Ayam panggang dengan bumbu spesial.",
        category: "Light Meals",
      ),
    );

    // Refreshments
    addMenuItem(
      MenuModel(
        name: "Lemon Tea (Hot/Iced)",
        price: "Rp 18.000",
        icon: "🍋",
        imageUrl: "assets/lemon_tea.jpg",
        description: "Teh dengan rasa lemon yang menyegarkan.",
        category: "Refreshments",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Lychee Tea",
        price: "Rp 20.000",
        icon: "🍹",
        imageUrl: "assets/lychee_tea.jpg",
        description: "Teh dengan rasa leci yang manis.",
        category: "Refreshments",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Peach Tea",
        price: "Rp 20.000",
        icon: "🍑",
        imageUrl: "assets/peach_tea.jpg",
        description: "Teh dengan rasa peach yang segar.",
        category: "Refreshments",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Mineral Water",
        price: "Rp 10.000",
        icon: "💧",
        imageUrl: "assets/mineral_water.jpg",
        description: "Air mineral yang menyegarkan.",
        category: "Refreshments",
      ),
    );
    addMenuItem(
      MenuModel(
        name: "Sparkling Water",
        price: "Rp 15.000",
        icon: "✨",
        imageUrl: "assets/sparkling_water.jpg",
        description: "Air mineral dengan soda.",
        category: "Refreshments",
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
