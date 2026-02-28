import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_krustypos/core/assets/assets.gen.dart';
import 'package:flutter_krustypos/core/constants/colors.dart';
import 'package:flutter_krustypos/core/extensions/build_context_ext.dart';
import 'package:flutter_krustypos/data/datasource/auth_local_datasource.dart';
import 'package:flutter_krustypos/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_krustypos/presentation/auth/login_page.dart';
import 'package:flutter_krustypos/presentation/home/pages/home_page.dart';
import 'package:flutter_krustypos/presentation/home/widgets/nav_item.dart';
import 'package:flutter_krustypos/presentation/settings/pages/widgets/sync_data_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    const Center(child: Text('Screen 2')),
    const Center(child: Text('Screen 3')),
    const SyncDataPage(),
  ];

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            SingleChildScrollView(
              child: ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(16.0),
                ),
                child: SizedBox(
                  height: context.deviceHeight - 20.0,
                  child: ColoredBox(
                    color: AppColors.primary,
                    child: Column(
                      children: [
                        NavItem(
                          iconPath: Assets.icons.homeResto.path,
                          isActive: _selectedIndex == 0,
                          onTap: () => _onItemTapped(0),
                        ),
                        NavItem(
                          iconPath: Assets.icons.discount.path,
                          isActive: _selectedIndex == 1,
                          onTap: () => _onItemTapped(1),
                        ),
                        NavItem(
                          iconPath: Assets.icons.dashboard.path,
                          isActive: _selectedIndex == 2,
                          onTap: () => _onItemTapped(2),
                        ),
                        NavItem(
                          iconPath: Assets.icons.setting.path,
                          isActive: _selectedIndex == 3,
                          onTap: () => _onItemTapped(3),
                        ),

                        BlocListener<LogoutBloc, LogoutState>(
                          listener: (context, state) {
                            state.maybeMap(
                              orElse: () {},
                              error: (err) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(err.message),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              },
                              success: (value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Logout Success"),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                            );
                          },
                          child: NavItem(
                            iconPath: Assets.icons.logout.path,
                            isActive: false,
                            onTap: () {
                              print("anda mencet logout");
                              context.read<LogoutBloc>().add(
                                const LogoutEvent.logout(),
                              );
                              AuthLocalDatasource().removeAuthData();
                            },
                          ),
                          // child: ElevatedButton(
                          //   onPressed: () {
                          //     context.read<LogoutBloc>().add(
                          //       const LogoutEvent.logout(),
                          //     );
                          //     AuthLocalDatasource().removeAuthData();
                          //   },
                          //   child: Text("Logout"),
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _pages[_selectedIndex],
            ),
          ],
        ),
      ),
    );
  }
}
