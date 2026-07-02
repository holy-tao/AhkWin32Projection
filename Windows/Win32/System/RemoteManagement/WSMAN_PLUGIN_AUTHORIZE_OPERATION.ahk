#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSMAN_SENDER_DETAILS.ahk" { WSMAN_SENDER_DETAILS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Authorizes a specific operation.
 * @remarks
 * The plug-in must call <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginauthzoperationcomplete">WSManPluginAuthzOperationComplete</a> to report either that the user was successfully authorized to perform the operation with <b>NO_ERROR</b> or that the user was not authorized with <b>ERROR_ACCESS_DENIED</b>. All other errors report a failure to the client, but no specific information is reported.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nc-wsman-wsman_plugin_authorize_operation
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_PLUGIN_AUTHORIZE_OPERATION {
    value : IntPtr

    __value {
        set {
            if (value is WSMAN_PLUGIN_AUTHORIZE_OPERATION) {
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
     * @param {Integer} flags Reserved for future use. Must be set to zero.
     * @param {Integer} operation 
     * @param {PWSTR} action 
     * @param {PWSTR} resourceUri Specifies the <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">resource URI</a> of the inbound operation.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pluginContext, senderDetails, flags, operation, action, resourceUri) {
        action := action is String ? StrPtr(action) : action
        resourceUri := resourceUri is String ? StrPtr(resourceUri) : resourceUri

        pluginContextMarshal := pluginContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, pluginContextMarshal, pluginContext, WSMAN_SENDER_DETAILS.Ptr, senderDetails, UInt32, flags, UInt32, operation, "ptr", action, "ptr", resourceUri)
    }

    /**
     * A WSMAN_PLUGIN_AUTHORIZE_OPERATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WSMAN_PLUGIN_AUTHORIZE_OPERATION {
        /**
         * Creates a WSMAN_PLUGIN_AUTHORIZE_OPERATION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WSMAN_SENDER_DETAILS, UInt32, UInt32, PWSTR, PWSTR) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WSMAN_SENDER_DETAILS.Ptr, UInt32, UInt32, PWSTR, PWSTR, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
