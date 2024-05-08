import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/trash.dart';

// ignore: must_be_immutable
class TrashTile extends StatelessWidget {
  Trash trash;
  void Function()? onTap;
  TrashTile({super.key, required this.trash, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // pic
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(trash.imagePath)
          ),

          // desc
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              trash.description,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),

          // price + detalye
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // name
                    Text(trash.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      )
                    ),
            
                    const SizedBox(height: 5),
            
                    //presyo
                    Text(
                      '\$${trash.price}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
            
                // plus butt
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      )
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      ),
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