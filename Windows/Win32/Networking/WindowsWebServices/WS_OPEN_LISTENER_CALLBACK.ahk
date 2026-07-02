#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_ASYNC_CONTEXT.ahk" { WS_ASYNC_CONTEXT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_STRING.ahk" { WS_STRING }

/**
 * Handles the WsOpenListener call for a WS_CUSTOM_CHANNEL_BINDING.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsopenlistener">WsOpenListener</a> for information about the contract
 *                 of this API.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_open_listener_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_OPEN_LISTENER_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_OPEN_LISTENER_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} listenerInstance The pointer to the state specific to this listener instance,
     *                     as created by the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_create_listener_callback">WS_CREATE_LISTENER_CALLBACK</a>.
     * @param {Pointer<WS_STRING>} url The URL to listen on.  The format and interpretation of the URL
     *                     is defined by the custom listener.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The listener was aborted during the open, or before the open.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The listener is in the incorrect state.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ADDRESS_IN_USE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address is already being used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ADDRESS_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address is not valid for this context.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_TIMED_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not complete within the time allotted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
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
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(listenerInstance, url, asyncContext, _error) {
        listenerInstanceMarshal := listenerInstance is VarRef ? "ptr" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, listenerInstanceMarshal, listenerInstance, WS_STRING.Ptr, url, WS_ASYNC_CONTEXT.Ptr, asyncContext, _errorMarshal, _error, "HRESULT")
        return result
    }

    /**
     * A WS_OPEN_LISTENER_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_OPEN_LISTENER_CALLBACK {
        /**
         * Creates a WS_OPEN_LISTENER_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WS_STRING, WS_ASYNC_CONTEXT, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WS_STRING.Ptr, WS_ASYNC_CONTEXT.Ptr, WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
