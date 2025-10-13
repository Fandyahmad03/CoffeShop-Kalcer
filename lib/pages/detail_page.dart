import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import '../model/user_model.dart';

class DetailPage extends StatefulWidget {
  final MenuModel menuItem;
  final UserModel user; // <-- DITAMBAHKAN: Untuk mengakses fungsi update

  const DetailPage({
    super.key,
    required this.menuItem,
    required this.user, // <-- DITAMBAHKAN
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _quantity = 1;
  String _selectedSize = "Medium";
  double _ratingValue = 0.0;

  @override
  void initState() {
    super.initState();
    _ratingValue = widget.menuItem.rating;
  }

  void _incrementQuantity() {
    setState(() {
      if (_quantity < 99) _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) _quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6F4E37),
      body: Stack(
        children: [
          _buildProductImage(),
          _buildContentSheet(),
          _buildTopButtons(),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return Hero(
      tag: 'menu_image_${widget.menuItem.name}',
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.menuItem.imageUrl),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.darken,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContentSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.6,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF5F0E8),
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(24.0),
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.menuItem.name,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4E342E),
                      ),
                    ),
                  ),
                  Text(
                    widget.menuItem.prices[_selectedSize] ?? widget.menuItem.price,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4E342E),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _buildRatingStars(),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              const Text(
                "Ukuran Cup",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4E342E),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSizeChip("Small"),
                  _buildSizeChip("Medium"),
                  _buildSizeChip("Large"),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                "Deskripsi",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4E342E),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.menuItem.description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.brown.shade700,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Jumlah",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4E342E),
                    ),
                  ),
                  _buildQuantitySelector(),
                ],
              ),
              const SizedBox(height: 32),
              _buildAddToCartButton(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRatingStars() {
    return Row(
      children: [
        RatingStars(
          value: _ratingValue,
          onValueChanged: (v) {
            setState(() {
              _ratingValue = v;
              // Langsung update data di model utama
              widget.user.updateMenuRating(widget.menuItem.name, v);
            });
          },
          starBuilder: (index, color) => Icon(Icons.star, color: color),
          starCount: 5,
          starSize: 25,
          starColor: Colors.amber,
        ),
        const SizedBox(width: 8),
        Text(
          "(${_ratingValue.toStringAsFixed(1)})",
          style: const TextStyle(
            color: Color(0xFF4E342E),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget _buildSizeChip(String size) {
    bool isSelected = _selectedSize == size;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ChoiceChip(
          label: SizedBox(
            width: double.infinity,
            child: Text(
              size,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.brown.shade800,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              _selectedSize = size;
            });
          },
          selectedColor: const Color(0xFF4E342E),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: isSelected ? const Color(0xFF4E342E) : Colors.grey.shade300,
            ),
          ),
          showCheckmark: false,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: _decrementQuantity,
            icon: const Icon(Icons.remove, color: Color(0xFF4E342E)),
          ),
          Text(
            _quantity.toString(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4E342E),
            ),
          ),
          IconButton(
            onPressed: _incrementQuantity,
            icon: const Icon(Icons.add, color: Color(0xFF4E342E)),
          ),
        ],
      ),
    );
  }

  Widget _buildAddToCartButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          // Add to cart logic
          widget.user.addToCart(widget.menuItem, _selectedSize, _quantity);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  "$_quantity x ${widget.menuItem.name} ($_selectedSize) ditambahkan ke keranjang"),
              backgroundColor: const Color(0xFF4E342E),
              duration: const Duration(seconds: 2),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4E342E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          "Tambah ke Keranjang",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTopButtons() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.3),
              child: IconButton(
                // DIUBAH: Saat kembali, kirim data rating terbaru
                onPressed: () => Navigator.pop(context, true),
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.3),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (widget.user.isFavorite(widget.menuItem)) {
                      widget.user.removeFromFavorites(widget.menuItem);
                    } else {
                      widget.user.addToFavorites(widget.menuItem);
                    }
                  });
                },
                icon: Icon(
                  widget.user.isFavorite(widget.menuItem)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}