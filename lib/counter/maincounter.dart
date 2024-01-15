import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omarahmed_cubit/counter/counter_cubit.dart';



class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(

                backgroundColor: Theme
                    .of(context)
                    .colorScheme
                    .inversePrimary,

                title: Text(title),
              ),
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () {
                      CounterCubit.get(context).increment();
                    }, child: Text('Increment')),
                    SizedBox(width: 20,),
                    Text('${CounterCubit.get(context).counter}'),
                    SizedBox(width: 20,),
                    TextButton(onPressed: () {
                      CounterCubit.get(context).decrement();
                    }, child: Text('Decrement')),
                  ],
                ),
              )
          );
        },
      ),
    );
  }
}
