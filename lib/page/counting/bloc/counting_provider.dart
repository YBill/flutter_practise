import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counting_bloc.dart';
import 'counting_view.dart';

final countingProvider = BlocProvider(create: (BuildContext context) => CountingBloc(), child: const CountingView());
