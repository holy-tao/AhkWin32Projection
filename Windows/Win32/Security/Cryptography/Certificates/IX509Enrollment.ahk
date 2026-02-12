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
 * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nn-certenroll-ix509enrollment
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
     * @remarks
     * The <b>Initialize</b> method creates a new key pair and initializes empty collections for the attributes, extensions and critical extensions associated with the request.
     * @param {Integer} Context_ An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509certificateenrollmentcontext">X509CertificateEnrollmentContext</a> enumeration value that specifies whether the requested enrollment is for a user, a computer, or an administrator acting on behalf of a computer.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-initialize
     */
    Initialize(Context_) {
        result := ComCall(7, this, "int", Context_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes the enrollment object from a template common name (CN).
     * @remarks
     * The <b>InitializeFromTemplateName</b> method:
     * 
     * <ul>
     * <li>Examines the template to determine the type of request needed.</li>
     * <li>Creates the appropriate type of request object (PKCS #10, PKCS #7, or CMC).</li>
     * <li>Sets the following properties on the request if values currently exist:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_cspinformations">CspInformations</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_parentwindow">ParentWindow</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_silent">Silent</a>
     * </li>
     * </ul>
     * </li>
     * <li>Initializes the request object by using the template.</li>
     * <li>Retrieves the signature count, issuance policies, and application policies from the template.</li>
     * </ul>
     * @param {Integer} Context_ An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509certificateenrollmentcontext">X509CertificateEnrollmentContext</a> enumeration value that indicates whether the requested enrollment is for a user, a computer, or an administrator acting on behalf of a computer.
     * @param {BSTR} strTemplateName A  <b>BSTR</b> variable that contains the Common Name (CN) of the template as it appears in Active Directory or the dotted decimal <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a>.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-initializefromtemplatename
     */
    InitializeFromTemplateName(Context_, strTemplateName) {
        if(strTemplateName is String) {
            pin := BSTR.Alloc(strTemplateName)
            strTemplateName := pin.Value
        }

        result := ComCall(8, this, "int", Context_, "ptr", strTemplateName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes the enrollment object from an existing IX509CertificateRequest object.
     * @remarks
     * The <b>InitializeFromRequest</b>  method:
     * 
     * <ul>
     * <li>Verifies that the request is a PKCS #10, PKCS #7, or CMC request object.</li>
     * <li>Retrieves the template, if any, associated with the request.</li>
     * <li>Validates the template.</li>
     * <li>Sets the request object on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-get_request">Request</a> property.</li>
     * <li>Retrieves the signature count, issuance policies, and application policies from the template.</li>
     * <li>Retrieves the renewal certificate if one exists.</li>
     * </ul>
     * @param {IX509CertificateRequest} pRequest Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequest">IX509CertificateRequest</a> interface.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-initializefromrequest
     */
    InitializeFromRequest(pRequest) {
        result := ComCall(9, this, "ptr", pRequest, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves an encoded certificate request.
     * @remarks
     * The <b>CreateRequest</b> method calls the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method, if necessary, to encode the raw data from the associated request object.
     * 
     * This method uses the information provided during initialization and other properties that have been specified, creates a dummy certificate and places it in the request store. The method also creates a key pair if necessary. Depending on how you initialize the enrollment object and on what properties you set, there may be no need to create a key pair. For example, if you are renewing a certificate by using an existing key, or if the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> object associated with the certificate request represents an existing key, this method does not create a new key pair.
     * 
     * If a smartcard is involved, this method encodes external properties as extensions, includes them in the dummy certificate, and writes the dummy certificate to the smartcard key container. Smartcard logon certificates are encoded to the request store, not the personal store.
     * 
     * Before calling the <b>CreateRequest</b> method, you must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollment">IX509Enrollment</a> object by calling one of the following methods.<ul>
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
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to  the DER-encoded request. The default value is <b>XCN_CRYPT_STRING_BASE64</b>.
     * @returns {BSTR} Pointer to a <b>BSTR</b> variable that contains the DER-encoded request.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-createrequest
     */
    CreateRequest(Encoding) {
        pValue := BSTR()
        result := ComCall(10, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Encodes a request, submits it to an appropriate certification authority (CA), and installs the response.
     * @remarks
     * The method may create a key pair if necessary. Depending on how you initialize the enrollment object and on what properties you set, there may be no need to create a key pair. For example, if you are renewing a certificate by using an existing key, or if the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> object associated with the certificate request represents an existing key, this method does not create a new key pair.
     * 
     * Before enrolling, you must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollment">IX509Enrollment</a> object by calling one of the following methods.<ul>
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
     * If the enrollment operation succeeds, the function  returns <b>S_OK</b>. However, this does not necessarily mean that the response from the CA was installed. Call  the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-get_status">Status</a> property to determine the enrollment status.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-enroll
     */
    Enroll() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Installs a certificate chain on the end-entity computer. (IX509Enrollment.InstallResponse)
     * @remarks
     * The <b>InstallResponse</b> method:
     * 
     * <ol>
     * <li>Retrieves the dummy certificate from the external store.</li>
     * <li>Retrieves the certificate contained in the response and installs it on the computer.</li>
     * <li>Copies properties from the dummy certificate in the external store onto the newly installed certificate in the personal store.</li>
     * </ol>
     * 
     * 
     * Before calling the <b>InstallResponse</b> method, you must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollment">IX509Enrollment</a> object by calling one of the following methods.<ul>
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
     * If you call this method from the web, you can specify only <b>AllowNone</b> or <b>AllowUntrustedRoot</b> in the <i>Restrictions</i> parameter. If you specify <b>AllowNoOutstandingRequest</b> or <b>AllowUntrustedCertificate</b>, the method returns an <b>E_ACCESSDENIED</b> error.
     * @param {Integer} Restrictions_ 
     * @param {BSTR} strResponse A <b>BSTR</b> variable that contains the DER-encoded response.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of encoding applied to  the string that contains the DER-encoded response.
     * @param {BSTR} strPassword An optional password for the certificate installation. This can be  <b>NULL</b> or an empty string to indicate that  no password is used.  If there is a password, clear it from memory when you have finished using it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information about protecting the password, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * 
     * Beginning with Windows 8 and Windows Server 2012, a <b>NULL</b> or empty password may mean that the PFX packet was created in the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-pfxexportcertstoreex">PFXExportCertStoreEx</a> function by using the <b>PKCS12_PROTECT_TO_DOMAIN_SIDS</b> flag. If so, the PFX was encrypted to an Active Directory group. For more information, see  <b>PFXExportCertStoreEx</b> and <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-pfximportcertstore">PFXImportCertStore</a>.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-installresponse
     */
    InstallResponse(Restrictions_, strResponse, Encoding, strPassword) {
        if(strResponse is String) {
            pin := BSTR.Alloc(strResponse)
            strResponse := pin.Value
        }
        if(strPassword is String) {
            pin := BSTR.Alloc(strPassword)
            strPassword := pin.Value
        }

        result := ComCall(12, this, "int", Restrictions_, "ptr", strResponse, "int", Encoding, "ptr", strPassword, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a Personal Information Exchange (PFX) message.
     * @remarks
     * The PFX format is also known as PKCS #12. The <b>CreatePFX</b> method:<ul>
     * <li>Opens the certificate store in memory for the default provider.</li>
     * <li>Adds the installed certificate to the store or builds the certificate chain adds a link to it.</li>
     * <li>Exports the certificate and the private key to a PFX message depending on the export options specified.</li>
     * <li>Encodes the exported message by using DER.</li>
     * </ul>
     * 
     * 
     * Before calling this method, you must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollment">IX509Enrollment</a> object by calling one of the following methods.<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-initialize">Initialize</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-initializefromrequest">InitializeFromRequest</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>Further, you must return successfully from the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-enroll">Enroll</a> method.
     * @param {BSTR} strPassword A <b>BSTR</b> variable that contains a password for the PFX message. This can be  <b>NULL</b> to indicate that  no password is used.  When you have finished using the password, clear it from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information about protecting the password, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @param {Integer} ExportOptions A <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-pfxexportoptions">PFXExportOptions</a> enumeration value that specifies how much of the certificate chain is exported. You can export the certificate only, the certificate chain without the root, or the entire chain.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to  the DER-encoded  message. The default value is <b>XCN_CRYPT_STRING_BASE64</b>.
     * @returns {BSTR} Pointer to a <b>BSTR</b> variable that contains the DER-encoded PFX message.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-createpfx
     */
    CreatePFX(strPassword, ExportOptions, Encoding) {
        if(strPassword is String) {
            pin := BSTR.Alloc(strPassword)
            strPassword := pin.Value
        }

        pValue := BSTR()
        result := ComCall(13, this, "ptr", strPassword, "int", ExportOptions, "int", Encoding, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Retrieves the certificate request associated with the enrollment object.
     * @remarks
     * This property can be set when the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-initializefromrequest">InitializeFromRequest</a> method is called.
     * @returns {IX509CertificateRequest} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-get_request
     */
    get_Request() {
        result := ComCall(14, this, "ptr*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IX509CertificateRequest(pValue)
    }

    /**
     * Specifies or retrieves a Boolean value that indicates whether a user interface is displayed during the certificate enrollment process. (Get)
     * @remarks
     * You can set this property before initializing the enrollment object.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-get_silent
     */
    get_Silent() {
        result := ComCall(15, this, "short*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Specifies or retrieves a Boolean value that indicates whether a user interface is displayed during the certificate enrollment process. (Put)
     * @remarks
     * You can set this property before initializing the enrollment object.
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-put_silent
     */
    put_Silent(Value) {
        result := ComCall(16, this, "short", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies or retrieves the ID of the window used to display the enrollment information. (Get)
     * @remarks
     * You can call this property before initializing the enrollment object. If you do not, it may be specified when the object is initialized.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-get_parentwindow
     */
    get_ParentWindow() {
        result := ComCall(17, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Specifies or retrieves the ID of the window used to display the enrollment information. (Put)
     * @remarks
     * You can call this property before initializing the enrollment object. If you do not, it may be specified when the object is initialized.
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-put_parentwindow
     */
    put_ParentWindow(Value) {
        result := ComCall(18, this, "int", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a collection of name-value pairs associated with the enrollment object.
     * @remarks
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
     * @returns {IX509NameValuePairs} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-get_namevaluepairs
     */
    get_NameValuePairs() {
        result := ComCall(19, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IX509NameValuePairs(ppValue)
    }

    /**
     * Retrieves an enrollment context that identifies whether the certificate is intended for a computer or an end-user.
     * @remarks
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-get_enrollmentcontext
     */
    get_EnrollmentContext() {
        result := ComCall(20, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Retrieves an IX509EnrollmentStatus object that can be used to monitor the status of the enrollment process and retrieve error information.
     * @returns {IX509EnrollmentStatus} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-get_status
     */
    get_Status() {
        result := ComCall(21, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IX509EnrollmentStatus(ppValue)
    }

    /**
     * Retrieves the installed certificate.
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-get_certificate
     */
    get_Certificate(Encoding) {
        pValue := BSTR()
        result := ComCall(22, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Retrieves the certificate response returned from a certification authority.
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-get_response
     */
    get_Response(Encoding) {
        pValue := BSTR()
        result := ComCall(23, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Specifies or retrieves the display name of a certificate. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-get_certificatefriendlyname
     */
    get_CertificateFriendlyName() {
        pValue := BSTR()
        result := ComCall(24, this, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Specifies or retrieves the display name of a certificate. (Put)
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-put_certificatefriendlyname
     */
    put_CertificateFriendlyName(strValue) {
        if(strValue is String) {
            pin := BSTR.Alloc(strValue)
            strValue := pin.Value
        }

        result := ComCall(25, this, "ptr", strValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies or retrieves a string that contains a description of the certificate. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-get_certificatedescription
     */
    get_CertificateDescription() {
        pValue := BSTR()
        result := ComCall(26, this, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Specifies or retrieves a string that contains a description of the certificate. (Put)
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-put_certificatedescription
     */
    put_CertificateDescription(strValue) {
        if(strValue is String) {
            pin := BSTR.Alloc(strValue)
            strValue := pin.Value
        }

        result := ComCall(27, this, "ptr", strValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a unique identifier for the certificate request sent to the certification authority by the Enroll method.
     * @remarks
     * The value of the <b>RequestId</b> property is set during the enrollment process. It can be used during subsequent communication between the client and the CA. For example, if a CA marks a request as pending when initially submitted, the client can use the request ID and the configuration string when it again contacts the CA and attempts to retrieve the certificate response. To retrieve the configuration string, call the  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollment-get_caconfigstring">CAConfigString</a> property.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-get_requestid
     */
    get_RequestId() {
        result := ComCall(28, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Retrieves the configuration string that identifies the certification authority (CA) to which the certificate request was submitted.
     * @remarks
     * The configuration string contains the Domain Name System (DNS) name and the common name (CN) of the certification authority. The format of the string is "<i>CAComputerDNSName</i>&#92;<i>CACommonName</i>".
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509enrollment-get_caconfigstring
     */
    get_CAConfigString() {
        pValue := BSTR()
        result := ComCall(29, this, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }
}
