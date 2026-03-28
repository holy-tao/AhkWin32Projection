#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IX509EnrollmentPolicyServer.ahk
#Include .\IX509CertificateTemplate.ahk
#Include .\IX509CertificateRequestPkcs7.ahk

/**
 * The IX509CertificateRequestPkcs7V2 interface represents a PKCS
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509certificaterequestpkcs7v2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateRequestPkcs7V2 extends IX509CertificateRequestPkcs7{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509CertificateRequestPkcs7V2
     * @type {Guid}
     */
    static IID => Guid("{728ab35c-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 40

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromTemplate", "get_PolicyServer", "get_Template", "CheckCertificateSignature"]

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
     * Initializes the certificate request by using a template. (IX509CertificateRequestPkcs7V2.InitializeFromTemplate)
     * @remarks
     * The <b>InitializeFromTemplate</b> method creates a PKCS #7 request object and sets the following properties to the values that existed before this method was called:
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
     * <li>Populates many of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> properties from the template settings.</li>
     * </ul>
     * 
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_cspinformations">CSPInformations</a> property is <b>NULL</b>, the method creates an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformations">ICspInformations</a> collection from the providers installed on the computer.
     * 
     * Finally, the method sets the initialized PKCS #10 request as the inner request object.
     * @param {Integer} _context 
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pTemplate</i> parameter cannot be  <b>NULL</b>.
     * 
     * </td>
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7v2-initializefromtemplate
     */
    InitializeFromTemplate(_context, pPolicyServer, pTemplate) {
        result := ComCall(40, this, "int", _context, "ptr", pPolicyServer, "ptr", pTemplate, "HRESULT")
        return result
    }

    /**
     * Retrieves the certificate enrollment policy (CEP) server that contains the template used during initialization. (IX509CertificateRequestPkcs7V2.get_PolicyServer)
     * @returns {IX509EnrollmentPolicyServer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7v2-get_policyserver
     */
    get_PolicyServer() {
        result := ComCall(41, this, "ptr*", &ppPolicyServer := 0, "HRESULT")
        return IX509EnrollmentPolicyServer(ppPolicyServer)
    }

    /**
     * Retrieves the certificate request template used during initialization. (IX509CertificateRequestPkcs7V2.get_Template)
     * @returns {IX509CertificateTemplate} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7v2-get_template
     */
    get_Template() {
        result := ComCall(42, this, "ptr*", &ppTemplate := 0, "HRESULT")
        return IX509CertificateTemplate(ppTemplate)
    }

    /**
     * Verifies the certificate signature.
     * @remarks
     * A PKCS #7 request has exactly one certificate-based signature.
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7v2-checkcertificatesignature
     */
    CheckCertificateSignature(ValidateCertificateChain) {
        result := ComCall(43, this, "short", ValidateCertificateChain, "HRESULT")
        return result
    }
}
