import 'package:flutter/material.dart';
import 'package:petshop/viewModel/cartprovider.dart';
import 'package:petshop/viewModel/providerProdects.dart';
import 'package:petshop/viewModel/whislistProvider.dart';
import 'package:provider/provider.dart';

class Wishlistpage extends StatefulWidget {
  const Wishlistpage({super.key});

  @override
  State<Wishlistpage> createState() => _WishlistpageState();
}

class _WishlistpageState extends State<Wishlistpage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Whislistprovider>(context, listen: false).getALlWhis();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Consumer2<Whislistprovider, ProviderprodectsForFetch>(
        builder: (context, cartProvider, prodect, child) {
          if (cartProvider.isloding) {
            return Center(child: CircularProgressIndicator());
          }

          if (cartProvider.getAllDataInWhislist.isEmpty) {
            return Center(
              child: Text('No items in the cart'),
            );
          }

          return ListView.builder(
            itemCount: cartProvider.getAllDataInWhislist.length,
            itemBuilder: (context, index) {
              final pdata = prodect.getAllProdectsInList[index];

              final data = cartProvider.getAllDataInWhislist[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(data.productName ?? 'name'),
                  trailing: IconButton(
                      onPressed: () {
                        cartProvider.DeleteToWhislist(pdata.id, index);
                      },
                      icon: Icon(Icons.delete)),
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
