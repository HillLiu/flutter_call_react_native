package com.example.flutter_call_react_native

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.*
import android.content.Intent

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        // Creates a MethodChannel as soon as the FlutterEngine is attached to
        // the Activity, and registers a MethodCallHandler. The Method.setMethodCallHandler
        // is responsible to register a MethodCallHandler to handle the incoming calls.

        // The call parameter of MethodCallHandler has information about the incoming call,
        // like method name, and arguments. The result parameter of MethodCallHandler is
        // responsible to send the results of the call.
        MethodChannel(flutterEngine.dartExecutor, "methodChannelDemo")
                .setMethodCallHandler { call, result ->
                    val state: Int? = call.argument<Int>("state")

                    if (state == null) {
                        result.error("INVALID ARGUMENT", "Value of state cannot be null", null)
                    } else {
                        when (call.method) {
                            "goToReact" -> {
                                val intent = Intent(this@MainActivity, RNModuleActivity::class.java)
                                startActivity(intent)
                                result.success(state)
                            }
                            else -> result.notImplemented()
                        }
                    }
                }
    }
}
