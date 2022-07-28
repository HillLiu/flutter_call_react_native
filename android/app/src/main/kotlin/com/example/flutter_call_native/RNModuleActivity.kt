package com.example.flutter_call_native

import android.app.Activity
import android.os.Bundle
import android.view.KeyEvent
import com.facebook.react.ReactInstanceManager
import com.facebook.react.ReactRootView
import com.facebook.react.common.LifecycleState
import com.facebook.react.modules.core.DefaultHardwareBackBtnHandler
import com.facebook.react.shell.MainReactPackage
import com.facebook.soloader.SoLoader


class RNModuleActivity : Activity(), DefaultHardwareBackBtnHandler {
  private var mReactRootView: ReactRootView? = null
  private var mReactInstanceManager: ReactInstanceManager? = null

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    SoLoader.init(this, false)

    // If not, navigation.goBack() not working
    mReactRootView = ReactRootView(this);
    mReactInstanceManager = ReactInstanceManager.builder()
        .setApplication(application)
        .setCurrentActivity(this)
        .setBundleAssetName("index.android.bundle")
        .setJSMainModulePath("index")
        .addPackage(MainReactPackage())
        .setUseDeveloperSupport(BuildConfig.DEBUG)
        .setInitialLifecycleState(LifecycleState.RESUMED)
        .build()

    // Send message from native code
    val initialProperties = Bundle()
    initialProperties.putString("message_from_native", intent?.extras?.get("message_from_native")?.toString())

    val mLaunchOptions = Bundle()
    mLaunchOptions.putString("foo", "bar") 

    mReactRootView?.startReactApplication(mReactInstanceManager, "MyReactNativeApp", mLaunchOptions)
    setContentView(mReactRootView)
  }

  override fun invokeDefaultOnBackPressed() {
    super.onBackPressed()
  }

  override fun onPause() {
    super.onPause()
    mReactInstanceManager?.onHostPause(this)
  }

  override fun onResume() {
    super.onResume()
    mReactInstanceManager?.onHostResume(this, this)
  }

  override fun onDestroy() {
    super.onDestroy()
    mReactInstanceManager?.onHostDestroy(this)
    mReactRootView?.unmountReactApplication()
  }

  override fun onBackPressed() {
    if (mReactInstanceManager != null) {
      mReactInstanceManager!!.onBackPressed()
    } else {
      super.onBackPressed()
    }
  }

  override fun onKeyUp(keyCode: Int, event: KeyEvent): Boolean {
    if (keyCode == KeyEvent.KEYCODE_MENU) {
      mReactInstanceManager?.showDevOptionsDialog()
      return true
    }
    return super.onKeyUp(keyCode, event)
  }
}
