import 'package:flutter/material.dart';
import 'package:flutter_code_test/constants/plans.dart';
import 'package:flutter_code_test/pages/details_page.dart';
import 'package:flutter_code_test/widgets/plan_view.dart';
import 'package:flutter_code_test/widgets/primary_button.dart';

class PlansPage extends StatefulWidget {
  static const routeName = '/plans';
  const PlansPage({super.key});

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  int selectedIndex = 0;

  bool _loadedInitData = false;
  String planName = "";

  List<Widget> pages = [];

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      _reloadPlan();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _reloadPlan() {
    pages = defaultPlans
        .map((plan) => PlanView(
              plan: plan,
              isSelectedPlan: planName == plan.planName,
              onSelectPlan: (plan) {
                setState(() {
                  planName = plan;
                  _reloadPlan();
                });
              },
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            const Text(
              "Choose your plan",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            PageView(
              controller: controller,
              onPageChanged: (int page) {
                setState(() {
                  selectedIndex = page;
                });
              },
              children: pages,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 36.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: _buildPageIndicator(),
                  ),
                ),
                PrimaryButton(
                  title: "Continue",
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(
                      DetailsPage.routeName,
                      arguments: {
                        'email': arguments['email'],
                        'plan-name': planName,
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < pages.length; i++) {
      list.add(i == selectedIndex ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    Color activeColor = Colors.blue;
    Color inactiveColor = Colors.grey;
    return SizedBox(
      height: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.only(right: 4.0),
        height: 12,
        width: 12,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? activeColor : inactiveColor,
        ),
      ),
    );
  }
}
