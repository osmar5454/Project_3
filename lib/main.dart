import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState  createState() => _MyHomePageState();

}


class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  //-------------------------------Funcion para obtener colores -------------------------------
  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }
//---------------------------------------------------------------------------


  TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

//------------------------------Widget del item -------------------------

Widget itemCard(String title , String imgPath , bool isFavorite){
  return Material(
    color: Colors.transparent,
    child: Padding(
      padding: EdgeInsets.only(left : 15.0 , right: 15.0 , top: 10.0),
      child: Container(
        height: 150.0,
        width: double.infinity,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(getColorHexFromStr('#FCF9F9')),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4) , spreadRadius: 3.0 , blurRadius: 5.0
            )
          ]
        ),
        child: Row(
          children: <Widget>[

            //------------Imagen---------------
            Container(
              width: 140.0,
              height: 150.0,
              decoration: BoxDecoration(
                  image : DecorationImage(image: AssetImage(imgPath) , fit: BoxFit.cover,

                  ),
                  borderRadius: BorderRadius.circular(20.0)
              ),
            ),
            SizedBox(width: 30.0,),
            //----------------------------------

            Column(
              children: <Widget>[
                //------------------Titulo y icono de corazon---------------------------
                Row(
                  children: <Widget>[
                    Text(title , style: TextStyle(fontFamily: 'Merriweather' , fontSize: 20.0 ,fontWeight: FontWeight.w600 ,  ),),
                    SizedBox(width: 40.0,),
                    Material(
                      
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        margin: EdgeInsets.only(top: 5.0),
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: isFavorite? Colors.grey.withOpacity(0.2)  : Colors.white
                        ),
                        child: Center(
                          child: isFavorite ? Icon(
                            Icons.favorite_border , color: Color(getColorHexFromStr('#318A96')),
                          ) : Icon(
                            Icons.favorite , color: Color(getColorHexFromStr('#820933')),
                          ),
                        ),
                      ),
                    )

                  ],
                ),
                //---------------------------------------------------------------

                SizedBox(height:7.0,),
                Container(
                  width: 200.0,
                  child: Text(
                    'Scandinavian small sized double sofa imported full leather / Dale italia al won leather block',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Merriweather',
                        fontSize: 11.0,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                ),

                //---------------------------Parte de abajo ----------------------------
                SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    SizedBox(width: 35.0),
                    Container(
                      height: 45.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0)),
                        color: Color(getColorHexFromStr('#160F29')),
                      ),

                      child: Center(
                        child: Text(
                          '\$248',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Merriweather',
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                    Container(
                      height: 45.0,

                      width: 116.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(15.0)),
                        color: Color(getColorHexFromStr('#58357C')),
                      ),

                      child: Center(
                        child: Text(
                          'Add to cart',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Merriweather',
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    )
                  ],
                ),
                //----------------------------------------------------------------



              ],
            )
          ],
        ),
      ),
    ),
  );
}


//-----------------------------------------------------------------------




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[


              Stack(
                children: <Widget>[
//-----------------------------Parte de Arriba-----------------------------------
                  Container(
                    height: 280.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('images/top.jpg') , fit: BoxFit.cover)
                    ),
                    
                  ),

                 
//----------------------------------Imagen de Usuario y icono de menu ---------------------------------------------------------

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15.0,),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 15.0,),
                        Container(
                          alignment: Alignment.topLeft,
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              border: Border.all(
                                color: Color(getColorHexFromStr('#820933')),
                                style: BorderStyle.solid,
                                width: 1.0
                              ),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('images/person.jpg')
                              ),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width-120.0,),
                        Container(
                          alignment: Alignment.topRight,
                          child: IconButton(icon: Icon(Icons.menu), onPressed: (){} , color: Colors.black, iconSize: 30.0,),
                        )
                      ],
                    ),
                    
                    
    //-------------------------------------------Texto de Bienvenida-----------------------------------------
                    
                    SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('Hello ,    Pino' , style: TextStyle(fontFamily: 'Monoton' , fontSize:  40.0 , fontWeight: FontWeight.w400 , color: Color(getColorHexFromStr('#FFFFFF'))),),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('What  do  you  want  to  buy?' , style: TextStyle(fontFamily: 'Monoton' , fontSize:  18.0 , fontWeight: FontWeight.w300 ,  color: Color(getColorHexFromStr('#FFFFFF'))),),
                    ),
                    
    //---------------------------------------------------Buscador--------------------------------
                    
                    SizedBox(height: 25.0,),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0 , right: 15.0),
                      child: Material(
                        elevation: 8.0,
                        borderRadius: BorderRadius.circular(10.0),
                        child: TextFormField(

                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon:  Icon(Icons.search,color:Color(getColorHexFromStr('#820933')), size: 35.0,),
                            contentPadding: EdgeInsets.only(left: 15.0,top: 13.0),
                            hintText: 'Search ',
                            hintStyle: TextStyle(
                              color: Color(getColorHexFromStr('#2F1847')).withOpacity(0.4),
                              fontFamily: 'Merriweather',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500
                            )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,)
                  ],
                )
                ],
              ),


