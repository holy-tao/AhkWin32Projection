#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\Cryptography\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\LDAP.ahk" { LDAP }

/**
 * Allows a client to evaluate the certificate chain of the server to which it is connected.
 * @remarks
 * The <b>VERIFYSERVERCERT</b> callback function allows the client to verify the certificate of the server. The client registers a callback which is invoked after the secure connection is set up. The server certificate context is presented to the callback function, where it can be verified as acceptable or not. To register this callback, call 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> where CertRoutine is the address of your callback function.
 * 
 * 
 * ```cpp
 * conn, LDAP_OPT_SERVER_CERTIFICATE, &CertRoutine
 * ```
 * 
 * 
 * The server calls <b>VERIFYSERVERCERT</b> after the secure connection has been established. The server's certificate context is supplied for examination by the client.
 * 
 * An application should use the <i>ppServerCert</i> parameter as: <c>PCCERT_CONTEXT* ppServerCert = (PCCERT_CONTEXT*)pServerCert;</c>
 * 
 * Even though <b>VERIFYSERVERCERT</b> is declared as receiving a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">PCCERT_CONTEXT</a>, it in fact receives a <b>PCCERT_CONTEXT</b>*. The <i>ppServerCert</i> can be used to verify the certificate. <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certfreecertificatecontext">CertFreeCertificateContext</a> should be called before this function returns. The call to this function should be made as follows:
 * 
 * 
 * ```cpp
 * CertFreeCertificateContext(*ppServerCert);
 * ```
 * 
 * 
 * Or, alternatively, as:
 * 
 * 
 * ```cpp
 * CertFreeCertificateContext(*((PCCERT_CONTEXT*)pServerCert));
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/winldap/nc-winldap-verifyservercert
 * @namespace Windows.Win32.Networking.Ldap
 */
export default struct VERIFYSERVERCERT {
    value : IntPtr

    __value {
        set {
            if (value is VERIFYSERVERCERT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LDAP>} _Connection The session handle.
     * @param {Pointer<Pointer<CERT_CONTEXT>>} pServerCert 
     * @returns {BOOLEAN} If the function succeeds (the client approves the server certificate), the return value is <b>TRUE</b>.
     * 
     * If the function fails; the return value is <b>FALSE</b> and the secure connection is torn down.
     */
    Call(_Connection, pServerCert) {
        pServerCertMarshal := pServerCert is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, LDAP.Ptr, _Connection, pServerCertMarshal, pServerCert, BOOLEAN)
        return result
    }

    /**
     * A VERIFYSERVERCERT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VERIFYSERVERCERT {
        /**
         * Creates a VERIFYSERVERCERT pointer that invokes the given AHK function when called.
         * @param {Func(LDAP, "ptr*") => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [LDAP.Ptr, "ptr*", BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
