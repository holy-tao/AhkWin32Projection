#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_READ_CALLBACK.ahk" { WS_READ_CALLBACK }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Handles creating a decoder instance.
 * @remarks
 * The channel will create decoder instances as necessary.  Each decoder
 *                instance will be called in a single-threaded fashion.  A single decoder 
 *                instance however should not assume that it will see all messages from a
 *                channel, as the channel may use multiple decoder instances for processing
 *                messages.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_create_decoder_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CREATE_DECODER_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_CREATE_DECODER_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} createContext The createContext that was specified in the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_channel_decoder">WS_CHANNEL_DECODER</a> used during channel creation.
     * @param {Pointer<WS_READ_CALLBACK>} readCallback The function that should be used to read the message data.  This callback
     *                     should only be used in response to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_decoder_start_callback">WS_DECODER_START_CALLBACK</a>,
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_decoder_decode_callback">WS_DECODER_DECODE_CALLBACK</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_decoder_end_callback">WS_DECODER_END_CALLBACK</a> 
     *                     callbacks.
     * @param {Pointer<Void>} readContext The read context that should be passed to the provided <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_read_callback">WS_READ_CALLBACK</a>.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {Pointer<Void>} Returns the decoder instance.  This value will be
     *                     passed to all of the decoder callbacks.
     */
    Call(createContext, readCallback, readContext, _error) {
        createContextMarshal := createContext is VarRef ? "ptr" : "ptr"
        readContextMarshal := readContext is VarRef ? "ptr" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, createContextMarshal, createContext, WS_READ_CALLBACK, readCallback, readContextMarshal, readContext, "ptr*", &decoderContext := 0, _errorMarshal, _error, "HRESULT")
        return decoderContext
    }

    /**
     * A WS_CREATE_DECODER_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_CREATE_DECODER_CALLBACK {
        /**
         * Creates a WS_CREATE_DECODER_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WS_READ_CALLBACK, "ptr", WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WS_READ_CALLBACK, "ptr", WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
