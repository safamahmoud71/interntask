import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 List<IconData> bottomIcons=[
  Icons.exit_to_app_rounded,
   Icons.favorite,
   Icons.home,
   Icons.notification_add_sharp,
   Icons.settings,


 ];

 int currentIndex =0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(

        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.center,
        colors: [Color(0xff0062BD),Colors.white],)),

          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                 Row(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                         width: 300,
                         height: 50,
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(10)
                         ),

                         child: TextFormField(
                           decoration: InputDecoration(
                             fillColor: Colors.white,
                             hintText: 'Enter Search here...',
                             prefixIcon: const Icon(Icons.search, color: Color(0xff979797),),
                             hintStyle: const TextStyle(
                               fontSize: 10.0,
                               color: Color(0xffB1B1B1),
                               fontWeight: FontWeight.w400,
                             ),
                             border: OutlineInputBorder(
                               borderSide: BorderSide.none,
                               borderRadius: BorderRadius.circular(10),
                             ),
                           ),

                         ),
                       ),
                     ),
                     IconButton(onPressed: (){}, icon: const Icon(Icons.filter_alt_rounded, color: Color(0xff979797),size: 30,))
                   ],
                 ),
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin:const EdgeInsets.all(10),
                  child: Image.asset('assets/images/Acer-Predator-Helios-300-2021 2.png'),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Recomended \n For you', style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,

                    ),maxLines: 3,),
                    Stack(
                      children: [
                        const ClipRect(
                          child: SizedBox(
                            width: 185, // Set the desired width for the base card
                            height: 280,
                            // Set the desired height for the base card
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: Icon(Icons.person),
                                title: Padding(
                                  padding:  EdgeInsets.only(top: 150.0),
                                  child: Text('lab top'),
                                ),
                                subtitle: Padding(
                                  padding:  EdgeInsets.only(top: 0.0),
                                  child: Text('Software Developer'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Card(
                              color: Colors.white,
                              child: SizedBox(
                                width: 180, // Set the desired width for the extended card
                                height: 150, // Set the desired height for the extended card
                                child: ListTile(
                                  title: Image.asset('assets/images/71nz3cIcFOL 3.png'),
                                  //  subtitle: Text('Lorem ipsum dolor sit amet.'),
                                ),
                              ),
                            ),
                            IconButton(onPressed: (){}, icon: Icon(Icons.favorite))
                          ],
                        ),
                      ],
                    ),


                  ],
                )
              ],
            ),
          ),

        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {  },
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: bottomIcons,
        activeIndex:currentIndex ,
        gapLocation: GapLocation.end,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 5,


        onTap: (index) => setState(() => currentIndex = index),

        //other params
      ),

    );
  }
}
