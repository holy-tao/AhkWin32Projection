#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICertRequest2.ahk

/**
 * Provide communications between a client or intermediary application and Certificate Services.
 * @see https://docs.microsoft.com/windows/win32/api//certcli/nn-certcli-icertrequest3
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertRequest3 extends ICertRequest2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertRequest3
     * @type {Guid}
     */
    static IID => Guid("{afc8f92b-33a2-4861-bf36-2933b7cd67b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCredential", "GetRequestIdString", "GetIssuedCertificate2", "GetRefreshPolicy"]

    /**
     * Sets the credential used to contact the Certificate Enrollment Web Service.
     * @param {Integer} hWnd A handle to the parent window.
     * 
     * You must set the <i>hWnd</i> parameter there is a UI presented to obtain the credential. 
     * 
     * For certificate based authorization, the handle is used if a UI prompt is needed to obtain the credential, for example, if the credential is on a smart card and a pin prompt is needed.
     * 
     * When using Kerberos, anonymous, or user name and password authentication, this parameter is ignored.
     * @param {Integer} AuthType A value of the <a href="https://docs.microsoft.com/windows/desktop/api/certcli/ne-certcli-x509enrollmentauthflags">X509EnrollmentAuthFlags</a> enumeration that specifies the authentication type.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="X509AuthAnonymous"></a><a id="x509authanonymous"></a><a id="X509AUTHANONYMOUS"></a><dl>
     * <dt><b>X509AuthAnonymous</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Anonymous authentication.
     * 
     * Set the <i>strCredential</i> and <i>strPassword</i> parameters to <b>NULL</b> or to empty strings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="X509AuthCertificate"></a><a id="x509authcertificate"></a><a id="X509AUTHCERTIFICATE"></a><dl>
     * <dt><b>X509AuthCertificate</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Client authentication certificate installed on the local computer. The certificate contains a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key</a> that is associated with a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a> (not contained in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate</a>). The certificate is used by the server to verify the identity of the client.
     * 
     * The <i>strCredential</i> parameter contains a binary 20-byte SHA-1 hash of the certificate to be passed to the Certificate Enrollment Web Service to authenticate the caller.  Set the <i>strPassword</i> parameter to <b>NULL</b> or an empty string.  The <i>strCredential</i> parameter must refer to a certificate installed in the relevant  personal certificate store, and it must have an associated private key that is accessible to the caller.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="X509AuthKerberos"></a><a id="x509authkerberos"></a><a id="X509AUTHKERBEROS"></a><dl>
     * <dt><b>X509AuthKerberos</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Kerberos authentication.
     * 
     * Set the <i>strCredential</i> and <i>strPassword</i> parameters to <b>NULL</b> or to empty strings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="X509AuthUsername"></a><a id="x509authusername"></a><a id="X509AUTHUSERNAME"></a><dl>
     * <dt><b>X509AuthUsername</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Plaintext user name and password authentication. The user name and password are encrypted when they are stored in the credential vault on the client.
     * 
     * The <i>strCredential</i> and <i>strPassword</i> parameters contain a user name string and a plaintext password that are supported by the Certificate Enrollment Web Service to authenticate the caller.  Because an enrollment service connection always uses <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">Secure Sockets Layer protocol</a> (SSL), the password is encrypted when sent over the wire.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {BSTR} strCredential A string that contains the credential.
     * @param {BSTR} strPassword A string that contains the password.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>AuthType</i> parameter must be <b>X509AuthKerberos</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certcli/nf-certcli-icertrequest3-setcredential
     */
    SetCredential(hWnd, AuthType, strCredential, strPassword) {
        strCredential := strCredential is String ? BSTR.Alloc(strCredential).Value : strCredential
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(20, this, "int", hWnd, "int", AuthType, "ptr", strCredential, "ptr", strPassword, "HRESULT")
        return result
    }

    /**
     * Gets the current internal request number, formatted as a string, for the request and subsequent certificate.
     * @returns {BSTR} A pointer to <b>BSTR</b> variable to receive the request ID string.
     * @see https://docs.microsoft.com/windows/win32/api//certcli/nf-certcli-icertrequest3-getrequestidstring
     */
    GetRequestIdString() {
        pstrRequestId := BSTR()
        result := ComCall(21, this, "ptr", pstrRequestId, "HRESULT")
        return pstrRequestId
    }

    /**
     * Retrieves a certificate's disposition by specifying either the request ID string or the certificate serial number.
     * @param {BSTR} strConfig Represents a valid configuration string for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">Certificate Services</a> server. The string can be either an HTTPS URL for an enrollment server or in the form <i>ComputerName</i><b>\\</b><i>CAName</i>, where <i>ComputerName</i> is the network name of the server, and <i>CAName</i> is the common name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a>, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * 
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>An HTTPS URL is not supported as an input.
     * @param {BSTR} strRequestId A <b>BSTR</b> value that represents the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate request</a> ID in the Certificates Services database. Set this parameter to <b>NULL</b> if the serial number (passed in as <i>strSerialNumber</i>) is to be used instead of the request ID.
     * 
     * Use the  <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nf-certcli-icertrequest3-getrequestidstring">ICertRequest3::GetRequestIdString</a> method to obtain the request ID string.
     * @param {BSTR} strSerialNumber A <b>BSTR</b> value that represents the certificate serial number, as issued by the CA. The string must specify the serial number as an even number of hexadecimal digits. If necessary, a zero can be prefixed to the number to produce an even number of digits. However, no more than one leading zero may be used.
     * 
     * The <i>strSerialNumber</i> value is only used when the <i>strRequestId</i> is set to <b>NULL</b>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certcli/nf-certcli-icertrequest3-getissuedcertificate2
     */
    GetIssuedCertificate2(strConfig, strRequestId, strSerialNumber) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strRequestId := strRequestId is String ? BSTR.Alloc(strRequestId).Value : strRequestId
        strSerialNumber := strSerialNumber is String ? BSTR.Alloc(strSerialNumber).Value : strSerialNumber

        result := ComCall(22, this, "ptr", strConfig, "ptr", strRequestId, "ptr", strSerialNumber, "uint*", &pDisposition := 0, "HRESULT")
        return pDisposition
    }

    /**
     * Returns a value that indicates whether a client's cached certificate enrollment policy is out of date and needs to be refreshed.
     * @returns {VARIANT_BOOL} A pointer to a <b>VARIANT_BOOL</b> variable to receive the refresh indicator.
     * @see https://docs.microsoft.com/windows/win32/api//certcli/nf-certcli-icertrequest3-getrefreshpolicy
     */
    GetRefreshPolicy() {
        result := ComCall(23, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }
}
