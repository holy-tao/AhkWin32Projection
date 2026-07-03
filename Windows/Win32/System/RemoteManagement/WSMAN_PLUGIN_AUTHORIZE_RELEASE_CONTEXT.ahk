#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Releases the context that a plug-in reports from either WSManPluginAuthzUserComplete or WSManPluginAuthzOperationComplete.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nc-wsman-wsman_plugin_authorize_release_context
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_PLUGIN_AUTHORIZE_RELEASE_CONTEXT {
    value : IntPtr

    __value {
        set {
            if (value is WSMAN_PLUGIN_AUTHORIZE_RELEASE_CONTEXT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} userAuthorizationContext Specifies the context that was returned by either <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginauthzusercomplete">WSManPluginAuthzUserComplete</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginauthzoperationcomplete">WSManPluginAuthzOperationComplete</a>.  If these methods return no context, this method will not be called.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(userAuthorizationContext) {
        userAuthorizationContextMarshal := userAuthorizationContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, userAuthorizationContextMarshal, userAuthorizationContext)
    }

    /**
     * A WSMAN_PLUGIN_AUTHORIZE_RELEASE_CONTEXT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WSMAN_PLUGIN_AUTHORIZE_RELEASE_CONTEXT {
        /**
         * Creates a WSMAN_PLUGIN_AUTHORIZE_RELEASE_CONTEXT pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
