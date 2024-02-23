import 'package:petstore/model/pet.dart';
import 'package:petstore/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PetCart extends StatelessWidget {
  const PetCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<CartProvider>(
      builder: (context, value, child) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'My Cart',
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.w500),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.items.length,
                  itemBuilder: (context, index) {
                    Pet pet = value.items[index];
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0x1A98FF98),
                            borderRadius: BorderRadius.circular(8)),
                        child: ListTile(
                          leading:
                              Image.asset(pet.imagePath, fit: BoxFit.cover),
                          title: Text(
                            pet.name,
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                          subtitle: Text(
                            '\$${pet.price}',
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: Colors.grey),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                value.removeFromCart(pet);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Pet removed from the cart.'),
                                  duration: Duration(seconds: 2),
                                ));
                              },
                              icon: const Icon(
                                Icons.close_rounded,
                                size: 25,
                                color: Colors.redAccent,
                              )),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Cart Total: \$${value.getCartTotal()}',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.amberAccent),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            width: MediaQuery.sizeOf(context).width * .30,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(92, 0, 79, 250),
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Pay now',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const Icon(
                                  Icons.arrow_right_alt_rounded,
                                  color: Colors.white,
                                  size: 20,
                                )
                              ],
                            )))
                  ],
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}
