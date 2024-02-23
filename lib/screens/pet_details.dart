import 'package:petstore/custom/custom.dart';
import 'package:petstore/custom/myBottomNav.dart';
import 'package:petstore/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../model/pet.dart';

class PetDetails extends StatefulWidget {
  final Pet pet;

  const PetDetails({super.key, required this.pet});

  @override
  State<PetDetails> createState() => _PetDetailsState();
}

class _PetDetailsState extends State<PetDetails> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      bottomNavigationBar: MyBottomNav(
        selectedIndex: _selectedIndex,
        onTabTapped: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * .50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.pet.imagePath),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.sizeOf(context).height * .45),
                width: MediaQuery.sizeOf(context).width * .90,
                height: MediaQuery.sizeOf(context).height * .13,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 7),
                      ),
                    ],
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: const BorderRadius.all(Radius.circular(24))),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.pet.name,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                color: Colors.black),
                          ),
                          Row(
                            children: [
                              Text(
                                widget.pet.location,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.grey),
                              ),
                              const Text(
                                '  •  ',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                              Text(
                                widget.pet.time,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.shopping_cart_rounded,
                              size: 30,
                              color: cartProvider.items.contains(widget.pet) ==
                                      true
                                  ? Colors.amberAccent
                                  : Colors.grey,
                            ),
                          ),
                          Text(
                            '\$${widget.pet.price}',
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFE8BE13)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(15),
                margin: EdgeInsets.only(
                    top: MediaQuery.sizeOf(context).height * .60),
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(24),
                        topStart: Radius.circular(24)),
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About ${widget.pet.name}',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: PetBoxDetail(
                                text1: 'Weight', text2: widget.pet.weight)),
                        Expanded(
                            child: PetBoxDetail(
                                text1: 'Height', text2: widget.pet.height)),
                        Expanded(
                            child: PetBoxDetail(
                                text1: 'Color', text2: widget.pet.color)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.pet.description,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        bool exist = cartProvider.items.contains(widget.pet);
                        if (exist == false) {
                          cartProvider.addToCart(widget.pet);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 2),
                                  content: Text('Successfuly added to cart')));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 2),
                                  content:
                                      Text('Pet is already added to cart')));
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        alignment: Alignment.center,
                        height: 52,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Color(0xFFE8BE13),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Text('Add to cart',
                            style: GoogleFonts.poppins(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
