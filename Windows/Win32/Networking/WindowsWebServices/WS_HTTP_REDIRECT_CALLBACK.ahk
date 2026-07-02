#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_STRING.ahk" { WS_STRING }

/**
 * Invoked when a message is about to be automatically redirected to another service utilizing HTTP auto redirect functionality as described in RFC2616.
 * @remarks
 * The parameters supplied during this callback are valid only for the 
 *                 duration of the callback.
 *             
 * 
 * The callback implementation should avoid lengthy computation or 
 *                 lengthy blocking calls so that it can return to the caller quickly.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_http_redirect_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_HTTP_REDIRECT_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_HTTP_REDIRECT_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} state The 'state' as specified as part of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_http_redirect_callback_context">WS_HTTP_REDIRECT_CALLBACK_CONTEXT</a> 'state' field.
     * @param {Pointer<WS_STRING>} originalUrl The original endpoint URL that the message was sent to.
     * @param {Pointer<WS_STRING>} newUrl The endpoint URL that the message is about to be forwarded to.
     * @returns {HRESULT} This callback function does not return a value.
     */
    Call(state, originalUrl, newUrl) {
        stateMarshal := state is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, stateMarshal, state, WS_STRING.Ptr, originalUrl, WS_STRING.Ptr, newUrl, "HRESULT")
        return result
    }

    /**
     * A WS_HTTP_REDIRECT_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_HTTP_REDIRECT_CALLBACK {
        /**
         * Creates a WS_HTTP_REDIRECT_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WS_STRING, WS_STRING) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WS_STRING.Ptr, WS_STRING.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
