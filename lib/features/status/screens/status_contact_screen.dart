import 'package:dreamchat/common/widget/loader.dart';
import 'package:dreamchat/features/status/controller/status_controller.dart';
import 'package:dreamchat/features/status/screens/status_screen.dart';
import 'package:dreamchat/models/status_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatusTab extends ConsumerWidget {
  const StatusTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<Status>>(
      future: ref.read(StatusControllerProvider).getStatus(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Error ${snapshot.error}"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var statusData = snapshot.data![index];
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          StatusScreen.routeName,
                          arguments: statusData,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          title: Text(
                            statusData.username,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              statusData.profilePic,
                            ),
                            radius: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              });
        }
        return const Center(
          child: Text("Some thing went wrong"),
        );
      },
    );
  }
}

// time 8:18:46 
// Listview is not working All the data is fine and good