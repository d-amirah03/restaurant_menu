import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantMenuApp());
}

class RestaurantMenuApp extends StatelessWidget {
  const RestaurantMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Menu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB39DDB)),
        fontFamily: 'Josefin Sans',
        scaffoldBackgroundColor: const Color(0xFFF8F5FC),
        useMaterial3: true,
      ),
      home: const MenuScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Menu'),
        backgroundColor: const Color(0xFFB39DDB),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          FoodCard(
            name: 'Vegetable Pizza',
            description: 'Loaded with fresh bell peppers, onions, mushrooms, olives, and mozzarella cheese on a crispy crust.',
            price: 'RM 22.00',
          ),
          SizedBox(height: 16),
          FoodCard(
            name: 'Chicken Pizza',
            description: 'Topped with tender grilled chicken chunks, BBQ sauce drizzle, onions, and extra melted cheese.',
            price: 'RM 25.50',
          ),
          SizedBox(height: 16),
          FoodCard(
            name: 'Cheese Pizza',
            description: 'A classic favorite featuring a generous blend of rich mozzarella and cheddar cheese over rich tomato sauce.',
            price: 'RM 20.00',
          ),
        ],
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String name;
  final String description;
  final String price;

  const FoodCard({
    super.key,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFE6D9F2),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // Extra Task Navigation: Opens the FoodDetailScreen when tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodDetailScreen(
                name: name,
                description: description,
                price: price,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFF9575CD),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.local_pizza,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3F3156),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Second Screen for the Extra Task Navigation
class FoodDetailScreen extends StatelessWidget {
  final String name;
  final String description;
  final String price;

  const FoodDetailScreen({
    super.key,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: const Color(0xFFB39DDB),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0xFFEDE7F6),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.local_pizza,
                  size: 90,
                  color: Color(0xFF7E57C2),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              price,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Description:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
