#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSMAN_DATA.ahk" { WSMAN_DATA }
#Import ".\WSMAN_PLUGIN_REQUEST.ahk" { WSMAN_PLUGIN_REQUEST }

/**
 * Defines the send callback for a plug-in.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nc-wsman-wsman_plugin_send
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_PLUGIN_SEND {
    value : IntPtr

    __value {
        set {
            if (value is WSMAN_PLUGIN_SEND) {
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
     * @param {Integer} flags If this is the last object for the stream, this parameter is set to <b>WSMAN_FLAG_NO_MORE_DATA</b>.
     * Otherwise, it is set to zero.
     * @param {Pointer<Void>} shellContext Specifies the context that was received when the shell was created.
     * @param {Pointer<Void>} commandContext If this request is aimed at a command and not a shell, this is the context returned from the <b>winrm create</b> operation;  otherwise, this parameter is <b>NULL</b>.
     * @param {PWSTR} stream Specifies the stream that is associated with the inbound object.
     * @param {Pointer<WSMAN_DATA>} inboundData A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_data">WSMAN_DATA</a> structure that contains data being sent to the specified stream. It is in the form of binary data.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(requestDetails, flags, shellContext, commandContext, stream, inboundData) {
        stream := stream is String ? StrPtr(stream) : stream

        shellContextMarshal := shellContext is VarRef ? "ptr" : "ptr"
        commandContextMarshal := commandContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, WSMAN_PLUGIN_REQUEST.Ptr, requestDetails, UInt32, flags, shellContextMarshal, shellContext, commandContextMarshal, commandContext, "ptr", stream, WSMAN_DATA.Ptr, inboundData)
    }

    /**
     * A WSMAN_PLUGIN_SEND that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WSMAN_PLUGIN_SEND {
        /**
         * Creates a WSMAN_PLUGIN_SEND pointer that invokes the given AHK function when called.
         * @param {Func(WSMAN_PLUGIN_REQUEST, UInt32, "ptr", "ptr", PWSTR, WSMAN_DATA) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WSMAN_PLUGIN_REQUEST.Ptr, UInt32, "ptr", "ptr", PWSTR, WSMAN_DATA.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
