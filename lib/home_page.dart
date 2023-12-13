import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id = 'HomePage.id';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('WhatsApp'),
              bottom: const TabBar(tabs: [
                Tab(
                  child: Icon(Icons.groups),
                ),
                Tab(
                  child: Text('Chats'),
                ),
                Tab(
                  child: Text('Updates'),
                ),
                Tab(
                  child: Text('Calls'),
                ),
              ]),
              actions: [
                const Icon(Icons.camera_alt_outlined),
                const SizedBox(width: 15),
                const Icon(Icons.search),
                const SizedBox(width: 10),
                PopupMenuButton(
                    icon: const Icon(Icons.more_vert_outlined),
                    itemBuilder: (context) => [
                          const PopupMenuItem(
                              value: '1', child: Text('New group')),
                          const PopupMenuItem(
                              value: '2', child: Text('New broadcast')),
                          const PopupMenuItem(
                              value: '3', child: Text('Linked devices')),
                          const PopupMenuItem(
                              value: '4', child: Text('Starred messages')),
                          const PopupMenuItem(
                              value: '5', child: Text('Settings'))
                        ]),
                const SizedBox(width: 10),
              ],
            ),
            body: TabBarView(children: [
              ListView.builder(
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return  ListTile(
                      leading:const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=400'),
                      ),
                      title: Text('Community ' + index.toString() ),
                      subtitle:const Text('Hello members'),
                      trailing: Icon(Icons.volume_off),
                    );
                  }),
              ListView.builder(
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return const ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=400'),
                      ),
                      title: Text('Scott Adkins'),
                      subtitle: Text('Hey! what\'s up. Hope you doing well.'),
                      trailing: Text('9:30 am'),
                    );
                  }),
              ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    if (index / 2 == 0) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(padding: EdgeInsets.all(8.0)),
                          const Text('New Updates'),
                          ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.green,
                                    width: 3,
                                  )),
                              child: const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=400'),
                              ),
                            ),
                            title: const Text('Scott Adkins'),
                            subtitle: Text(index / 2 == 0
                                ? 'New Update'
                                : '10 minutes ago'),
                          ),
                        ],
                      );
                    } else if (index % 2 == 1) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(padding: EdgeInsets.all(8.0)),
                          const Text('Viewed Updates'),
                          ListTile(
                            leading: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=400'),
                            ),
                            title: const Text('Scott Adkins'),
                            subtitle: Text(index / 2 == 0
                                ? 'New update'
                                : '10 minutes ago'),
                          ),
                        ],
                      );
                    } else {
                      const Text('No status updates today!');
                    }
                    return null;
                  }),
              ListView.builder(
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=400'),
                      ),
                      title: const Text('Scott Adkins'),
                      subtitle: Row(
                        children: [
                          const Icon(
                            Icons.call_received,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 5,
                            child: Text(','),
                          ),
                          Text(index / 2 == 0
                              ? 'you missed audio call'
                              : 'you missed video call'),
                          const SizedBox(
                            width: 5,
                            child: Text(','),
                          ),
                          const Text('9:30 am')
                        ],
                      ),
                      trailing:
                          Icon(index / 2 == 0 ? Icons.phone : Icons.video_call),
                    );
                  }),
            ]),
            floatingActionButton: FloatingActionButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.teal,
              
              onPressed: () {},
              child: const Icon(
                Icons.message,
              
              ),
            ),
          ),
        ),
      ],
    );
  }
}
