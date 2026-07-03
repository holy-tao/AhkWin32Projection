#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_CHANNEL_TYPE.ahk" { WS_CHANNEL_TYPE }
#Import ".\WS_ERROR.ahk" { WS_ERROR }

/**
 * Handles the WsCreateListener call for a WS_CUSTOM_CHANNEL_BINDING.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_create_listener_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CREATE_LISTENER_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_CREATE_LISTENER_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {WS_CHANNEL_TYPE} _channelType The type of channel the listener listens for.
     * @param {Integer} listenerParameters The pointer to the value that was specified by the
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_property_id">WS_LISTENER_PROPERTY_CUSTOM_LISTENER_PARAMETERS</a> property when the custom listener is created using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatelistener">WsCreateListener</a>.
     *                 
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_property_id">WS_LISTENER_PROPERTY_CUSTOM_LISTENER_PARAMETERS</a> property was not specified, the value will be <b>NULL</b>.
     * @param {Integer} listenerParametersSize The size in bytes of the value pointed to by listenerParameters.
     *                 
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_property_id">WS_LISTENER_PROPERTY_CUSTOM_LISTENER_PARAMETERS</a> property was not specified, the size will be 0.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {Pointer<Void>} A pointer to an allocated structure that represents
     *                     the listener instance.  This pointer
     *                     will be passed to all the other listener callbacks
     *                     for this particular listener instance.
     *                 
     * 
     * If this callback is successful, then the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_free_listener_callback">WS_FREE_LISTENER_CALLBACK</a> will be used to free the listener instance.
     */
    Call(_channelType, listenerParameters, listenerParametersSize, _error) {
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, WS_CHANNEL_TYPE, _channelType, IntPtr, listenerParameters, UInt32, listenerParametersSize, "ptr*", &listenerInstance := 0, _errorMarshal, _error, "HRESULT")
        return listenerInstance
    }

    /**
     * A WS_CREATE_LISTENER_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_CREATE_LISTENER_CALLBACK {
        /**
         * Creates a WS_CREATE_LISTENER_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(WS_CHANNEL_TYPE, IntPtr, UInt32, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WS_CHANNEL_TYPE, IntPtr, UInt32, WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
