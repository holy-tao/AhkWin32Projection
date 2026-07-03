#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import "..\..\Security\Authentication\Identity\SecPkgContext_IssuerListInfoEx.ahk" { SecPkgContext_IssuerListInfoEx }

/**
 * Notifies the client of the list of certificate issuers that are acceptable to the server.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_cert_issuer_list_notification_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CERT_ISSUER_LIST_NOTIFICATION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_CERT_ISSUER_LIST_NOTIFICATION_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} certIssuerListNotificationCallbackState State that was specified along with this callback in the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_custom_cert_credential">WS_CUSTOM_CERT_CREDENTIAL</a>.
     * @param {Pointer<SecPkgContext_IssuerListInfoEx>} issuerList The list of certificate issuers acceptable to the server.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This callback function does not return a value.
     */
    Call(certIssuerListNotificationCallbackState, issuerList, _error) {
        certIssuerListNotificationCallbackStateMarshal := certIssuerListNotificationCallbackState is VarRef ? "ptr" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, certIssuerListNotificationCallbackStateMarshal, certIssuerListNotificationCallbackState, SecPkgContext_IssuerListInfoEx.Ptr, issuerList, _errorMarshal, _error, "HRESULT")
        return result
    }

    /**
     * A WS_CERT_ISSUER_LIST_NOTIFICATION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_CERT_ISSUER_LIST_NOTIFICATION_CALLBACK {
        /**
         * Creates a WS_CERT_ISSUER_LIST_NOTIFICATION_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", SecPkgContext_IssuerListInfoEx, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", SecPkgContext_IssuerListInfoEx.Ptr, WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
