import 'package:charterapp/bloc/charter/charter_bloc.dart';
import 'package:charterapp/bloc/charter/charter_event.dart';
import 'package:charterapp/bloc/charter/charter_state.dart';
import 'package:charterapp/services/api_providers/charater_api_provider.dart';
import 'package:charterapp/utils/constants/strings.dart';
import 'package:charterapp/utils/constants/ui_helper.dart';
import 'package:charterapp/utils/theme/colors.dart';
import 'package:charterapp/utils/widgets/app_padding.dart';
import 'package:charterapp/view/add_charter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//this is charterSearchScreen
class SearchCharter extends StatelessWidget {
  const SearchCharter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharterBloc(),
      child: BlocBuilder<CharterBloc, CharterState>(builder: (context, state) {
        return DecoratedBox(
          decoration:  BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AppPadding.commonAllPadding(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 5,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.5),
                          color: const Color(0xffC6EBF6)),
                    ),
                  ),
                  Text(
                    "Charterer",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  verticalSpaceSmall,
                  searchTextFormField(context: context),
                  verticalSpaceMedium,
                  if (state is CharterSearchState)
                    Container(
                      constraints: const BoxConstraints(
                        minWidth: double.infinity,
                        maxHeight: 400,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0; i < state.data.data!.length; i++) ...[
                              state.data.data != null
                                  ? Padding(
                                      padding: EdgeInsets.all(14),
                                      child: Text(
                                        state.data.data![i].chartererName!,
                                        style:
                                            Theme.of(context).textTheme.headline3,
                                      ),
                                    )
                                  : SizedBox.shrink()
                            ]
                          ],
                        ),
                      ),
                    )
                  else
                    const SizedBox.shrink(),
                  verticalSpaceMedium,
                  Row(
                    children: [
                      Text(
                        kStringCantFindCharter,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddCharterScreen()));
                        },
                        child: Text(kStringAddNow,
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(color: Colors.blue)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget searchTextFormField({required BuildContext context}) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        onChanged: (value) {
          if (value != null) {
            context.read<CharterBloc>().add(SearchCharterEvent(value: value));
          }
        },
        style: TextStyle(color: Theme.of(context).primaryColor),
        decoration: InputDecoration(
            fillColor: Theme.of(context).cardColor,
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            suffixIcon: Icon(
              Icons.search,
              color: kIconLightColor,
            )),
      ),
    );
  }
}
