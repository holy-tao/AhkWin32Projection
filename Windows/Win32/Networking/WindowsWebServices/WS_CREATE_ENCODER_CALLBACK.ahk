#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_WRITE_CALLBACK.ahk" { WS_WRITE_CALLBACK }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Handles creating an encoder instance.
 * @remarks
 * The channel will create encoder instances as necessary.  Each encoder
 *               instance will be called in a single-threaded fashion.  A single encoder
 *               instance however should not assume that it will see all messages from a
 *               channel, as the channel may use multiple encoder instances for processing
 *               messages.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_create_encoder_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CREATE_ENCODER_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_CREATE_ENCODER_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} createContext The createContext that was specified in the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_channel_encoder">WS_CHANNEL_ENCODER</a> used during channel creation.
     * @param {Pointer<WS_WRITE_CALLBACK>} writeCallback The function that should be used to write the message data.  This callback
     *                   should only be used in response to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_encoder_start_callback">WS_ENCODER_START_CALLBACK</a>,
     *                   <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_encoder_encode_callback">WS_ENCODER_ENCODE_CALLBACK</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_encoder_end_callback">WS_ENCODER_END_CALLBACK</a> callbacks.
     * @param {Pointer<Void>} writeContext The write context that should be passed to the provided <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_write_callback">WS_WRITE_CALLBACK</a>.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {Pointer<Void>} Returns the encoder instance.  This value will be
     *                     passed to all of the encoder callbacks.
     */
    Call(createContext, writeCallback, writeContext, _error) {
        createContextMarshal := createContext is VarRef ? "ptr" : "ptr"
        writeContextMarshal := writeContext is VarRef ? "ptr" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, createContextMarshal, createContext, WS_WRITE_CALLBACK, writeCallback, writeContextMarshal, writeContext, "ptr*", &encoderContext := 0, _errorMarshal, _error, "HRESULT")
        return encoderContext
    }

    /**
     * A WS_CREATE_ENCODER_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_CREATE_ENCODER_CALLBACK {
        /**
         * Creates a WS_CREATE_ENCODER_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WS_WRITE_CALLBACK, "ptr", WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WS_WRITE_CALLBACK, "ptr", WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
