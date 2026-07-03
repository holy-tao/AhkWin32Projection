#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import ".\WS_OPERATION_CONTEXT.ahk" { WS_OPERATION_CONTEXT }

/**
 * Invoked when headers of the incoming message are received and the body is not processed.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_service_security_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SERVICE_SECURITY_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_SERVICE_SECURITY_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WS_OPERATION_CONTEXT>} _context The incoming message with headers only.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {BOOL} Set to <b>TRUE</b>, if authorization succeeded, <b>FALSE</b> if authorization failed.
     */
    Call(_context, _error) {
        _contextMarshal := _context is VarRef ? "ptr*" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, BOOL.Ptr, &authorized := 0, _errorMarshal, _error, "HRESULT")
        return authorized
    }

    /**
     * A WS_SERVICE_SECURITY_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_SERVICE_SECURITY_CALLBACK {
        /**
         * Creates a WS_SERVICE_SECURITY_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(WS_OPERATION_CONTEXT, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WS_OPERATION_CONTEXT.Ptr, WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
