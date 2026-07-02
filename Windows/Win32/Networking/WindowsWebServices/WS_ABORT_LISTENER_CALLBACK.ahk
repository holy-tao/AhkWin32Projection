#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Handles the WsAbortListener call for a WS_CUSTOM_CHANNEL_BINDING.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsabortlistener">WsAbortListener</a> for information about the contract
 *                 of this API.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_abort_listener_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_ABORT_LISTENER_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_ABORT_LISTENER_CALLBACK) {
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
     * The listener was in an inappropriate state.
     *                 
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(listenerInstance, _error) {
        listenerInstanceMarshal := listenerInstance is VarRef ? "ptr" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, listenerInstanceMarshal, listenerInstance, _errorMarshal, _error, "HRESULT")
        return result
    }

    /**
     * A WS_ABORT_LISTENER_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_ABORT_LISTENER_CALLBACK {
        /**
         * Creates a WS_ABORT_LISTENER_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
