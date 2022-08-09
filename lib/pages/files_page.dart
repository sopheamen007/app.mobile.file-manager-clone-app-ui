
import 'package:animate_do/animate_do.dart';
import 'package:file_manager_clone/data/category_json.dart';
import 'package:file_manager_clone/pages/file_detail_page.dart';
import 'package:file_manager_clone/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class FilesPage extends StatefulWidget {
  const FilesPage({ Key? key }) : super(key: key);

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }
  Widget getBody(){
    return SafeArea(child: SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          SizedBox(height: 20,),
          getTabs(),
          SizedBox(height: 30,),
          getDateSection(),
          SizedBox(height: 20,),
          pageIndex == 0 ? getListMyCloudItems() : getListTeamCloudItems()
        ],
      ),
    ));
  }
  Widget getTabs(){
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 55,
      decoration: BoxDecoration(
        color: secondary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          pageIndex == 0 ? 
          Flexible(child: ElasticIn(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  pageIndex = 0;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  width: (size.width -45)/2,
                  height: 50,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Text("My Cloud",style: TextStyle(
                      fontSize: 15,
                      color: white,
                      fontWeight: FontWeight.w500
                    ),),
                  ),
                ),
              ),
            ),
          )) : GestureDetector(
            onTap: (){
              setState(() {
                pageIndex = 0;
              });
            },
            child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    width: (size.width -45)/2,
                    height: 50,
                    decoration: BoxDecoration(
                      // color: primary,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: Text("My Cloud",style: TextStyle(
                        fontSize: 15,
                        color: secondary.withOpacity(0.5),
                        fontWeight: FontWeight.w500
                      ),),
                    ),
                  ),
                ),
          ),
          pageIndex == 1 ? 
          Flexible(child: ElasticIn(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  pageIndex = 1;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  width: (size.width -45)/2,
                  height: 50,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Text("Team Cloud",style: TextStyle(
                      fontSize: 15,
                      color: white,
                      fontWeight: FontWeight.w500
                    ),),
                  ),
                ),
              ),
            ),
          )) : GestureDetector(
            onTap: (){
              setState(() {
                pageIndex = 1;
              });
            },
            child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    width: (size.width -45)/2,
                    height: 50,
                    decoration: BoxDecoration(
                      // color: primary,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: Text("Team Cloud",style: TextStyle(
                        fontSize: 15,
                        color: secondary.withOpacity(0.5),
                        fontWeight: FontWeight.w500
                      ),),
                    ),
                  ),
                ),
          )
        ],
      ),
    );
  }

  Widget getDateSection(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text("Date Modified",style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),),
            SizedBox(width: 2,),
            Icon(LineIcons.arrowDown,size: 20,)
          ],
        ),
        IconButton(onPressed: (){

        }, icon: Icon(LineIcons.borderAll,color: black.withOpacity(0.5),))
      ],
    );
  }

  Widget getListMyCloudItems(){
    var size = MediaQuery.of(context).size;
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: List.generate(myCloudFilesContentJson.length, (index) {
        return GestureDetector(
          onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (_) => FileDetailPage(
              title:myCloudFilesContentJson[index]['title'],
              fileCount: myCloudFilesContentJson[index]['file_count'],
            )));
          },
          child: Container(
            width: (size.width - 50)/2,
            height: (size.width - 50)/2,
            decoration: BoxDecoration(
              color:secondary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(myCloudFilesContentJson[index]['img'],width: 55,),
                SizedBox(height: 15,),
                Text(myCloudFilesContentJson[index]['title']+" ( ${myCloudFilesContentJson[index]['file_count']} )",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),)
              ],
            ),
          ),
        );
      }),
    );
  }
  Widget getListTeamCloudItems(){
    var size = MediaQuery.of(context).size;
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: List.generate(teamCloudFilesContentJson.length, (index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => FileDetailPage(
              title:teamCloudFilesContentJson[index]['title'],
              fileCount: teamCloudFilesContentJson[index]['file_count'],
            )));
          },
          child: Container(
            width: (size.width - 50)/2,
            height: (size.width - 50)/2,
            decoration: BoxDecoration(
              color:secondary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(teamCloudFilesContentJson[index]['img'],width: 55,),
                SizedBox(height: 15,),
                Text(teamCloudFilesContentJson[index]['title']+" ( ${teamCloudFilesContentJson[index]['file_count']} )",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),)
              ],
            ),
          ),
        );
      }),
    );
  }
}