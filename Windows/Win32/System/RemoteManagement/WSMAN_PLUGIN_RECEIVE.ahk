#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSMAN_PLUGIN_REQUEST.ahk" { WSMAN_PLUGIN_REQUEST }
#Import ".\WSMAN_STREAM_ID_SET.ahk" { WSMAN_STREAM_ID_SET }

/**
 * Defines the receive callback for a plug-in.
 * @remarks
 * Based on the client request, the <b>WSMAN_PLUGIN_RECEIVE</b> callback function can be called against the shell and/or the command. The plug-in calls the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginreceiveresult">WSManPluginReceiveResult</a> method for each piece of data that needs to be sent back to the client. After all of the data has been sent, the plug-in calls <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginoperationcomplete">WSManPluginOperationComplete</a> to end the stream. All parameters passed in are valid until the Windows Remote Management (WinRM) plug-in calls <b>WSManPluginOperationComplete</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nc-wsman-wsman_plugin_receive
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_PLUGIN_RECEIVE {
    value : IntPtr

    __value {
        set {
            if (value is WSMAN_PLUGIN_RECEIVE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WSMAN_PLUGIN_REQUEST>} requestDetails A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_plugin_request">WSMAN_PLUGIN_REQUEST</a> structure that specifies the resource URI, options, locale, shutdown flag, and handle for the request.
     * @param {Integer} flags Reserved for future use. Must be zero.
     * @param {Pointer<Void>} shellContext Specifies the context that was received when the shell was created.
     * @param {Pointer<Void>} commandContext If this request is aimed at a command and not a shell, this is the context returned from the <b>winrm create</b> operation;  otherwise, this parameter is <b>NULL</b>.
     * @param {Pointer<WSMAN_STREAM_ID_SET>} streamSet A <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_stream_id_set">WSMAN_STREAM_ID_SET</a> structure that contains a list of streams for which  data is to be received.  If this list is empty, all streams that were configured in the shell are implied, which means  that all streams are available.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(requestDetails, flags, shellContext, commandContext, streamSet) {
        shellContextMarshal := shellContext is VarRef ? "ptr" : "ptr"
        commandContextMarshal := commandContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, WSMAN_PLUGIN_REQUEST.Ptr, requestDetails, UInt32, flags, shellContextMarshal, shellContext, commandContextMarshal, commandContext, WSMAN_STREAM_ID_SET.Ptr, streamSet)
    }

    /**
     * A WSMAN_PLUGIN_RECEIVE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WSMAN_PLUGIN_RECEIVE {
        /**
         * Creates a WSMAN_PLUGIN_RECEIVE pointer that invokes the given AHK function when called.
         * @param {Func(WSMAN_PLUGIN_REQUEST, UInt32, "ptr", "ptr", WSMAN_STREAM_ID_SET) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WSMAN_PLUGIN_REQUEST.Ptr, UInt32, "ptr", "ptr", WSMAN_STREAM_ID_SET.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
