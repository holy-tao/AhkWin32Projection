#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_ASYNC_CONTEXT.ahk" { WS_ASYNC_CONTEXT }
#Import ".\WS_OPERATION_CONTEXT.ahk" { WS_OPERATION_CONTEXT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Invoked by service model to delegate to the service operation call.
 * @remarks
 * A generated callback, it is recommended that the application do not implement this callback on their own.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_service_stub_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SERVICE_STUB_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_SERVICE_STUB_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WS_OPERATION_CONTEXT>} _context The <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-operation-context">context</a> within which this callback is being invoked.
     * @param {Pointer<Void>} _frame Pointer to the method frame.
     * @param {Pointer<Void>} callback Pointer to the callback function to which the stub function corresponds to.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Specifies whether the callback can run asynchronously.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This callback function does not return a value.
     */
    Call(_context, _frame, callback, asyncContext, _error) {
        _contextMarshal := _context is VarRef ? "ptr*" : "ptr"
        _frameMarshal := _frame is VarRef ? "ptr" : "ptr"
        callbackMarshal := callback is VarRef ? "ptr" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, _frameMarshal, _frame, callbackMarshal, callback, WS_ASYNC_CONTEXT.Ptr, asyncContext, _errorMarshal, _error, "HRESULT")
        return result
    }

    /**
     * A WS_SERVICE_STUB_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_SERVICE_STUB_CALLBACK {
        /**
         * Creates a WS_SERVICE_STUB_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(WS_OPERATION_CONTEXT, "ptr", "ptr", WS_ASYNC_CONTEXT, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WS_OPERATION_CONTEXT.Ptr, "ptr", "ptr", WS_ASYNC_CONTEXT.Ptr, WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
