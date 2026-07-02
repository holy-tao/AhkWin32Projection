#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\Authentication\Identity\SecPkgContext_IssuerListInfoEx.ahk" { SecPkgContext_IssuerListInfoEx }
#Import "..\..\Security\Cryptography\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\LDAP.ahk" { LDAP }

/**
 * Enables the server to request a certificate from the client when establishing a Secure Sockets Layer (SSL) connection.
 * @remarks
 * Implement this function in your client application with the signature previously described. Then call 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> (conn, LDAP_OPT_CLIENT_CERTIFICATE, &amp;CertRoutine) where CertRoutine is the address of your callback routine.
 * 
 * When the server demands a client certificate for authorization it will call <b>QUERYCLIENTCERT</b>. The LDAP run time passes a structure containing a list of server-trusted Certificate Authorities. The client application must examine this list of CAs the server trusts and supply an appropriate client certificate. The run time subsequently passes these credentials back to the SSL server as part of the handshake. If the client application requires anonymous credentials, it should pass back <b>FALSE</b> instead of supplying a certificate.
 * 
 * <div class="alert"><b>Note</b>  The application must perform an external bind subsequent to establishing the connection for the server to use the supplied client credentials.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/winldap/nc-winldap-queryclientcert
 * @namespace Windows.Win32.Networking.Ldap
 */
export default struct QUERYCLIENTCERT {
    value : IntPtr

    __value {
        set {
            if (value is QUERYCLIENTCERT) {
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
     * @param {Pointer<SecPkgContext_IssuerListInfoEx>} trusted_CAs A list of server-trusted Certificate Authorities.
     * @param {Pointer<Pointer<CERT_CONTEXT>>} ppCertificate Upon receiving the callback, the user supplies an appropriate client certificate in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> format and returns a value of <b>TRUE</b>. If the client cannot supply an appropriate certificate or wants the server to use anonymous credentials, it should return a value of <b>FALSE</b> instead. Any certificate supplied must be freed by the application after the connection is completed.
     * @returns {BOOLEAN} 
     */
    Call(_Connection, trusted_CAs, ppCertificate) {
        ppCertificateMarshal := ppCertificate is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, LDAP.Ptr, _Connection, SecPkgContext_IssuerListInfoEx.Ptr, trusted_CAs, ppCertificateMarshal, ppCertificate, BOOLEAN)
        return result
    }

    /**
     * A QUERYCLIENTCERT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends QUERYCLIENTCERT {
        /**
         * Creates a QUERYCLIENTCERT pointer that invokes the given AHK function when called.
         * @param {Func(LDAP, SecPkgContext_IssuerListInfoEx, "ptr*") => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [LDAP.Ptr, SecPkgContext_IssuerListInfoEx.Ptr, "ptr*", BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
