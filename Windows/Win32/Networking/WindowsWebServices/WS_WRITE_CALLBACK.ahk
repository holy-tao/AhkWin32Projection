#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_ASYNC_CONTEXT.ahk" { WS_ASYNC_CONTEXT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_BYTES.ahk" { WS_BYTES }

/**
 * Used by the WS_XML_WRITER function to write a specified buffer to a user-determined destination.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_write_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_WRITE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_WRITE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} callbackState A   <b>void</b> pointer to the user-defined state value that was passed to the function that accepted this callback.
     * @param {Pointer<WS_BYTES>} buffers A  pointer to the buffers containing the data to be written.
     * @param {Integer} count The number of buffers to write.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> structure containing information on how to invoke the function asynchronously.  Assigned <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} _error A pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> data structure where additional error information should be stored if the function fails.
     * @returns {HRESULT} This callback function does not return a value.
     */
    Call(callbackState, buffers, count, asyncContext, _error) {
        callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, callbackStateMarshal, callbackState, WS_BYTES.Ptr, buffers, UInt32, count, WS_ASYNC_CONTEXT.Ptr, asyncContext, _errorMarshal, _error, "HRESULT")
        return result
    }

    /**
     * A WS_WRITE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_WRITE_CALLBACK {
        /**
         * Creates a WS_WRITE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WS_BYTES, UInt32, WS_ASYNC_CONTEXT, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WS_BYTES.Ptr, UInt32, WS_ASYNC_CONTEXT.Ptr, WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
