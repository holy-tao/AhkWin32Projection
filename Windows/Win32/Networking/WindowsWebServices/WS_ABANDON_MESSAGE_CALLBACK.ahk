#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_MESSAGE.ahk" { WS_MESSAGE }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Handles the WsAbandonMessage call for a WS_CUSTOM_CHANNEL_BINDING.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsabandonmessage">WsAbandonMessage</a> for information about the contract
 *                 of this API.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_abandon_message_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_ABANDON_MESSAGE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_ABANDON_MESSAGE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} channelInstance Pointer to the state specific to this channel instance,
     *                     as created by the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_create_channel_callback">WS_CREATE_CHANNEL_CALLBACK</a>.
     * @param {Pointer<WS_MESSAGE>} message The message that is current being read or written.  This should be
     *                     the same message as was passed to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritemessagestart">WsWriteMessageStart</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadmessagestart">WsReadMessageStart</a>.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This is returned if the channel is not in the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_state">WS_CHANNEL_STATE_OPEN</a> state or the <b>WS_CHANNEL_STATE_FAULTED</b> state.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified message is not currently being read or written using the channel.
     *                 
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(channelInstance, message, _error) {
        channelInstanceMarshal := channelInstance is VarRef ? "ptr" : "ptr"
        messageMarshal := message is VarRef ? "ptr*" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, channelInstanceMarshal, channelInstance, messageMarshal, message, _errorMarshal, _error, "HRESULT")
        return result
    }

    /**
     * A WS_ABANDON_MESSAGE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_ABANDON_MESSAGE_CALLBACK {
        /**
         * Creates a WS_ABANDON_MESSAGE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WS_MESSAGE, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WS_MESSAGE.Ptr, WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
