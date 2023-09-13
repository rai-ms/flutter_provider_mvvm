import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/res/components/show_dialog.dart';
import 'package:flutter_provider_mvvm/utils/routes/route_name.dart';
import 'package:flutter_provider_mvvm/view/services/homepage_services.dart';
import 'package:flutter_provider_mvvm/view_model/temperature_view_model.dart';
import 'package:flutter_provider_mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../model/temperature_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Datum> user = [];
  @override
  void initState()  {
    loadData();
    super.initState();
  }

  void loadData() async {
    user = await HomePageService().getUser();
  }
  // eve.holt@reqres.in

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TemperatureViewModel>(context, listen : true);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.exit_to_app), onPressed: () {
          UserViewModel().remove();
          Navigator.pushNamed(context, RouteName.loginPage); },),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Consumer<TemperatureViewModel>(
                builder: (context, value, child) {
                  return FutureBuilder<List<Datum>>(future: HomePageService().getUser(), builder: (context, snapshot){
                    if(!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting || snapshot.hasError){
                      return const SizedBox(
                          height: 100,
                          width: 100,
                          child: CircularProgressIndicator());
                    }
                    else if (snapshot.hasData){
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index){
                            return ListTile(
                              onTap: (){
                                ShowMyAppDialog().showAppDialog(context, user[index].avatar, user[index].firstName, user[index].lastName, user[index].email);
                              },
                              title: Text(user[index].firstName),
                              leading: CircleAvatar(backgroundImage: NetworkImage(user[index].avatar),),
                            );
                      });
                    }
                    else {
                      return const Flexible(child: Text("No Data Found"));
                    }
                  });
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
