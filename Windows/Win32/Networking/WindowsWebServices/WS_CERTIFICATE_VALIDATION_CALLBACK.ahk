#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\Cryptography\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The WS_CERTIFICATE_VALIDATION_CALLBACK callback is invoked to validate a certificate when a connection to an HTTP server has been established and headers sent.
 * @remarks
 * If <i>WS_CERTIFICATE_VALIDATION_CALLBACK</i> returns any value other than <b>S_OK</b>, the channel will be aborted. The service proxy will also be aborted if this property was passed to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreateserviceproxy">WsCreateServiceProxy</a>.
 * 
 * The callback implementation must avoid long computation times or long blocking calls so that it returns to the caller quickly.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_certificate_validation_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CERTIFICATE_VALIDATION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_CERTIFICATE_VALIDATION_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CERT_CONTEXT>} certContext A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that is associated with the connection. Applications must free this structure using <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certfreecertificatecontext">CertFreeCertificateContext</a>.
     * @param {Pointer<Void>} state A pointer to application specific state information. This parameter corresponds to the <b>state</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_certificate_validation_callback_context">WS_CERTIFICATE_VALIDATION_CALLBACK_CONTEXT</a> structure.
     * @returns {HRESULT} This callback function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate validated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(certContext, state) {
        stateMarshal := state is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CERT_CONTEXT.Ptr, certContext, stateMarshal, state, "HRESULT")
        return result
    }

    /**
     * A WS_CERTIFICATE_VALIDATION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_CERTIFICATE_VALIDATION_CALLBACK {
        /**
         * Creates a WS_CERTIFICATE_VALIDATION_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(CERT_CONTEXT, "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CERT_CONTEXT.Ptr, "ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
