#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509CertificateRequest.ahk
#Include .\IX509NameValuePairs.ahk
#Include .\IX509EnrollmentStatus.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents the top level object and enables you to enroll in a certificate hierarchy and install a certificate response.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509enrollment
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509Enrollment extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509Enrollment
     * @type {Guid}
     */
    static IID => Guid("{728ab346-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "InitializeFromTemplateName", "InitializeFromRequest", "CreateRequest", "Enroll", "InstallResponse", "CreatePFX", "get_Request", "get_Silent", "put_Silent", "get_ParentWindow", "put_ParentWindow", "get_NameValuePairs", "get_EnrollmentContext", "get_Status", "get_Certificate", "get_Response", "get_CertificateFriendlyName", "put_CertificateFriendlyName", "get_CertificateDescription", "put_CertificateDescription", "get_RequestId", "get_CAConfigString"]

    /**
     * @type {IX509CertificateRequest} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Silent {
        get => this.get_Silent()
        set => this.put_Silent(value)
    }

    /**
     * @type {Integer} 
     */
    ParentWindow {
        get => this.get_ParentWindow()
        set => this.put_ParentWindow(value)
    }

    /**
     * @type {IX509NameValuePairs} 
     */
    NameValuePairs {
        get => this.get_NameValuePairs()
    }

    /**
     * @type {Integer} 
     */
    EnrollmentContext {
        get => this.get_EnrollmentContext()
    }

    /**
     * @type {IX509EnrollmentStatus} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {BSTR} 
     */
    CertificateFriendlyName {
        get => this.get_CertificateFriendlyName()
        set => this.put_CertificateFriendlyName(value)
    }

    /**
     * @type {BSTR} 
     */
    CertificateDescription {
        get => this.get_CertificateDescription()
        set => this.put_CertificateDescription(value)
    }

    /**
     * @type {Integer} 
     */
    RequestId {
        get => this.get_RequestId()
    }

    /**
     * @type {BSTR} 
     */
    CAConfigString {
        get => this.get_CAConfigString()
    }

    /**
     * Initializes the enrollment object and creates a default PKCS
     * @param {Integer} Context An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509certificateenrollmentcontext">X509CertificateEnrollmentContext</a> enumeration value that specifies whether the requested enrollment is for a user, a computer, or an administrator acting on behalf of a computer.
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
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-initialize
     */
    Initialize(Context) {
        result := ComCall(7, this, "int", Context, "HRESULT")
        return result
    }

    /**
     * Initializes the enrollment object from a template common name (CN).
     * @param {Integer} Context An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509certificateenrollmentcontext">X509CertificateEnrollmentContext</a> enumeration value that indicates whether the requested enrollment is for a user, a computer, or an administrator acting on behalf of a computer.
     * @param {BSTR} strTemplateName A  <b>BSTR</b> variable that contains the Common Name (CN) of the template as it appears in Active Directory or the dotted decimal <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-initializefromtemplatename
     */
    InitializeFromTemplateName(Context, strTemplateName) {
        strTemplateName := strTemplateName is String ? BSTR.Alloc(strTemplateName).Value : strTemplateName

        result := ComCall(8, this, "int", Context, "ptr", strTemplateName, "HRESULT")
        return result
    }

    /**
     * Initializes the enrollment object from an existing IX509CertificateRequest object.
     * @param {IX509CertificateRequest} pRequest Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequest">IX509CertificateRequest</a> interface.
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
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-initializefromrequest
     */
    InitializeFromRequest(pRequest) {
        result := ComCall(9, this, "ptr", pRequest, "HRESULT")
        return result
    }

    /**
     * Retrieves an encoded certificate request.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to  the DER-encoded request. The default value is <b>XCN_CRYPT_STRING_BASE64</b>.
     * @returns {BSTR} Pointer to a <b>BSTR</b> variable that contains the DER-encoded request.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-createrequest
     */
    CreateRequest(Encoding) {
        pValue := BSTR()
        result := ComCall(10, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Encodes a request, submits it to an appropriate certification authority (CA), and installs the response.
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
     * <dt><b><b>OLE_E_BLANK</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enrollment object has not been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-enroll
     */
    Enroll() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Installs a certificate chain on the end-entity computer.
     * @param {Integer} Restrictions 
     * @param {BSTR} strResponse A <b>BSTR</b> variable that contains the DER-encoded response.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of encoding applied to  the string that contains the DER-encoded response.
     * @param {BSTR} strPassword An optional password for the certificate installation. This can be  <b>NULL</b> or an empty string to indicate that  no password is used.  If there is a password, clear it from memory when you have finished using it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information about protecting the password, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * 
     * Beginning with Windows 8 and Windows Server 2012, a <b>NULL</b> or empty password may mean that the PFX packet was created in the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-pfxexportcertstoreex">PFXExportCertStoreEx</a> function by using the <b>PKCS12_PROTECT_TO_DOMAIN_SIDS</b> flag. If so, the PFX was encrypted to an Active Directory group. For more information, see  <b>PFXExportCertStoreEx</b> and <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-pfximportcertstore">PFXImportCertStore</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-installresponse
     */
    InstallResponse(Restrictions, strResponse, Encoding, strPassword) {
        strResponse := strResponse is String ? BSTR.Alloc(strResponse).Value : strResponse
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(12, this, "int", Restrictions, "ptr", strResponse, "int", Encoding, "ptr", strPassword, "HRESULT")
        return result
    }

    /**
     * Creates a Personal Information Exchange (PFX) message.
     * @param {BSTR} strPassword A <b>BSTR</b> variable that contains a password for the PFX message. This can be  <b>NULL</b> to indicate that  no password is used.  When you have finished using the password, clear it from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information about protecting the password, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @param {Integer} ExportOptions A <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-pfxexportoptions">PFXExportOptions</a> enumeration value that specifies how much of the certificate chain is exported. You can export the certificate only, the certificate chain without the root, or the entire chain.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to  the DER-encoded  message. The default value is <b>XCN_CRYPT_STRING_BASE64</b>.
     * @returns {BSTR} Pointer to a <b>BSTR</b> variable that contains the DER-encoded PFX message.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-createpfx
     */
    CreatePFX(strPassword, ExportOptions, Encoding) {
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        pValue := BSTR()
        result := ComCall(13, this, "ptr", strPassword, "int", ExportOptions, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the certificate request associated with the enrollment object.
     * @remarks
     * 
     * This property can be set when the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-initializefromrequest">InitializeFromRequest</a> method is called.
     * 
     * 
     * @returns {IX509CertificateRequest} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-get_request
     */
    get_Request() {
        result := ComCall(14, this, "ptr*", &pValue := 0, "HRESULT")
        return IX509CertificateRequest(pValue)
    }

    /**
     * Specifies or retrieves a Boolean value that indicates whether a user interface is displayed during the certificate enrollment process.
     * @remarks
     * 
     * You can set this property before initializing the enrollment object.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-get_silent
     */
    get_Silent() {
        result := ComCall(15, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a Boolean value that indicates whether a user interface is displayed during the certificate enrollment process.
     * @remarks
     * 
     * You can set this property before initializing the enrollment object.
     * 
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-put_silent
     */
    put_Silent(Value) {
        result := ComCall(16, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves the ID of the window used to display the enrollment information.
     * @remarks
     * 
     * You can call this property before initializing the enrollment object. If you do not, it may be specified when the object is initialized.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-get_parentwindow
     */
    get_ParentWindow() {
        result := ComCall(17, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves the ID of the window used to display the enrollment information.
     * @remarks
     * 
     * You can call this property before initializing the enrollment object. If you do not, it may be specified when the object is initialized.
     * 
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-put_parentwindow
     */
    put_ParentWindow(Value) {
        result := ComCall(18, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Retrieves a collection of name-value pairs associated with the enrollment object.
     * @remarks
     * 
     * name-value pairs are passed to the certification authority (CA) with the request for the CA to act upon. The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509namevaluepairs">IX509NameValuePairs</a> object is associated with the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollment">IX509Enrollment</a> object when the object is initialized. Therefore, before calling this property, you must initialize the <b>IX509Enrollment</b> object by calling one of the following methods.<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-initialize">Initialize</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-initializefromrequest">InitializeFromRequest</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * 
     * 
     * @returns {IX509NameValuePairs} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-get_namevaluepairs
     */
    get_NameValuePairs() {
        result := ComCall(19, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509NameValuePairs(ppValue)
    }

    /**
     * Retrieves an enrollment context that identifies whether the certificate is intended for a computer or an end-user.
     * @remarks
     * 
     * Before calling this property, you must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollment">IX509Enrollment</a> object by calling one of the following methods.<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-initialize">Initialize</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-initializefromrequest">InitializeFromRequest</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-get_enrollmentcontext
     */
    get_EnrollmentContext() {
        result := ComCall(20, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves an IX509EnrollmentStatus object that can be used to monitor the status of the enrollment process and retrieve error information.
     * @returns {IX509EnrollmentStatus} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-get_status
     */
    get_Status() {
        result := ComCall(21, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509EnrollmentStatus(ppValue)
    }

    /**
     * Retrieves the installed certificate.
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-get_certificate
     */
    get_Certificate(Encoding) {
        pValue := BSTR()
        result := ComCall(22, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the certificate response returned from a certification authority.
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-get_response
     */
    get_Response(Encoding) {
        pValue := BSTR()
        result := ComCall(23, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves the display name of a certificate.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-get_certificatefriendlyname
     */
    get_CertificateFriendlyName() {
        pValue := BSTR()
        result := ComCall(24, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves the display name of a certificate.
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-put_certificatefriendlyname
     */
    put_CertificateFriendlyName(strValue) {
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(25, this, "ptr", strValue, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a string that contains a description of the certificate.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-get_certificatedescription
     */
    get_CertificateDescription() {
        pValue := BSTR()
        result := ComCall(26, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a string that contains a description of the certificate.
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-put_certificatedescription
     */
    put_CertificateDescription(strValue) {
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(27, this, "ptr", strValue, "HRESULT")
        return result
    }

    /**
     * Retrieves a unique identifier for the certificate request sent to the certification authority by the Enroll method.
     * @remarks
     * 
     * The value of the <b>RequestId</b> property is set during the enrollment process. It can be used during subsequent communication between the client and the CA. For example, if a CA marks a request as pending when initially submitted, the client can use the request ID and the configuration string when it again contacts the CA and attempts to retrieve the certificate response. To retrieve the configuration string, call the  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-get_caconfigstring">CAConfigString</a> property.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-get_requestid
     */
    get_RequestId() {
        result := ComCall(28, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the configuration string that identifies the certification authority (CA) to which the certificate request was submitted.
     * @remarks
     * 
     * The configuration string contains the Domain Name System (DNS) name and the common name (CN) of the certification authority. The format of the string is "<i>CAComputerDNSName</i>&#92;<i>CACommonName</i>".
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollment-get_caconfigstring
     */
    get_CAConfigString() {
        pValue := BSTR()
        result := ComCall(29, this, "ptr", pValue, "HRESULT")
        return pValue
    }
}
