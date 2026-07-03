#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_CHANNEL_TYPE.ahk" { WS_CHANNEL_TYPE }
#Import ".\WS_ERROR.ahk" { WS_ERROR }

/**
 * Handles the WsCreateChannel call for a WS_CUSTOM_CHANNEL_BINDING.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_create_channel_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CREATE_CHANNEL_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_CREATE_CHANNEL_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {WS_CHANNEL_TYPE} _channelType The message exchange pattern of the channel.
     *                 
     * 
     * If the type of channel is not supported by the custom
     *                     channel implementation,  <b>E_INVALIDARG</b> should be returned.
     * @param {Integer} channelParameters The pointer to the value that was specified by the
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_CUSTOM_CHANNEL_PARAMETERS</a> property when the custom channel is created using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannel">WsCreateChannel</a>.
     *                 
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_CUSTOM_CHANNEL_PARAMETERS</a> property was not specified, the value will be <b>NULL</b>.
     * @param {Integer} channelParametersSize The size in bytes of the value pointed to by channelParameters.
     *                 
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_CUSTOM_CHANNEL_PARAMETERS</a> property was not specified, the size will be 0.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {Pointer<Void>} A pointer to a structure allocated by the callback 
     *                     that contains the data specific to this channel instance.  This pointer
     *                     will be passed to all the other channel callbacks
     *                     for this particular channel instance.
     *                 
     * 
     * If this callback is successful, then the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_free_channel_callback">WS_FREE_CHANNEL_CALLBACK</a> will be used to free the channel instance returned
     *                     in this parameter.
     */
    Call(_channelType, channelParameters, channelParametersSize, _error) {
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, WS_CHANNEL_TYPE, _channelType, IntPtr, channelParameters, UInt32, channelParametersSize, "ptr*", &channelInstance := 0, _errorMarshal, _error, "HRESULT")
        return channelInstance
    }

    /**
     * A WS_CREATE_CHANNEL_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_CREATE_CHANNEL_CALLBACK {
        /**
         * Creates a WS_CREATE_CHANNEL_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(WS_CHANNEL_TYPE, IntPtr, UInt32, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WS_CHANNEL_TYPE, IntPtr, UInt32, WS_ERROR.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
