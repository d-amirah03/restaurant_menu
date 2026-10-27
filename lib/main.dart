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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
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
        title: const Text('Delicious Bites Menu'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          FoodCard(
            name: 'Nasi Lemak Special',
            description: 'Fragrant coconut rice served with crispy anchovies, peanuts, hard-boiled egg, cucumber, and spicy sambal.',
            price: 'RM 12.00',
            icon: Icons.rice_bowl,
          ),
          SizedBox(height: 12),
          FoodCard(
            name: 'Grilled Chicken Chop',
            description: 'Juicy grilled chicken thigh served with black pepper sauce, French fries, and coleslaw.',
            price: 'RM 18.50',
            icon: Icons.fastfood,
          ),
          SizedBox(height: 12),
          FoodCard(
            name: 'Classic Cheeseburger',
            description: 'Beef patty with melted cheddar cheese, fresh lettuce, tomatoes, and special sauce in a toasted bun.',
            price: 'RM 15.00',
            icon: Icons.lunch_dining,
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
  final IconData icon;

  const FoodCard({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 50, color: Colors.orange),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
