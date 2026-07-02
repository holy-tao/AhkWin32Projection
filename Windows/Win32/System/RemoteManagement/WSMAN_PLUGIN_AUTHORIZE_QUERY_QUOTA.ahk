#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSMAN_SENDER_DETAILS.ahk" { WSMAN_SENDER_DETAILS }

/**
 * Retrieves quota information for the user after a connection has been authorized.
 * @remarks
 * The quota is queried on the first call by a particular user and will not be requeried until after the user record times out due to an idle time-out of activity or until a system-wide configuration period is exceeded.
 * 
 * The plug-in must call the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginauthzqueryquotacomplete">WSManPluginAuthzQueryQuotaComplete</a> function to terminate the operation whether or not the plug-in can carry out the request. If successful, the plug-in should give a set of quota information that is relevant for this particular user. If the plug-in fails to process the request for any reason,  an appropriate error should be recorded through the callback method and the error will get propagated back to the client as a Simple Object Access Protocol (SOAP) fault if possible; otherwise, the error will be an empty HTTP 500 status error.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nc-wsman-wsman_plugin_authorize_query_quota
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_PLUGIN_AUTHORIZE_QUERY_QUOTA {
    value : IntPtr

    __value {
        set {
            if (value is WSMAN_PLUGIN_AUTHORIZE_QUERY_QUOTA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pluginContext Specifies the context that was returned by a call to <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_startup">WSManPluginStartup</a>. This parameter represents a specific application initialization of a WinRM plug-in.
     * @param {Pointer<WSMAN_SENDER_DETAILS>} senderDetails A pointer  to the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_sender_details">WSMAN_SENDER_DETAILS</a> structure that specifies the identification information of the user.
     * @param {Integer} flags Reserved for future use. Must be zero.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pluginContext, senderDetails, flags) {
        pluginContextMarshal := pluginContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, pluginContextMarshal, pluginContext, WSMAN_SENDER_DETAILS.Ptr, senderDetails, UInt32, flags)
    }

    /**
     * A WSMAN_PLUGIN_AUTHORIZE_QUERY_QUOTA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WSMAN_PLUGIN_AUTHORIZE_QUERY_QUOTA {
        /**
         * Creates a WSMAN_PLUGIN_AUTHORIZE_QUERY_QUOTA pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WSMAN_SENDER_DETAILS, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WSMAN_SENDER_DETAILS.Ptr, UInt32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
