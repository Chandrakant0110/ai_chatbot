import 'package:flutter/material.dart'; 
import 'package:package_info_plus/package_info_plus.dart'; 

class PackageInfoScreen extends StatefulWidget { 
const PackageInfoScreen({super.key}); 

@override 
State<PackageInfoScreen> createState() => _PackageInfoScreenState(); 
} 

class _PackageInfoScreenState extends State<PackageInfoScreen> { 
Map<String, dynamic> myPackageData = {}; 
@override 
void initState() { 
	super.initState(); 
	PackageInfo.fromPlatform().then((value) { 
	myPackageData = value.data; 
	setState(() {}); 
	}); 
} 

@override 
Widget build(BuildContext context) { 
	return Scaffold( 
	appBar: AppBar( 
		title: const Text("Package Infos Details"), 
	), 
	body: Padding( 
		padding: const EdgeInsets.all(8.0), 
		child: Center( 
		child: Text( 
			myPackageData.toString(), 
			style: const TextStyle(fontSize: 20), 
		), 
		), 
	), 
	); 
} 
}
