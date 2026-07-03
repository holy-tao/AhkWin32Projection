#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_ASYNC_CONTEXT.ahk" { WS_ASYNC_CONTEXT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import ".\WS_WRITE_CALLBACK.ahk" { WS_WRITE_CALLBACK }

/**
 * Used by the WsPushBytes function to request that data be written.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_push_bytes_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_PUSH_BYTES_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_PUSH_BYTES_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} callbackState A 
     *            void pointer to the user-defined state that was passed to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wspushbytes">WsPushBytes</a>.
     * @param {Pointer<WS_WRITE_CALLBACK>} writeCallback The
     *           callback function for writing bytes to the document.
     * @param {Pointer<Void>} writeCallbackState A  void  pointer to the caller-defined state that should be passed when invoking the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_write_callback">WS_WRITE_CALLBACK</a> function.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> structure containing information on how to invoke the function asynchronously.  Assign  <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} _error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> data structure where additional error information should be stored if the function fails.
     * @returns {HRESULT} This callback function does not return a value.
     */
    Call(callbackState, writeCallback, writeCallbackState, asyncContext, _error) {
        callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"
        writeCallbackStateMarshal := writeCallbackState is VarRef ? "ptr" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, callbackStateMarshal, callbackState, WS_WRITE_CALLBACK, writeCallback, writeCallbackStateMarshal, writeCallbackState, WS_ASYNC_CONTEXT.Ptr, asyncContext, _errorMarshal, _error, "HRESULT")
        return result
    }

    /**
     * A WS_PUSH_BYTES_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_PUSH_BYTES_CALLBACK {
        /**
         * Creates a WS_PUSH_BYTES_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WS_WRITE_CALLBACK, "ptr", WS_ASYNC_CONTEXT, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WS_WRITE_CALLBACK, "ptr", WS_ASYNC_CONTEXT.Ptr, WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
