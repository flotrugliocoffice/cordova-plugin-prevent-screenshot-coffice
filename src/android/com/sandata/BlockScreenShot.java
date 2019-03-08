package com.sandata;

import android.app.Activity;
import android.view.WindowManager;

import org.apache.cordova.*;
import org.json.JSONArray;
import org.json.JSONException;

public class BlockScreenShot extends CordovaPlugin{
    private com.sandata.BlockScreenShot mContext;

    @Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
        Activity activity = this.cordova.getActivity();
        activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_SECURE);
    }

    @Override
    public boolean execute(String action, JSONArray data, final CallbackContext callbackContext) throws JSONException {
        mContext = this;
        if (action.equals("enable")) {
            mContext.cordova.getActivity().runOnUiThread(new Runnable() {
                public void run() {
                    try{
                        // Allow to make screenshots removing the FLAG_SECURE
                        if(android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.HONEYCOMB) {
                            mContext.cordova.getActivity().getWindow().clearFlags(WindowManager.LayoutParams.FLAG_SECURE);
                        }
                        callbackContext.success("Success");
                    }catch(Exception e){
                        callbackContext.error(e.toString());
                    }
                }
            });

            return true;
        }else if (action.equals("disable")) {
            mContext.cordova.getActivity().runOnUiThread(new Runnable() {
                public void run() {
                    try{
                        // Allow to make screenshots removing the FLAG_SECURE
                        // Disable the creation of screenshots adding the FLAG_SECURE to the window
                        if(android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.HONEYCOMB) {
                            mContext.cordova.getActivity().getWindow().setFlags(WindowManager.LayoutParams.FLAG_SECURE,
                                    WindowManager.LayoutParams.FLAG_SECURE);
                        }
                        callbackContext.success("Success");
                    }catch(Exception e){
                        callbackContext.error(e.toString());
                    }
                }
            });
            return true;
        }
        else{
            return false;
        }

    }

}
