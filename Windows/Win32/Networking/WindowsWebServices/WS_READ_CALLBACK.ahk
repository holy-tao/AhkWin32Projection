#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_ASYNC_CONTEXT.ahk" { WS_ASYNC_CONTEXT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }

/**
 * Used by the WS_XML_READERto read from some source into a buffer.
 * @remarks
 * Returning size of 0 in the <i>actualSize</i> output parameter indicates the end of the file.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_read_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_READ_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_READ_CALLBACK) {
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
     * @param {Integer} bytes A <b>void</b> pointer to the location where the data should be placed.
     * @param {Integer} maxSize The maximum number of bytes that may be read.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> structure containing information on how to invoke the function asynchronously.  Assigned <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} _error A pointer to <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> data structure where additional error information should be stored if the function fails.
     * @returns {Integer} A pointer to a <b>ULONG</b>  value that indicates the number of bytes actually read.  This may be less than maxSize.  Returning 0
     *           indicates that there is no more data.
     */
    Call(callbackState, bytes, maxSize, asyncContext, _error) {
        callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, callbackStateMarshal, callbackState, IntPtr, bytes, UInt32, maxSize, "uint*", &actualSize := 0, WS_ASYNC_CONTEXT.Ptr, asyncContext, _errorMarshal, _error, "HRESULT")
        return actualSize
    }

    /**
     * A WS_READ_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_READ_CALLBACK {
        /**
         * Creates a WS_READ_CALLBACK pointer that invokes the given AHK function when called.
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
