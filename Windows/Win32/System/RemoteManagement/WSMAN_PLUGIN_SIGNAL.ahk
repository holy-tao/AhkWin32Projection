#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSMAN_PLUGIN_REQUEST.ahk" { WSMAN_PLUGIN_REQUEST }

/**
 * Defines the signal callback for a plug-in.
 * @remarks
 * A signal can be received for processing a CTRL+C sequence or one of many other types of custom signals. The 
 *     callback is called once for each signal that is received. The plug-in determines which signals cause commands 
 *     and/or shells to be shut down. Because signals are shell-specific, the plug-in must initiate the shutdown by 
 *     calling the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginoperationcomplete">WSManPluginOperationComplete</a> method. For 
 *     each call, the plug-in should call 
 *     <b>WSManPluginOperationComplete</b> to 
 *     acknowledge receipt and to allow the next signal to be received.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nc-wsman-wsman_plugin_signal
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_PLUGIN_SIGNAL {
    value : IntPtr

    __value {
        set {
            if (value is WSMAN_PLUGIN_SIGNAL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WSMAN_PLUGIN_REQUEST>} requestDetails A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_plugin_request">WSMAN_PLUGIN_REQUEST</a> 
     *       structure that specifies the resource URI, options, locale, shutdown flag, and handle for the request.
     * @param {Integer} flags Reserved for future use. Must be zero.
     * @param {Pointer<Void>} shellContext Specifies the context that was received when the shell was created.
     * @param {Pointer<Void>} commandContext If this request is aimed at a command and not a shell, this is the context returned from the 
     *       <b>winrm create</b> operation;  otherwise, this parameter is <b>NULL</b>.
     * @param {PWSTR} code Specifies the signal that is received from the client. The following codes are common.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(requestDetails, flags, shellContext, commandContext, code) {
        code := code is String ? StrPtr(code) : code

        shellContextMarshal := shellContext is VarRef ? "ptr" : "ptr"
        commandContextMarshal := commandContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, WSMAN_PLUGIN_REQUEST.Ptr, requestDetails, UInt32, flags, shellContextMarshal, shellContext, commandContextMarshal, commandContext, "ptr", code)
    }

    /**
     * A WSMAN_PLUGIN_SIGNAL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WSMAN_PLUGIN_SIGNAL {
        /**
         * Creates a WSMAN_PLUGIN_SIGNAL pointer that invokes the given AHK function when called.
         * @param {Func(WSMAN_PLUGIN_REQUEST, UInt32, "ptr", "ptr", PWSTR) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WSMAN_PLUGIN_REQUEST.Ptr, UInt32, "ptr", "ptr", PWSTR, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
