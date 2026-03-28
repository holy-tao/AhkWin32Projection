#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IX509EnrollmentPolicyServer.ahk
#Include .\IX509CertificateTemplate.ahk
#Include .\IX509CertificateRequestCmc.ahk

/**
 * The IX509CertificateRequestCmc2 interface represents a CMC (Certificate Management Message over CMS) certificate request.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509certificaterequestcmc2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateRequestCmc2 extends IX509CertificateRequestCmc{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509CertificateRequestCmc2
     * @type {Guid}
     */
    static IID => Guid("{728ab35d-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 63

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromTemplate", "InitializeFromInnerRequestTemplate", "get_PolicyServer", "get_Template", "CheckSignature", "CheckCertificateSignature"]

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
     * Initializes the certificate request by using a template. (IX509CertificateRequestCmc2.InitializeFromTemplate)
     * @remarks
     * The <b>InitializeFromTemplate</b> method creates the following collections:<ul>
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
     * <li>Populates many of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> properties from the template settings.</li>
     * </ul>
     * 
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_cspinformations">CSPInformations</a> property is <b>NULL</b>, the method creates an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformations">ICspInformations</a> collection from the providers installed on the computer.
     * @param {Integer} _context 
     * @param {IX509EnrollmentPolicyServer} pPolicyServer Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmentpolicyserver">IX509EnrollmentPolicyServer</a> object that represents the certificate enrollment policy (CEP) server that contains the template specified by the <i>pTemplate</i> parameter.
     * @param {IX509CertificateTemplate} pTemplate Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificatetemplate">IX509CertificateTemplate</a> object that represents the template to use during initialization.
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
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate request object has already been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc2-initializefromtemplate
     */
    InitializeFromTemplate(_context, pPolicyServer, pTemplate) {
        result := ComCall(63, this, "int", _context, "ptr", pPolicyServer, "ptr", pTemplate, "HRESULT")
        return result
    }

    /**
     * Initializes the certificate request from an inner request object and a template.
     * @remarks
     * By specifying a template, you can add information to the outer request object that may not be contained in the inner request. For example, if the inner request does not contain the necessary extensions, you can supply a template that does.
     * 
     * The <b>InitializeFromInnerRequestTemplate</b> method:<ul>
     * <li>Creates an empty <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icryptattributes">ICryptAttributes</a> collection.</li>
     * <li>Creates an empty <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509namevaluepairs">IX509NameValuePairs</a> collection.</li>
     * <li>Creates an empty <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensions">IX509Extensions</a> collection.</li>
     * <li>Creates an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a> collection for  critical extensions and adds the XCN_OID_KEY_USAGE and XCN_OID_BASIC_CONSTRAINTS2 object identifiers (OIDs).</li>
     * <li>Creates an empty <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a> collection of OIDs to be suppressed from the request object.</li>
     * <li>Creates an empty <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-isignercertificates">ISignerCertificates</a> collection.</li>
     * <li>Retrieves private key flags from the template.</li>
     * <li>Sets the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_archiveprivatekey">ArchivePrivateKey</a> property if required by the template flags or settings.</li>
     * <li>Retrieves the encryption algorithm from the template if one is specified and sets the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_encryptionalgorithm">EncryptionAlgorithm</a> property.</li>
     * <li>Sets the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_encryptionstrength">EncryptionStrength</a> property if possible.</li>
     * </ul>
     * @param {IX509CertificateRequest} pInnerRequest Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequest">IX509CertificateRequest</a> interface that represents the inner request object. This can be a PKCS #10 or  a CMC request.
     * @param {IX509EnrollmentPolicyServer} pPolicyServer Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmentpolicyserver">IX509EnrollmentPolicyServer</a> object that represents the certificate enrollment policy (CEP) server that contains the template specified by the <i>pTemplate</i> parameter.
     * @param {IX509CertificateTemplate} pTemplate Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificatetemplate">IX509CertificateTemplate</a> object that represents the template to use during initialization.
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
     * The request object passed to the <i>pInnerRequest</i> parameter must be a PKCS #10 or a CMC request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pInnerRequest</i>, <i>pPolicyServer</i>, and <i>pTemplate</i> parameters cannot be <b>NULL</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc2-initializefrominnerrequesttemplate
     */
    InitializeFromInnerRequestTemplate(pInnerRequest, pPolicyServer, pTemplate) {
        result := ComCall(64, this, "ptr", pInnerRequest, "ptr", pPolicyServer, "ptr", pTemplate, "HRESULT")
        return result
    }

    /**
     * Retrieves the certificate enrollment policy (CEP) server that contains the template used during initialization. (IX509CertificateRequestCmc2.get_PolicyServer)
     * @returns {IX509EnrollmentPolicyServer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc2-get_policyserver
     */
    get_PolicyServer() {
        result := ComCall(65, this, "ptr*", &ppPolicyServer := 0, "HRESULT")
        return IX509EnrollmentPolicyServer(ppPolicyServer)
    }

    /**
     * Retrieves the certificate request template used during initialization. (IX509CertificateRequestCmc2.get_Template)
     * @returns {IX509CertificateTemplate} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc2-get_template
     */
    get_Template() {
        result := ComCall(66, this, "ptr*", &ppTemplate := 0, "HRESULT")
        return IX509CertificateTemplate(ppTemplate)
    }

    /**
     * Verifies that the certificate request has been signed and that the signature is valid. (IX509CertificateRequestCmc2.CheckSignature)
     * @remarks
     * This method uses the public key to decrypt the signature and compares the signature to a hash of the certificate request.
     * @param {Integer} AllowedSignatureTypes 
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
     * <dt><b>CRYPT_E_NO_SIGNER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate request has not been signed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The signature type is not specified by the <i>AllowedSignatureTypes</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NTE_BAD_SIGNATURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified by the <i>AllowedSignatureTypes</i> parameter is not a member of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-pkcs10allowedsignaturetypes">Pkcs10AllowedSignatureTypes</a> enumeration type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc2-checksignature
     */
    CheckSignature(AllowedSignatureTypes) {
        result := ComCall(67, this, "int", AllowedSignatureTypes, "HRESULT")
        return result
    }

    /**
     * Verifies the signature for a specified signer.
     * @param {ISignerCertificate} pSignerCertificate Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-isignercertificate">ISignerCertificate</a> interface that represents a signing certificate.
     * @param {VARIANT_BOOL} ValidateCertificateChain A Boolean value that specifies whether to also verify the certificate chain. This parameter can be <b>NULL</b>.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pSignerCertificate</i> parameter cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERTSRV_E_PROPERTY_EMPTY</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A signer certificate cannot be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc2-checkcertificatesignature
     */
    CheckCertificateSignature(pSignerCertificate, ValidateCertificateChain) {
        result := ComCall(68, this, "ptr", pSignerCertificate, "short", ValidateCertificateChain, "HRESULT")
        return result
    }
}
