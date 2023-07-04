import 'package:flutter/material.dart';
import 'dart:math';
import 'package:menu_kantin/widget/sidebar.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Map<String, String> selectedItems = {};

  void _toggleItem(String item) {
    setState(() {
      final category = getCategoryForItem(item);
      final currentCategoryItem = selectedItems[category];

      if (currentCategoryItem == item) {
        selectedItems.remove(category);
      } else {
        selectedItems[category] = item;
      }
    });
  }

  String getCategoryForItem(String item) {
    if (item == 'Nasi') {
      return 'Karbo';
    } else if (item == 'Ayam Goreng' || item == 'Ayam Kebuli') {
      return 'Lawuk';
    } else if (item == 'Es Teh' || item == 'Teh Anget' || item == 'Jus Jeruk') {
      return 'Minum';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 1.0, bottom: 5.0,),
                  child: Text(
                    'Karbo',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MenuCard(
                      item: 'Nasi',
                      selected: selectedItems.containsValue('Nasi'),
                      onPressed: _toggleItem,
                      imagePath: 'lib/assets/images/nasi.png',
                      category: 'Karbo',
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                const Padding(
                  padding: EdgeInsets.only(left: 1.0, bottom: 5.0, top: 16.0,),
                  child: Text(
                    'Lawuk',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MenuCard(
                      item: 'Ayam Goreng',
                      selected: selectedItems.containsValue('Ayam Goreng'),
                      onPressed: _toggleItem,
                      imagePath: 'lib/assets/images/ayam_goreng.png',
                      category: 'Lawuk',
                    ),
                    MenuCard(
                      item: 'Ayam Kebuli',
                      selected: selectedItems.containsValue('Ayam Kebuli'),
                      onPressed: _toggleItem,
                      imagePath: 'lib/assets/images/nasi_kebuli.png',
                      category: 'Lawuk',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MenuCard(
                      item: 'Burger',
                      selected: selectedItems.containsValue('Burger'),
                      onPressed: _toggleItem,
                      imagePath: 'lib/assets/images/burger.jpg',
                      category: 'Lawuk',
                    ),
                    MenuCard(
                      item: 'Rendang',
                      selected: selectedItems.containsValue('Rendang'),
                      onPressed: _toggleItem,
                      imagePath: 'lib/assets/images/rendang.jpg',
                      category: 'Lawuk',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MenuCard(
                      item: 'Soto',
                      selected: selectedItems.containsValue('Soto'),
                      onPressed: _toggleItem,
                      imagePath: 'lib/assets/images/soto.jpg',
                      category: 'Lawuk',
                    ),
                    MenuCard(
                      item: 'Telur',
                      selected: selectedItems.containsValue('Telur'),
                      onPressed: _toggleItem,
                      imagePath: 'lib/assets/images/telur.jpg',
                      category: 'Lawuk',
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                const Padding(
                  padding: EdgeInsets.only(left: 1.0, bottom: 5.0, top: 16.0,),
                  child: Text(
                    'Minum',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    MenuCard(
                      item: 'Jus Jeruk',
                      selected: selectedItems.containsValue('Jus Jeruk'),
                      onPressed: _toggleItem,
                      imagePath: 'lib/assets/images/jus_jeruk.png',
                      category: 'Minum',
                    ),
                    MenuCard(
                      item: 'Es Teh',
                      selected: selectedItems.containsValue('Es Teh'),
                      onPressed: _toggleItem,
                      imagePath: 'lib/assets/images/es_teh.png',
                      category: 'Minum',
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    MenuCard(
                      item: 'Teh Anget',
                      selected: selectedItems.containsValue('Teh Anget'),
                      onPressed: _toggleItem,
                      imagePath: 'lib/assets/images/teh_anget.png',
                      category: 'Minum',
                    ),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutPage(selectedItems: selectedItems),
                ),
              );
            },
            child: const Text('Confirm Order'),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class MenuCard extends StatefulWidget {
  final String item;
  final bool selected;
  final Function(String) onPressed;
  final String imagePath;
  final String category;


  const MenuCard({
    required this.item,
    required this.selected,
    required this.onPressed,
    required this.imagePath,
    required this.category,

  });
  @override
  _MenuCardState createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPressed(widget.item),
      child: Card(
        color: widget.selected ? Colors.green : null,
        child: Column(
          children: [
            Image.asset(
              widget.imagePath,
              height: 200,
              width: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8.0),
            Text(widget.item),
          ],
        ),
      ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  final Map<String, String> selectedItems;

  const CheckoutPage({required this.selectedItems});

  String getCurrentTime() {
    final currentTime = DateTime.now();
    return '${currentTime.year.toString().padLeft(4, '0')}:${currentTime.month.toString().padLeft(2, '0')}:${currentTime.day.toString().padLeft(2, '0')} Jam ${currentTime.hour.toString().padLeft(2, '0')}:${currentTime.minute.toString().padLeft(2, '0')}';
  }

  String generateOrderNumber() {
    // Generate a random order number starting with "P" followed by 5 random digits
    final random = Random();
    final orderNumber = 'P${List.generate(5, (_) => random.nextInt(10)).join()}';
    return orderNumber;
  }

  void _goToNumberOrderPage(BuildContext context) {
    final orderNumber = generateOrderNumber();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NumberOrderPage(orderNumber: orderNumber),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Selected Items:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: selectedItems.length,
              itemBuilder: (context, index) {
                final category = selectedItems.keys.elementAt(index);
                final item = selectedItems.values.elementAt(index);
                return ListTile(
                  title: Text('Pilihan $category'),
                  subtitle: Text('menu: $item'),
                );
              },
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Dipesan saat: ${getCurrentTime()}',
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
          const SizedBox(height: 16.0),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: ElevatedButton(
                onPressed: () => _goToNumberOrderPage(context),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(200.0, 50.0)),
                ),
                child: const Text(
                  'Confirm Order',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NumberOrderPage extends StatelessWidget {
  final String orderNumber;

  NumberOrderPage({required this.orderNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Order Page'),
      ),
      body: Center(
        child: Text(
          'Order Number: $orderNumber',
          style: const TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MenuPage(),
  ));
}
