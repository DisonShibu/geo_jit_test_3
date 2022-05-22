import 'package:app_template/src/bloc/user_bloc.dart';
import 'package:app_template/src/models/user_details_response_model.dart';
import 'package:app_template/src/utils/constants.dart';
import 'package:app_template/src/utils/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserBloc userBloc = new UserBloc();
  bool error=true;

  @override
  void initState() {
    userBloc.userInfo();
    userBloc.userInfoResponse.listen((event) {

    }).onError((e){


    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.kitGradients[0],
        leading: Icon(Icons.menu,size: 30,color:Constants.kitGradients[4],),
        title: Text("HomePage",style: TextStyle(color: Constants.kitGradients[4],fontSize: 20),),
          centerTitle: true,
      ),
      body: StreamBuilder<List<UserInfoResponse>>(
        stream: userBloc.userInfoResponse,
        builder: (context, snapshot) {
          return snapshot.hasData? ListView.builder(
              itemCount: snapshot.data.length,
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext cntxt, int index)
          {

            return Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 40),horizontal: 8.0),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 40),horizontal: 30),
                  child: Column(
                    children: [
                      Text(snapshot.data[index].title,style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      ),

                      SizedBox(height: screenHeight(context,dividedBy: 80),),

                      Text(snapshot.data[index].body,style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.normal),),

                    ],
                  ),
                ),
              ),
            );
          }):Center(
            child: Container(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                valueColor:
                AlwaysStoppedAnimation(Constants.kitGradients[4]),
                strokeWidth: 2,
              ),
            ),
          );
        }
      ),
    );
  }
}
