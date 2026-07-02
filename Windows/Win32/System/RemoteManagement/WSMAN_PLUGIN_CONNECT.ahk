#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSMAN_DATA.ahk" { WSMAN_DATA }
#Import ".\WSMAN_PLUGIN_REQUEST.ahk" { WSMAN_PLUGIN_REQUEST }

/**
 * Defines the connect callback for a plug-in.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nc-wsman-wsman_plugin_connect
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_PLUGIN_CONNECT {
    value : IntPtr

    __value {
        set {
            if (value is WSMAN_PLUGIN_CONNECT) {
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
     * @param {Integer} flags Reserved for future use. Must be set to zero.
     * @param {Pointer<Void>} shellContext Specifies the context returned from creating the shell for which this connection request needs to be 
     *       associated.
     * @param {Pointer<Void>} commandContext If this request is aimed at a command and not a shell, this is the context returned from the 
     *       <b>winrm create</b> operation;  otherwise, this parameter is <b>NULL</b>.
     * @param {Pointer<WSMAN_DATA>} inboundConnectInformation A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_data">WSMAN_DATA</a> structure that specifies an 
     *       optional inbound object that contains extra data for the connection.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(requestDetails, flags, shellContext, commandContext, inboundConnectInformation) {
        shellContextMarshal := shellContext is VarRef ? "ptr" : "ptr"
        commandContextMarshal := commandContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, WSMAN_PLUGIN_REQUEST.Ptr, requestDetails, UInt32, flags, shellContextMarshal, shellContext, commandContextMarshal, commandContext, WSMAN_DATA.Ptr, inboundConnectInformation)
    }

    /**
     * A WSMAN_PLUGIN_CONNECT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WSMAN_PLUGIN_CONNECT {
        /**
         * Creates a WSMAN_PLUGIN_CONNECT pointer that invokes the given AHK function when called.
         * @param {Func(WSMAN_PLUGIN_REQUEST, UInt32, "ptr", "ptr", WSMAN_DATA) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WSMAN_PLUGIN_REQUEST.Ptr, UInt32, "ptr", "ptr", WSMAN_DATA.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
