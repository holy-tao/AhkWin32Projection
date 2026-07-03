#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_ASYNC_CONTEXT.ahk" { WS_ASYNC_CONTEXT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }

/**
 * Decodes a message.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_decoder_decode_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_DECODER_DECODE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_DECODER_DECODE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} encoderContext The decoder instance returned by the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_create_decoder_callback">WS_CREATE_DECODER_CALLBACK</a>.
     * @param {Integer} _buffer The buffer to read into.
     * @param {Integer} maxLength The maximum number of bytes to read.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} The number of bytes read should be returned here.
     *               
     * 
     * The number of bytes should be set to 0 when there are no more bytes left.  This indicates
     *                  the end of the decoded message data, and will cause <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_decoder_end_callback">WS_DECODER_END_CALLBACK</a> to
     *                  be invoked.
     */
    Call(encoderContext, _buffer, maxLength, asyncContext, _error) {
        encoderContextMarshal := encoderContext is VarRef ? "ptr" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, encoderContextMarshal, encoderContext, IntPtr, _buffer, UInt32, maxLength, "uint*", &length := 0, WS_ASYNC_CONTEXT.Ptr, asyncContext, _errorMarshal, _error, "HRESULT")
        return length
    }

    /**
     * A WS_DECODER_DECODE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_DECODER_DECODE_CALLBACK {
        /**
         * Creates a WS_DECODER_DECODE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr, UInt32, WS_ASYNC_CONTEXT, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, UInt32, WS_ASYNC_CONTEXT.Ptr, WS_ERROR.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
