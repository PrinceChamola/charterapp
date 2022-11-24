import 'package:charterapp/bloc/charter/charter_bloc.dart';
import 'package:charterapp/bloc/charter/charter_event.dart';
import 'package:charterapp/bloc/charter/charter_state.dart';
import 'package:charterapp/services/api_providers/charater_api_provider.dart';
import 'package:charterapp/services/models/charter_model.dart';
import 'package:charterapp/utils/constants/ui_helper.dart';
import 'package:charterapp/utils/widgets/app_padding.dart';
import 'package:charterapp/utils/widgets/common_button.dart';
import 'package:charterapp/utils/widgets/common_textfield_widget.dart';
import 'package:charterapp/utils/widgets/cuptertino_switch_button.dart';
import 'package:charterapp/view/search_charter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//this is charterAddScreen
class AddCharterScreen extends StatelessWidget {
  AddCharterScreen({Key? key}) : super(key: key);

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _countryOfResistanceController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _stateController = TextEditingController();
  final _cityController = TextEditingController();
  final _websiteController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharterBloc>(
      create: (context) => CharterBloc(),
      child: Scaffold(
        body: BlocBuilder<CharterBloc, CharterState>(builder: (context, state) {
          return Stack(
            fit: StackFit.expand,
            children: [
              AppPadding.commonAllPadding(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        topViewPadding(context),
                        Row(
                          children: const[
                            Icon(Icons.arrow_back_ios),
                            Spacer(),
                            CupertionSwitchMode()
                          ],
                        ),
                        verticalSpaceMedium,
                        Text(
                          "Add charterer",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        verticalSpaceMedium,
                        CommonTextField(
                          textEditingController: _fullNameController,
                          hintText: "Full Name",
                        ),
                        verticalSpaceSmall,
                        CommonTextField(
                          textEditingController: _emailController,
                          hintText: "Email",
                        ),
                        verticalSpaceSmall,
                        CommonTextField(
                          textEditingController: _countryOfResistanceController,
                          hintText: "Country Of Resistance",
                          suffixIcon: Icon(Icons.arrow_drop_down),
                        ),
                        verticalSpaceSmall,
                        CommonTextField(
                          textEditingController: _mobileNumberController,
                          hintText: "Mobile Number",
                        ),
                        verticalSpaceSmall,
                        CommonTextField(
                          textEditingController: _addressController,
                          hintText: "Address",
                        ),
                        verticalSpaceSmall,
                        CommonTextField(
                          textEditingController: _stateController,
                          hintText: "State",
                        ),
                        verticalSpaceSmall,
                        CommonTextField(
                          textEditingController: _cityController,
                          hintText: "City",
                        ),
                        verticalSpaceSmall,
                        CommonTextField(
                          textEditingController: _websiteController,
                          textInputAction: TextInputAction.done,
                          hintText: "Website",
                        ),
                        verticalSpaceSmall,
                        Row(
                          children: [
                            Text(
                              "Want to search again? ",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: const FractionallySizedBox(
                                          heightFactor: 0.9,
                                          child: SearchCharter()),
                                    );
                                  },
                                );
                              },
                              child: Text("Click here.",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(color: Colors.blue)),
                            )
                          ],
                        ),
                        verticalSpaceMedium,
                        CommonButton(
                          onPressed: () {
                            addCharterValue(context);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              state is Loading
                  ? const Center(child: CircularProgressIndicator())
                  : SizedBox.shrink(),
            ],
          );
        }),
      ),
    );
  }

  void addCharterValue(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      CharterModel model = CharterModel(
          chartererDetails: ChartererDetails(
              name: _fullNameController.text,
              email: _emailController.text,
              address1: _addressController.text,
              state: _stateController.text,
              city: _cityController.text,
              country: _countryOfResistanceController.text,
              website: _websiteController.text,
              contactPerson: "XYZ",
              phoneNumber: _mobileNumberController.text));
      context
          .read<CharterBloc>()
          .add(CharterAddEvent(context: context, model: model));
    }
  }
}
