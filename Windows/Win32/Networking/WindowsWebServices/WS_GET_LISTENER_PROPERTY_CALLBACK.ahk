#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import ".\WS_LISTENER_PROPERTY_ID.ahk" { WS_LISTENER_PROPERTY_ID }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Handles the WsGetListenerProperty call for a WS_CUSTOM_CHANNEL_BINDING.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetlistenerproperty">WsGetListenerProperty</a> for information about the contract
 *                 of this API.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_get_listener_property_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_GET_LISTENER_PROPERTY_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_GET_LISTENER_PROPERTY_CALLBACK) {
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
     * @param {WS_LISTENER_PROPERTY_ID} id The id of the property to retrieve.
     *                 
     * 
     * A custom listener can decide which properties to support.
     * @param {Integer} value The location to store the retrieved property.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The number of bytes allocated by the caller to
     *                     store the retrieved property.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property id was not supported for this object or the specified buffer was not large enough for the value.
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
    Call(listenerInstance, id, value, valueSize, _error) {
        listenerInstanceMarshal := listenerInstance is VarRef ? "ptr" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, listenerInstanceMarshal, listenerInstance, WS_LISTENER_PROPERTY_ID, id, IntPtr, value, UInt32, valueSize, _errorMarshal, _error, "HRESULT")
        return result
    }

    /**
     * A WS_GET_LISTENER_PROPERTY_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_GET_LISTENER_PROPERTY_CALLBACK {
        /**
         * Creates a WS_GET_LISTENER_PROPERTY_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WS_LISTENER_PROPERTY_ID, IntPtr, UInt32, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WS_LISTENER_PROPERTY_ID, IntPtr, UInt32, WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
