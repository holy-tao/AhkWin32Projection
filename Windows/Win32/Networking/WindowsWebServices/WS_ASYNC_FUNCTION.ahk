#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_ASYNC_CONTEXT.ahk" { WS_ASYNC_CONTEXT }
#Import ".\WS_ASYNC_OPERATION.ahk" { WS_ASYNC_OPERATION }
#Import ".\WS_CALLBACK_MODEL.ahk" { WS_CALLBACK_MODEL }
#Import ".\WS_ERROR.ahk" { WS_ERROR }

/**
 * Used with the WsAsyncExecute to specify the next function to invoke in a series of async operations. (WS_ASYNC_FUNCTION)
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_async_function
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_ASYNC_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is WS_ASYNC_FUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HRESULT} hr The result of the previous async operation.
     * @param {WS_CALLBACK_MODEL} callbackModel Whether the callback is being invoked long or short.
     *                     For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_callback_model">WS_CALLBACK_MODEL</a>.
     * @param {Pointer<Void>} callbackState This user supplied value that was passed to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsasyncexecute">WsAsyncExecute</a>/
     * @param {Pointer<WS_ASYNC_OPERATION>} next Set the function field to the next function to call.  It will be called regardless of whether or not the current function succeeds or fails.
     *                 
     * 
     * Set the function field to <b>NULL</b> to indicate that there are no more functions to call.  
     *                 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsasyncexecute">WsAsyncExecute</a> will set the function field to <b>NULL</b> before each function is called.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This callback function does not return a value.
     */
    Call(hr, callbackModel, callbackState, next, asyncContext, _error) {
        callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, "int", hr, WS_CALLBACK_MODEL, callbackModel, callbackStateMarshal, callbackState, WS_ASYNC_OPERATION.Ptr, next, WS_ASYNC_CONTEXT.Ptr, asyncContext, _errorMarshal, _error, "HRESULT")
        return result
    }

    /**
     * A WS_ASYNC_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_ASYNC_FUNCTION {
        /**
         * Creates a WS_ASYNC_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func("int", WS_CALLBACK_MODEL, "ptr", WS_ASYNC_OPERATION, WS_ASYNC_CONTEXT, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["int", WS_CALLBACK_MODEL, "ptr", WS_ASYNC_OPERATION.Ptr, WS_ASYNC_CONTEXT.Ptr, WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
