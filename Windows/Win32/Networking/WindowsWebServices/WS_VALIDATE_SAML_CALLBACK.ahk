#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import ".\WS_XML_BUFFER.ahk" { WS_XML_BUFFER }

/**
 * Validates a SAML assertion.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_validate_saml_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_VALIDATE_SAML_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_VALIDATE_SAML_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} samlValidatorCallbackState The state to be passed back when invoking this callback.
     * @param {Pointer<WS_XML_BUFFER>} samlAssertion The received SAML assertion that has undergone a successful signature check.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This callback function does not return a value.
     */
    Call(samlValidatorCallbackState, samlAssertion, _error) {
        samlValidatorCallbackStateMarshal := samlValidatorCallbackState is VarRef ? "ptr" : "ptr"
        samlAssertionMarshal := samlAssertion is VarRef ? "ptr*" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, samlValidatorCallbackStateMarshal, samlValidatorCallbackState, samlAssertionMarshal, samlAssertion, _errorMarshal, _error, "HRESULT")
        return result
    }

    /**
     * A WS_VALIDATE_SAML_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_VALIDATE_SAML_CALLBACK {
        /**
         * Creates a WS_VALIDATE_SAML_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WS_XML_BUFFER, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WS_XML_BUFFER.Ptr, WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
