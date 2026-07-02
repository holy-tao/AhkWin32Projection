#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_ENDPOINT_ADDRESS.ahk" { WS_ENDPOINT_ADDRESS }
#Import "..\..\Security\Cryptography\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_STRING.ahk" { WS_STRING }

/**
 * Provides a certificate to the security runtime.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_get_cert_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_GET_CERT_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_GET_CERT_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} getCertCallbackState State that was specified along with this callback in the certificate credential.
     * @param {Pointer<WS_ENDPOINT_ADDRESS>} targetAddress The target address to whom this certificate is to be presented, in
     * case this certificate credential is specified for a client.
     * @param {Pointer<WS_STRING>} viaUri The via address to whom this certificate is to be presented.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {Pointer<CERT_CONTEXT>} The location to return the certificate.
     */
    Call(getCertCallbackState, targetAddress, viaUri, _error) {
        getCertCallbackStateMarshal := getCertCallbackState is VarRef ? "ptr" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, getCertCallbackStateMarshal, getCertCallbackState, WS_ENDPOINT_ADDRESS.Ptr, targetAddress, WS_STRING.Ptr, viaUri, "ptr*", &cert := 0, _errorMarshal, _error, "HRESULT")
        return cert
    }

    /**
     * A WS_GET_CERT_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_GET_CERT_CALLBACK {
        /**
         * Creates a WS_GET_CERT_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WS_ENDPOINT_ADDRESS, WS_STRING, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WS_ENDPOINT_ADDRESS.Ptr, WS_STRING.Ptr, WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
