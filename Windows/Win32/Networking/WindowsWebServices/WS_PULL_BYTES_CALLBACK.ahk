#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_ASYNC_CONTEXT.ahk" { WS_ASYNC_CONTEXT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Used by the WsPullBytes function to request the data that should be written.
 * @remarks
 * Returning size of 0 indicates EOF.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_pull_bytes_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_PULL_BYTES_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_PULL_BYTES_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} callbackState The user-defined state that was passed to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wspullbytes">WsPullBytes</a>.
     * @param {Integer} bytes Where the data that is read should be placed.
     * @param {Integer} maxSize The maximum number of bytes that may be read.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} The actual number of bytes that were read.  This may be less than maxSize.  Returning 0
     *           indicates that there is no more data.
     */
    Call(callbackState, bytes, maxSize, asyncContext, _error) {
        callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, callbackStateMarshal, callbackState, IntPtr, bytes, UInt32, maxSize, "uint*", &actualSize := 0, WS_ASYNC_CONTEXT.Ptr, asyncContext, _errorMarshal, _error, "HRESULT")
        return actualSize
    }

    /**
     * A WS_PULL_BYTES_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_PULL_BYTES_CALLBACK {
        /**
         * Creates a WS_PULL_BYTES_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr, UInt32, WS_ASYNC_CONTEXT, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, UInt32, WS_ASYNC_CONTEXT.Ptr, WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
