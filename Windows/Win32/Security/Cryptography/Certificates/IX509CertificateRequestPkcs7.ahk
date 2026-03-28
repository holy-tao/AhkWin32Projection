#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ISignerCertificate.ahk
#Include .\IX509CertificateRequest.ahk

/**
 * The IX509CertificateRequestPkcs7 interface represents a PKCS
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509certificaterequestpkcs7
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateRequestPkcs7 extends IX509CertificateRequest{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509CertificateRequestPkcs7
     * @type {Guid}
     */
    static IID => Guid("{728ab344-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromTemplateName", "InitializeFromCertificate", "InitializeFromInnerRequest", "InitializeDecode", "get_RequesterName", "put_RequesterName", "get_SignerCertificate", "put_SignerCertificate"]

    /**
     * @type {BSTR} 
     */
    RequesterName {
        get => this.get_RequesterName()
        set => this.put_RequesterName(value)
    }

    /**
     * @type {ISignerCertificate} 
     */
    SignerCertificate {
        get => this.get_SignerCertificate()
        set => this.put_SignerCertificate(value)
    }

    /**
     * Initializes the certificate request by using a template. (IX509CertificateRequestPkcs7.InitializeFromTemplateName)
     * @remarks
     * The <b>InitializeFromTemplateName</b> method creates a PKCS #7 request object and sets the following properties to the values that existed before this method was called:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_cspinformations">CspInformations</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_parentwindow">ParentWindow</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_silent">Silent</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_uicontextmessage">UIContextMessage</a>
     * </li>
     * </ul>
     * The method creates the following collections:<ul>
     * <li>An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icryptattributes">ICryptAttributes</a> collection.</li>
     * <li>An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensions">IX509Extensions</a> collection.</li>
     * <li>An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a> collection populated with the default XCN_OID_KEY_USAGE and XCN_OID_BASIC_CONSTRAINTS2 object identifiers.</li>
     * <li>An empty <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a> collection for attribute and extension OIDs to be suppressed from the new request.</li>
     * </ul>
     * 
     * 
     * The method then examines the template and performs the following actions:<ul>
     * <li>Adds the extensions specified by the template to the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensions">IX509Extensions</a> collection.</li>
     * <li>Removes the default critical extensions (XCN_OID_KEY_USAGE and XCN_OID_BASIC_CONSTRAINTS2) from the collection if the template indicates that they are not critical. The OIDs marked critical by the template are added.</li>
     * <li>Sets the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_smimecapabilities">SmimeCapabilities</a> property if the template supports symmetric algorithms.</li>
     * <li>Sets the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_alternatesignaturealgorithm">AlternateSignatureAlgorithm</a> property if the template requires a discrete signature algorithm OID.</li>
     * <li>Creates an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509signatureinformation">IX509SignatureInformation</a> object.</li>
     * <li>Creates a hash algorithm OID if the algorithm is specified in the template and sets it on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509signatureinformation">IX509SignatureInformation</a> object.</li>
     * <li>Creates an asymmetric encryption algorithm OID if the algorithm is specified in the template and sets it on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509signatureinformation">IX509SignatureInformation</a> object.</li>
     * <li>Sets the following <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> properties from the template settings:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyusage">KeyUsage</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_length">Length</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_exportpolicy">ExportPolicy</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyprotection">KeyProtection</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_securitydescriptor">SecurityDescriptor</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_silent">Silent</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_machinecontext">MachineContext</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_algorithm">Algorithm</a>
     * </li>
     * </ul>
     * </li>
     * </ul>
     * 
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_cspinformations">CSPInformations</a> property is <b>NULL</b>, the method creates an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformations">ICspInformations</a> collection from the providers installed on the computer.
     * 
     * Finally, the method sets the initialized PKCS #10 request as the inner request object.
     * @param {Integer} _Context 
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
     * <dt><b><b>ERROR_ALREADY_INITIALIZED</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate request object has already been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializefromtemplatename
     */
    InitializeFromTemplateName(_Context, strTemplateName) {
        strTemplateName := strTemplateName is String ? BSTR.Alloc(strTemplateName).Value : strTemplateName

        result := ComCall(32, this, "int", _Context, "ptr", strTemplateName, "HRESULT")
        return result
    }

    /**
     * Initializes the certificate request by using an existing certificate. (IX509CertificateRequestPkcs7.InitializeFromCertificate)
     * @remarks
     * The <b>InitializeFromCertificate</b> method validates the options specified in the <i>InheritOptions</i> parameter and initializes a new PKCS #7  request object by performing the following actions:<ul>
     * <li>Creates a PKCS #10 request object from the certificate, enrollment context, and inherit options specified on input. The PKCS #10 object inherits:<ul>
     * <li>The template if one exists in the original certificate and you set the <b>InheritTemplateFlag</b> value.</li>
     * <li>The subject distinguished name if you specify <b>InheritSubjectFlag</b>.</li>
     * <li>The subject alternative name if you specify <b>InheritSubjectAltNameFlag</b>.</li>
     * <li>The extensions if you specify <b>InheritExtensionsFlag</b>.</li>
     * </ul>
     * </li>
     * <li>Copies the original certificate, if it is to be renewed,  to the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_renewalcertificate">RenewalCertificate</a> property on the new PKCS #10 request.</li>
     * <li>Creates an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-isignercertificate">ISignerCertificate</a> from the original certificate, if it is to be renewed, and sets it on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-get_signercertificate">SignerCertificate</a> property.</li>
     * <li>Sets the PKCS #10 request  as the inner request object.</li>
     * </ul>
     * @param {Integer} _Context 
     * @param {VARIANT_BOOL} RenewalRequest A <b>VARIANT_BOOL</b> that indicates whether the end entity is requesting that the certificate identified by the  <i>strCertificate</i> parameter be renewed.
     * @param {BSTR} strCertificate A <b>BSTR</b> variable that contains the DER-encoded  certificate.
     * 
     * Beginning with Windows 7 and Windows Server 2008 R2, you can specify a certificate thumb print or serial number rather than an encoded certificate. Doing so causes the function to search the appropriate local stores for the matching certificate. Keep in mind the following points:
     * 
     * <ul>
     * <li>The <b>BSTR</b> must be an even number of hexadecimal digits.</li>
     * <li>Whitespace between hexadecimal pairs is ignored.</li>
     * <li>The <i>Encoding</i> parameter must be set to <b>XCN_CRYPT_STRING_HEXRAW</b>.</li>
     * <li>The <i>Context</i> parameter determines whether the local or computer stores or both are searched.</li>
     * <li>If a private key is needed, only the personal and request stores are searched.</li>
     * <li>If a private key is not needed, the root and intermediate CA stores are also searched.</li>
     * </ul>
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of encoding applied to  the DER-encoded  certificate. The default value is <b>XCN_CRYPT_STRING_BASE64</b>.
     * @param {Integer} InheritOptions 
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
     * <dt><b>ERROR_ALREADY_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate request object has already been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializefromcertificate
     */
    InitializeFromCertificate(_Context, RenewalRequest, strCertificate, Encoding, InheritOptions) {
        strCertificate := strCertificate is String ? BSTR.Alloc(strCertificate).Value : strCertificate

        result := ComCall(33, this, "int", _Context, "short", RenewalRequest, "ptr", strCertificate, "int", Encoding, "int", InheritOptions, "HRESULT")
        return result
    }

    /**
     * Initializes the certificate request from the inner PKCS
     * @remarks
     * This method sets the inner request object to the PKCS #10 request specified on input.
     * @param {IX509CertificateRequest} pInnerRequest Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequest">IX509CertificateRequest</a> interface that represents the request.
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
     * <dt><b><b>CRYPT_E_INVALID_MSG_TYPE</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request object specified on input is not a PKCS #10 request.
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
     * The request object has already been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializefrominnerrequest
     */
    InitializeFromInnerRequest(pInnerRequest) {
        result := ComCall(34, this, "ptr", pInnerRequest, "HRESULT")
        return result
    }

    /**
     * Decodes an existing signed or unsigned PKCS (IX509CertificateRequestPkcs7.InitializeDecode)
     * @remarks
     * The <b>InitializeDecode</b> method:<ul>
     * <li>Decodes the PKCS #7 request specified on input.</li>
     * <li>Uses the decoded object to create an inner PKCS #10 request with the following collections:<ul>
     * <li>An empty <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icryptattributes">ICryptAttributes</a> collection.</li>
     * <li>An empty <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensions">IX509Extensions</a> collection.</li>
     * <li>An empty <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a> collection for critical extensions.</li>
     * <li>An empty <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a> collection for attribute and extension OIDs to be suppressed from the new request.</li>
     * </ul>
     * </li>
     * <li>Adds the decoded extensions to the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensions">IX509Extensions</a> collection.</li>
     * <li>Adds the decoded attributes to the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icryptattributes">ICryptAttributes</a> collection</li>
     * <li>Sets the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_clientid">ClientId</a> property.</li>
     * <li>Sets the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_templateobjectid">TemplateObjectId</a> property.</li>
     * <li>Uses the signature on the original PKCS #7 request to create a new <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-isignercertificate">ISignerCertificate</a> object.</li>
     * <li>Retrieves an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509signatureinformation">IX509SignatureInformation</a> object from the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-isignercertificate">ISignerCertificate</a> object.</li>
     * <li>Initializes the new <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509signatureinformation">IX509SignatureInformation</a> object by using the original signature and hash algorithms.</li>
     * <li>Sets the PKCS #10 request as the inner request object.</li>
     * </ul>
     * 
     * 
     * By default, the <b>InitializeDecode</b> method assumes that the certificate request to be decoded is for an end user. Beginning with Windows 8 and Windows Server 2012, you can change this default behavior. After creating an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs7">IX509CertificateRequestPkcs7</a> interface, call <b>InitializeDecode</b> by setting the  <i>Encoding</i> parameter to <b>XCN_CRYPT_STRING_BINARY</b> and the <i>strEncodedData</i> parameter to one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>L"ContextMachine"</td>
     * <td>The encoded certificate request is for a computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>L"ContextUser"</td>
     * <td>The encoded certificate request is for an end user.</td>
     * </tr>
     * <tr>
     * <td>L"ContextAdministratorForceMachine"</td>
     * <td>The encoded certificate is being requested by an administrator acting on the behalf of a computer.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Then, call the <b>InitializeDecode</b> method again with the encoded certificate set in the <i>strEncodedData</i> argument.
     * @param {BSTR} strEncodedData A <b>BSTR</b> variable that contains the DER-encoded  request.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to  the input string that contains the DER-encoded  request. The default value is <b>XCN_CRYPT_STRING_BASE64</b>.
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
     * The request object has already been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializedecode
     */
    InitializeDecode(strEncodedData, Encoding) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(35, this, "ptr", strEncodedData, "int", Encoding, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a string that contains the Security Account Manager (SAM) name of the end-entity requesting the certificate. (Get)
     * @remarks
     * This property is only used when the enrollment agent is enrolling on behalf of another user. You must initialize the PKCS #7 request object before calling this property. For more information, see the following topics:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-initialize">Initialize</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializefrominnerrequest">InitializeFromInnerRequest</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-get_requestername
     */
    get_RequesterName() {
        pValue := BSTR()
        result := ComCall(36, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a string that contains the Security Account Manager (SAM) name of the end-entity requesting the certificate. (Put)
     * @remarks
     * This property is only used when the enrollment agent is enrolling on behalf of another user. You must initialize the PKCS #7 request object before calling this property. For more information, see the following topics:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-initialize">Initialize</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializefrominnerrequest">InitializeFromInnerRequest</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-put_requestername
     */
    put_RequesterName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(37, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a certificate used to sign the certificate request. (Get)
     * @remarks
     * You must initialize the PKCS #7 request object before calling this property. For more information, see the following topics:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-initialize">Initialize</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializefrominnerrequest">InitializeFromInnerRequest</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @returns {ISignerCertificate} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-get_signercertificate
     */
    get_SignerCertificate() {
        result := ComCall(38, this, "ptr*", &ppValue := 0, "HRESULT")
        return ISignerCertificate(ppValue)
    }

    /**
     * Specifies or retrieves a certificate used to sign the certificate request. (Put)
     * @remarks
     * You must initialize the PKCS #7 request object before calling this property. For more information, see the following topics:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-initialize">Initialize</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializefrominnerrequest">InitializeFromInnerRequest</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @param {ISignerCertificate} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-put_signercertificate
     */
    put_SignerCertificate(pValue) {
        result := ComCall(39, this, "ptr", pValue, "HRESULT")
        return result
    }
}
