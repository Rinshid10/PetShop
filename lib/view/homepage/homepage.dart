import 'package:flutter/material.dart';
import 'package:petshop/view/Cart/cartpage.dart';
import 'package:petshop/view/wishlist/wishlistPage.dart';
import 'package:petshop/viewModel/cartprovider.dart';
import 'package:petshop/viewModel/providerProdects.dart';
import 'package:petshop/viewModel/whislistProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProviderprodectsForFetch>(context, listen: false).getdatass();
      Provider.of<Whislistprovider>(context, listen: false)
          .getALlWhis(); // Ensure wishlist data is fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cartpage()));
            },
            icon: Icon(Icons.shopping_cart)),
        title: Text('Product List'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Wishlistpage()));
              },
              icon: Icon(Icons.favorite)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            Consumer3<ProviderprodectsForFetch, Cartprovider, Whislistprovider>(
          builder: (context, value, cartproviderdata, whislistItems, child) {
            if (value.isloding) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (value.getAllProdectsInList.isEmpty) {
              return Center(
                child: Text('No products available'),
              );
            }

            return ListView.builder(
              itemCount: value.getAllProdectsInList.length,
              itemBuilder: (context, index) {
                final product = value.getAllProdectsInList[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(product.src.toString()),
                        SizedBox(height: 8.0),
                        Text(
                          product.productName ?? 'No title',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          product.link ?? 'No link',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                cartproviderdata
                                    .addToCartInprovider(product.id);
                              },
                              icon: Icon(
                                Icons.shopping_cart,
                                size: 40,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                whislistItems.adddToWhislist(product.id);
                              },
                              icon: Icon(
                                Icons.favorite,
                                size: 40,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                whislistItems.DeleteToWhislist(
                                    product.id, index);
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
