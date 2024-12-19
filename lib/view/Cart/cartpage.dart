import 'package:flutter/material.dart';
import 'package:petshop/viewModel/cartprovider.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Cartprovider>(context, listen: false).getALlCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Consumer<Cartprovider>(
        builder: (context, cartProvider, child) {
          if (cartProvider.isloadin) {
            return Center(child: CircularProgressIndicator());
          }

          if (cartProvider.cartList.isEmpty) {
            return Center(
              child: Text('No items in the cart'),
            );
          }

          return ListView.builder(
            itemCount: cartProvider.cartList.length,
            itemBuilder: (context, index) {
              final data = cartProvider.cartList[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(data.productName ?? 'name'),
                  // Add more fields here if necessary
                ),
              );
            },
          );
        },
      ),
    );
  }
}
