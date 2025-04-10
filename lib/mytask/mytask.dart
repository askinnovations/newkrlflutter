import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl/mytask/addtaskscreen.dart';
import 'package:krl/mytask/taskdetails.dart';
import 'package:krl/utils/colors.dart';

class MyTasksScreen extends StatefulWidget {
  const MyTasksScreen({super.key});

  @override
  State<MyTasksScreen> createState() => _MyTasksScreenState();
}

class _MyTasksScreenState extends State<MyTasksScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> tasks = [
    {
      "title": "Complete UI Design",
      "subtitle": "Due: Today, 5:00 PM",
      "isDone": false,
      "isToday": true,
    },
    {
      "title": "Team Meeting",
      "subtitle": "Due: Today, 3:00 PM",
      "isDone": true,
      "isToday": true,
    },
    {
      "title": "Client Feedback Review",
      "subtitle": "Due: Tomorrow, 6:00 PM",
      "isDone": false,
      "isToday": false,
    },
    {
      "title": "Code Push to Git",
      "subtitle": "Due: Today, 7:00 PM",
      "isDone": false,
      "isToday": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'My Tasks',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: AppColors.btntheamColor,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 48,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: AppColors.btntheamColor,
                borderRadius: BorderRadius.circular(10),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: AppColors.btntheamColor,

              labelStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              unselectedLabelStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [Tab(text: 'Today'), Tab(text: 'All Tasks')],
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                buildTaskList(todayOnly: true),
                buildTaskList(todayOnly: false),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTaskScreen()),
          );

          if (newTask != null && mounted) {
            setState(() {
              tasks.insert(0, newTask as Map<String, dynamic>);
              _tabController.animateTo(0); 
            });
          }
        },

        backgroundColor: AppColors.btntheamColor,
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          "Add Task",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildTaskList({required bool todayOnly}) {
    final filteredTasks =
        todayOnly
            ? tasks.where((task) => task['isToday'] == true).toList()
            : tasks;

    if (filteredTasks.isEmpty) {
      return Center(
        child: Text(
          todayOnly ? 'No tasks for today!' : 'No tasks available!',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredTasks.length,
      itemBuilder: (context, index) {
        final task = filteredTasks[index];
        return buildTaskTile(
          title: task['title'] as String,
          subtitle: task['subtitle'] as String,
          isDone: task['isDone'] as bool,
          context: context,
        );
      },
    );
  }

  Widget buildTaskTile({
    required String title,
    required String subtitle,
    required bool isDone,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => TaskDetailScreen(
                  title: title,
                  subtitle: subtitle,
                  isDone: isDone,
                ),
          ),
        );
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: isDone ? Colors.green : Colors.grey[300],
              child: Icon(
                isDone ? Icons.check : Icons.pending_actions,
                color: isDone ? Colors.white : Colors.black54,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      decoration: isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, color: Colors.grey),
              onSelected: (value) {
                if (value == 'delete') {
                  _deleteTask(title);
                }
              },
              itemBuilder:
                  (BuildContext context) => [
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                  ],
            ),
          ],
        ),
      ),
    );
  }

  void _deleteTask(String title) {
    setState(() {
      tasks.removeWhere((task) => task['title'] == title);
    });
  }
}
