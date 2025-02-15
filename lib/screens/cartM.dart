// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'mayuri.dart';

class CartM extends StatefulWidget {
  final List<MenuM> selectedItemsM;

  const CartM({Key? key, required this.selectedItemsM}) : super(key: key);

  @override
  CartMState createState() => CartMState();
}

class CartMState extends State<CartM> {
  List<String> itemNamesWithQuantities = [];
  MayuriState underBellyState = MayuriState();
  late List<bool> _fadeOutList;

  @override
  void initState() {
    super.initState();
    _fadeOutList = List.generate(widget.selectedItemsM.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart', style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: Stack(
          children: [
            widget.selectedItemsM.isEmpty
                ? FadeInUp(
                    duration: const Duration(milliseconds: 400),
                    child: const Center(
                      child: Text(
                        'No items are selected',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                : Scrollbar(
                    radius: const Radius.circular(10),
                    thickness: 10,
                    interactive: true,
                    trackVisibility: true,
                    child: ListView.builder(
                      itemCount: widget.selectedItemsM.length,
                      itemBuilder: (context, index) {
                        final item = widget.selectedItemsM[index];
                        String itemNameWithQuantity =
                            '• ${item.name} x${item.quantity}\n';
                        itemNamesWithQuantities.add(itemNameWithQuantity);
                        return _fadeOutList[index]
                            ? FadeOutRight(
                                duration: const Duration(milliseconds: 400),
                                child: ListTile(
                                  title: Text(
                                    item.name,
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                  subtitle: Text(
                                    '₹${item.price.toStringAsFixed(0)}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? const Color(0xFF4E6700)
                                          : const Color(0xFFD0EE82),
                                    ),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        tooltip: 'Remove',
                                        onPressed: () {},
                                      ),
                                      Text(
                                        '${item.quantity}',
                                        style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? const Color(0xFF4E6700)
                                              : const Color(0xFFD0EE82),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        tooltip: 'Add',
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : FadeInUp(
                                duration: const Duration(milliseconds: 400),
                                delay: Duration(milliseconds: 100 * index),
                                child: ListTile(
                                  title: Text(
                                    item.name,
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                  subtitle: Text(
                                    '₹${item.price.toStringAsFixed(0)}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? const Color(0xFF4E6700)
                                          : const Color(0xFFD0EE82),
                                    ),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        tooltip: 'Remove',
                                        onPressed: () {
                                          setState(() {
                                            if (item.quantity > 0) {
                                              item.quantity--;
                                              if (item.quantity == 0) {
                                                _fadeOutList[index] = true;
                                                Future.delayed(
                                                  const Duration(
                                                      milliseconds: 400),
                                                  () {
                                                    setState(() {
                                                      widget.selectedItemsM
                                                          .removeAt(index);
                                                      _fadeOutList
                                                          .removeAt(index);
                                                    });
                                                  },
                                                );
                                              }
                                            }
                                          });
                                        },
                                      ),
                                      Text(
                                        '${item.quantity}',
                                        style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? const Color(0xFF4E6700)
                                              : const Color(0xFFD0EE82),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        tooltip: 'Add',
                                        onPressed: () {
                                          setState(() {
                                            item.quantity++;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).brightness == Brightness.light
                  ? const Color(0xFF4E6700)
                  : const Color(0xFFD0EE82),
              width: 3,
            ),
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${underBellyState.getSelectedItemsCount()} Item  |  ₹${underBellyState.getTotalPrice().toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
