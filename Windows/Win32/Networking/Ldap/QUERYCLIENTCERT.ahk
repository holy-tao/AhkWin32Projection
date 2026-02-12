#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/winldap/nc-winldap-queryclientcert
 * @namespace Windows.Win32.Networking.Ldap
 * @version v4.0.30319
 */
class QUERYCLIENTCERT extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<LDAP>} Connection_ 
     * @param {Pointer<SecPkgContext_IssuerListInfoEx>} trusted_CAs 
     * @param {Pointer<Pointer<CERT_CONTEXT>>} ppCertificate 
     * @returns {BOOLEAN} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Connection_, trusted_CAs, ppCertificate) {
        ppCertificateMarshal := ppCertificate is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", Connection_, "ptr", trusted_CAs, ppCertificateMarshal, ppCertificate, "char")
        return result
    }
}
