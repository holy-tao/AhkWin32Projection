#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IX509EnrollmentHelper interface defines methods that enable a web application to enroll a certificate, store policy server credentials in the credential cache, and register policy servers and enrollment servers.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509enrollmenthelper
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509EnrollmentHelper extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509EnrollmentHelper
     * @type {Guid}
     */
    static IID => Guid("{728ab351-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPolicyServer", "AddEnrollmentServer", "Enroll", "Initialize"]

    /**
     * Registers a certificate enrollment policy (CEP) server and saves CEP access credentials in the credential cache.
     * @param {BSTR} strEnrollmentPolicyServerURI A <b>BSTR</b> that contains the certificate enrollment policy server URL.
     * @param {BSTR} strEnrollmentPolicyID A <b>BSTR</b> that contains the certificate enrollment policy server ID. The ID can be any string. It is set by the administrator who installs the CEP server.
     * @param {Integer} EnrollmentPolicyServerFlags 
     * @param {Integer} authFlags 
     * @param {BSTR} strCredential A <b>BSTR</b> that contains the credential.
     * @param {BSTR} strPassword A <b>BSTR</b> that contains a clear text password.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
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
     * The <i>strEnrollmentPolicyServerURI</i>,  <i>strCredential</i>, or <i>strPassword</i> parameters cannot be <b>NULL</b> or empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ARITHMETIC_OVERFLOW)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>strPassword</i>, <i>strCredential</i>, or <i>strEnrollmentServerURI</i> parameters exceed 64,000 characters or contain embedded null characters.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmenthelper-addpolicyserver
     */
    AddPolicyServer(strEnrollmentPolicyServerURI, strEnrollmentPolicyID, EnrollmentPolicyServerFlags, authFlags, strCredential, strPassword) {
        strEnrollmentPolicyServerURI := strEnrollmentPolicyServerURI is String ? BSTR.Alloc(strEnrollmentPolicyServerURI).Value : strEnrollmentPolicyServerURI
        strEnrollmentPolicyID := strEnrollmentPolicyID is String ? BSTR.Alloc(strEnrollmentPolicyID).Value : strEnrollmentPolicyID
        strCredential := strCredential is String ? BSTR.Alloc(strCredential).Value : strCredential
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(7, this, "ptr", strEnrollmentPolicyServerURI, "ptr", strEnrollmentPolicyID, "int", EnrollmentPolicyServerFlags, "int", authFlags, "ptr", strCredential, "ptr", strPassword, "HRESULT")
        return result
    }

    /**
     * Saves certificate enrollment server (CES) access credentials in the credential cache.
     * @param {BSTR} strEnrollmentServerURI A <b>BSTR</b> that contains the certificate enrollment server URL.
     * @param {Integer} authFlags 
     * @param {BSTR} strCredential A <b>BSTR</b> that contains the credential.
     * @param {BSTR} strPassword A <b>BSTR</b> that contains a clear text password.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
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
     * The <i>strEnrollmentServerURI</i> parameter cannot be <b>NULL</b> or empty.
     * 
     * If X509AuthAnonymous or X509AuthKerberos is specified in the <i>authFlags</i> parameter, the <i>strCredential</i> parameter must not be <b>NULL</b>.
     * 
     * If X509AuthCertificate is specified in the <i>authFlags</i> parameter, the <i>strCredential</i> parameter must be <b>NULL</b>.
     * 
     * If X509AuthCertificateis specified in the <i>authFlags</i> parameter, the <i>strPassword</i> parameter must be <b>NULL</b>, but <i>strCredential</i> parameter must not be.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ARITHMETIC_OVERFLOW)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>strPassword</i>, <i>strCredential</i>, or <i>strEnrollmentServerURI</i> parameters exceed 64,000 characters or contain embedded null characters.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmenthelper-addenrollmentserver
     */
    AddEnrollmentServer(strEnrollmentServerURI, authFlags, strCredential, strPassword) {
        strEnrollmentServerURI := strEnrollmentServerURI is String ? BSTR.Alloc(strEnrollmentServerURI).Value : strEnrollmentServerURI
        strCredential := strCredential is String ? BSTR.Alloc(strCredential).Value : strCredential
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(8, this, "ptr", strEnrollmentServerURI, "int", authFlags, "ptr", strCredential, "ptr", strPassword, "HRESULT")
        return result
    }

    /**
     * Enrolls a certificate request and retrieves the issued certificate.
     * @param {BSTR} strEnrollmentPolicyServerURI A <b>BSTR</b> that contains the certificate enrollment policy server URL.
     * @param {BSTR} strTemplateName A  <b>BSTR</b> variable that contains the Common Name (CN) of the template as it appears in Active Directory or the dotted decimal <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a>.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of encoding applied to a byte array for display purposes.
     * @param {Integer} enrollFlags A <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-webenrollmentflags">WebEnrollmentFlags</a> enumeration value that specifies web enrollment behavior. This can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EnrollPrompt"></a><a id="enrollprompt"></a><a id="ENROLLPROMPT"></a><dl>
     * <dt><b>EnrollPrompt</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set and no authentication credential is available for the certificate enrollment server, the certificate service prompts for a credential. If there is no authentication credential and this flag is not set, the <b>Enroll</b> method fails.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BSTR} A <b>BSTR</b> that contains the issued certificate.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmenthelper-enroll
     */
    Enroll(strEnrollmentPolicyServerURI, strTemplateName, Encoding, enrollFlags) {
        strEnrollmentPolicyServerURI := strEnrollmentPolicyServerURI is String ? BSTR.Alloc(strEnrollmentPolicyServerURI).Value : strEnrollmentPolicyServerURI
        strTemplateName := strTemplateName is String ? BSTR.Alloc(strTemplateName).Value : strTemplateName

        pstrCertificate := BSTR()
        result := ComCall(9, this, "ptr", strEnrollmentPolicyServerURI, "ptr", strTemplateName, "int", Encoding, "int", enrollFlags, "ptr", pstrCertificate, "HRESULT")
        return pstrCertificate
    }

    /**
     * Initializes an IX509EnrollmentHelper object.
     * @param {Integer} Context 
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object has already been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmenthelper-initialize
     */
    Initialize(Context) {
        result := ComCall(10, this, "int", Context, "HRESULT")
        return result
    }
}
