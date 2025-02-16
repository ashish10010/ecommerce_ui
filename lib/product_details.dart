import 'package:ecommerce_ui/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {

  final Map<String,Object> product;

  const ProductDetailsPage(
    {
      super.key,
      required this.product
      });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  int selectedSize = 0;
  void onTap () {
      if(selectedSize != 0){
                       Provider.of<CartProvider>(context, listen: false)
                      .addProduct({
                        'id': widget.product['id'],
                        'title': widget.product['title'],
                        'price': widget.product['price'],
                        'imageUrl': widget.product['imageUrl'],
                        'company': widget.product['company'],
                        'size':selectedSize,
                      });
                       ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                       content: Text('Product added to the cart'),
            ),
         );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please Select a Size'),
            ),
        );
      }                 
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        children: [
           Text(widget.product['title'] as String,
           style: Theme.of(context).textTheme.titleLarge,
           ),
           const Spacer( ),

           Padding(
             padding: const EdgeInsets.all(16.0),
             child: Image.asset(widget.product['imageUrl'] as String),
           ),

           const Spacer(flex: 2),
           Container(
            height: 250,
            decoration:  BoxDecoration(
              color: const Color.fromRGBO(245, 247, 249, 1),
              borderRadius:BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('\$${widget.product['price']}',
                style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length ,
                    itemBuilder: (context, index) {
                      final size = (widget.product['sizes'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            label: Text(size.toString()),
                            backgroundColor: selectedSize == size 
                            ? Theme.of(context).colorScheme.primary 
                            : null
                            ),
                        ),
                      );
                    }),
                ),
                
                 Padding(
                   padding: const EdgeInsets.all(20),
                   child: ElevatedButton.icon(
                     icon: const Icon(Icons.shopping_cart,
                     color: Colors.black,
                     ),
                    onPressed: onTap,
                   style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize: const Size(double.infinity, 50),

                   ),
                   label: const Text("ADD TO CART", style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                   ),),
                                 
                   ),
                 ),
              ],
            ),
           )
        ],
      ),
    );
  }
}