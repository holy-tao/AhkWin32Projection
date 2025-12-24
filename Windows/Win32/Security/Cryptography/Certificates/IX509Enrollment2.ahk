#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509EnrollmentPolicyServer.ahk
#Include .\IX509CertificateTemplate.ahk
#Include .\IX509Enrollment.ahk

/**
 * The IX509Enrollment2 interface enables you to enroll in a certificate hierarchy and install a certificate response.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509enrollment2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509Enrollment2 extends IX509Enrollment{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509Enrollment2
     * @type {Guid}
     */
    static IID => Guid("{728ab350-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromTemplate", "InstallResponse2", "get_PolicyServer", "get_Template", "get_RequestIdString"]

    /**
     * @type {IX509EnrollmentPolicyServer} 
     */
    PolicyServer {
        get => this.get_PolicyServer()
    }

    /**
     * @type {IX509CertificateTemplate} 
     */
    Template {
        get => this.get_Template()
    }

    /**
     * @type {BSTR} 
     */
    RequestIdString {
        get => this.get_RequestIdString()
    }

    /**
     * Initializes the enrollment object by using a template.
     * @param {Integer} context 
     * @param {IX509EnrollmentPolicyServer} pPolicyServer Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmentpolicyserver">IX509EnrollmentPolicyServer</a> object that represents the certificate enrollment policy (CEP) server that contains the template specified by the <i>pTemplate</i> parameter.
     * @param {IX509CertificateTemplate} pTemplate Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificatetemplate">IX509CertificateTemplate</a> object that represents the template to use during initialization.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pPolicyServer</i> and <i>pTemplate</i> parameters cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enrollment object has already been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment2-initializefromtemplate
     */
    InitializeFromTemplate(context, pPolicyServer, pTemplate) {
        result := ComCall(30, this, "int", context, "ptr", pPolicyServer, "ptr", pTemplate, "HRESULT")
        return result
    }

    /**
     * Installs a certificate chain on the end-entity computer.
     * @param {Integer} Restrictions 
     * @param {BSTR} strResponse A <b>BSTR</b> variable that contains the DER-encoded response.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of encoding applied to  the string that contains the DER-encoded response.
     * @param {BSTR} strPassword An optional password for the certificate installation. This can be  <b>NULL</b> to indicate that  no password is used.  When you have finished using the password, clear it from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information about protecting the password, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @param {BSTR} strEnrollmentPolicyServerUrl A <b>BSTR</b> that contains the URL of the certificate enrollment policy (CEP) server.
     * @param {BSTR} strEnrollmentPolicyServerID A <b>BSTR</b> that contains an identifier for the CEP server.
     * @param {Integer} EnrollmentPolicyServerFlags 
     * @param {Integer} authFlags An <a href="https://docs.microsoft.com/windows/desktop/api/certcli/ne-certcli-x509enrollmentauthflags">X509EnrollmentAuthFlags</a> enumeration value that specifies the client authentication type. For Windows 7, only <b>X509AuthCertificate</b> can be chosen from the following values.
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
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="X509AuthUsername"></a><a id="x509authusername"></a><a id="X509AUTHUSERNAME"></a><dl>
     * <dt><b>X509AuthUsername</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Clear text user name and password authentication.
     * 
     * <div class="alert"><b>Note</b>  The user name and password are encrypted before transmission and are stored securely in the credential vault on the CEP server.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="X509AuthCertificate"></a><a id="x509authcertificate"></a><a id="X509AUTHCERTIFICATE"></a><dl>
     * <dt><b>X509AuthCertificate</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Client authentication certificate installed on the local computer and used by the server to verify the identity of the client.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method was called from the web and either <b>AllowNoOutstandingRequest</b> or <b>AllowUntrustedCertificate</b> was specified in the <i>Restrictions</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ARITHMETIC_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The length of the string that contains the password exceeds 64 kilobytes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_BLANK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enrollment object has not been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment2-installresponse2
     */
    InstallResponse2(Restrictions, strResponse, Encoding, strPassword, strEnrollmentPolicyServerUrl, strEnrollmentPolicyServerID, EnrollmentPolicyServerFlags, authFlags) {
        strResponse := strResponse is String ? BSTR.Alloc(strResponse).Value : strResponse
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword
        strEnrollmentPolicyServerUrl := strEnrollmentPolicyServerUrl is String ? BSTR.Alloc(strEnrollmentPolicyServerUrl).Value : strEnrollmentPolicyServerUrl
        strEnrollmentPolicyServerID := strEnrollmentPolicyServerID is String ? BSTR.Alloc(strEnrollmentPolicyServerID).Value : strEnrollmentPolicyServerID

        result := ComCall(31, this, "int", Restrictions, "ptr", strResponse, "int", Encoding, "ptr", strPassword, "ptr", strEnrollmentPolicyServerUrl, "ptr", strEnrollmentPolicyServerID, "int", EnrollmentPolicyServerFlags, "int", authFlags, "HRESULT")
        return result
    }

    /**
     * Retrieves the certificate enrollment policy (CEP) server that contains the template used during initialization.
     * @returns {IX509EnrollmentPolicyServer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment2-get_policyserver
     */
    get_PolicyServer() {
        result := ComCall(32, this, "ptr*", &ppPolicyServer := 0, "HRESULT")
        return IX509EnrollmentPolicyServer(ppPolicyServer)
    }

    /**
     * Retrieves the certificate request template used during initialization.
     * @returns {IX509CertificateTemplate} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment2-get_template
     */
    get_Template() {
        result := ComCall(33, this, "ptr*", &ppTemplate := 0, "HRESULT")
        return IX509CertificateTemplate(ppTemplate)
    }

    /**
     * Retrieves a string that contains a unique identifier for the certificate request sent to the certification enrollment server (CES).
     * @remarks
     * 
     * The value of the <b>RequestIdString</b> property is set during the enrollment process. It can be used during subsequent communication between the client and the CES. For example, if a CES marks a request as pending when initially submitted, the client can use the request ID string when it again contacts the CES and attempts to retrieve the certificate response.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment2-get_requestidstring
     */
    get_RequestIdString() {
        pValue := BSTR()
        result := ComCall(34, this, "ptr", pValue, "HRESULT")
        return pValue
    }
}
