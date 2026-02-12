#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/winldap/nc-winldap-verifyservercert
 * @namespace Windows.Win32.Networking.Ldap
 * @version v4.0.30319
 */
class VERIFYSERVERCERT extends IUnknown {

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
     * @param {Pointer<Pointer<CERT_CONTEXT>>} pServerCert 
     * @returns {BOOLEAN} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Connection_, pServerCert) {
        pServerCertMarshal := pServerCert is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", Connection_, pServerCertMarshal, pServerCert, "char")
        return result
    }
}