//-----------------------------------------------Seleccionador---------------------------------------

            SizedBox(height: 10.0,),
              Stack(
                children: <Widget>[
                  SizedBox(height: 10.0,),
                  Material(
                    elevation: 1.0,
                    child: Container(
                      height: 120.0,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[


                      Container(
                        height: 100.0,
                        width: MediaQuery.of(context).size.width/4,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 15.0,),
                            Container(
                              height: 60.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/sofas.png'),

                                )
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            Text(
                              'Sofas',
                              style: TextStyle(fontWeight: FontWeight.w500 , fontFamily: 'Merriweather', color: Color(getColorHexFromStr('#773DB5')) ),
                            )
                          ],
                        ),
                      ),






                      Container(
                        height: 100.0,
                        width: MediaQuery.of(context).size.width/4,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 15.0,),
                            Container(
                              height: 60.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('images/wardrobe.png'),

                                  )
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            Text(
                              'Wardrobe',
                              style: TextStyle(fontWeight: FontWeight.w500 , fontFamily: 'Merriweather', color: Color(getColorHexFromStr('#773DB5')) ),
                            )
                          ],
                        ),
                      ),








                      Container(
                        height: 100.0,
                        width: MediaQuery.of(context).size.width/4,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 15.0,),
                            Container(
                              height: 60.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('images/desks.png'),

                                  )
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            Text(
                              'Desk',
                              style: TextStyle(fontWeight: FontWeight.w500 , fontFamily: 'Merriweather', color: Color(getColorHexFromStr('#773DB5')) ),
                            )
                          ],
                        ),
                      ),







                      Container(
                        height: 100.0,
                        width: MediaQuery.of(context).size.width/4,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 15.0,),
                            Container(
                              height: 60.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('images/dressers.png'),

                                  )
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            Text(
                              'Dresser',
                              style: TextStyle(fontWeight: FontWeight.w500 , fontFamily: 'Merriweather', color: Color(getColorHexFromStr('#773DB5')) ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              
              
              
//---------------------------------------------Espacio para los items-----------------------------
            SizedBox(height: 15.00,),
            itemCard('FinnNavian', 'images/foto1.jpg', false),
              itemCard('Darmount', 'images/foto2.jpg', true),
              itemCard('Levi Natian', 'images/foto3.jpg', true),
              itemCard('Buque Olut', 'images/foto4.jpg', false),
              SizedBox(height: 15.00,),
            
            ],
          )
        ],
      ),

      bottomNavigationBar: Material(
        color: Color(getColorHexFromStr('#F9F4F4')),
        child: TabBar(
          controller: controller,
          indicatorColor: Color(getColorHexFromStr('#820933')),
          tabs: <Widget>[
            Tab(icon: Icon(Icons.event_seat, color: Color(getColorHexFromStr('#58357C')))),
            Tab(icon: Icon(Icons.timer, color: Color(getColorHexFromStr('#318A96')))),
            Tab(icon: Icon(Icons.shopping_cart, color: Color(getColorHexFromStr('#318A96')))),
            Tab(icon: Icon(Icons.person_outline, color: Color(getColorHexFromStr('#318A96'))))

          ],
        ),
      ),
    );
  }





}