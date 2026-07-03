#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_ASYNC_CONTEXT.ahk" { WS_ASYNC_CONTEXT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import ".\WS_STRING.ahk" { WS_STRING }

/**
 * Validates a username/password pair on the receiver side.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_validate_password_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_VALIDATE_PASSWORD_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_VALIDATE_PASSWORD_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} passwordValidatorCallbackState The state to be passed back when invoking this callback.
     * @param {Pointer<WS_STRING>} username Received username.
     * @param {Pointer<WS_STRING>} password Received password.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This callback function does not return a value.
     */
    Call(passwordValidatorCallbackState, username, password, asyncContext, _error) {
        passwordValidatorCallbackStateMarshal := passwordValidatorCallbackState is VarRef ? "ptr" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, passwordValidatorCallbackStateMarshal, passwordValidatorCallbackState, WS_STRING.Ptr, username, WS_STRING.Ptr, password, WS_ASYNC_CONTEXT.Ptr, asyncContext, _errorMarshal, _error, "HRESULT")
        return result
    }

    /**
     * A WS_VALIDATE_PASSWORD_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_VALIDATE_PASSWORD_CALLBACK {
        /**
         * Creates a WS_VALIDATE_PASSWORD_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WS_STRING, WS_STRING, WS_ASYNC_CONTEXT, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WS_STRING.Ptr, WS_STRING.Ptr, WS_ASYNC_CONTEXT.Ptr, WS_ERROR.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
