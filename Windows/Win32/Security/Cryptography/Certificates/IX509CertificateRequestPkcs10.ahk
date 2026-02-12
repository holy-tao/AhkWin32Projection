#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IObjectId.ahk
#Include .\IX509PublicKey.ahk
#Include .\IX509PrivateKey.ahk
#Include .\IX500DistinguishedName.ahk
#Include .\ICspStatuses.ahk
#Include .\IX509SignatureInformation.ahk
#Include .\ICryptAttributes.ahk
#Include .\IX509Extensions.ahk
#Include .\IObjectIds.ahk
#Include .\IX509CertificateRequest.ahk

/**
 * The IX509CertificateRequestPkcs10 interface represents a PKCS
 * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nn-certenroll-ix509certificaterequestpkcs10
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateRequestPkcs10 extends IX509CertificateRequest{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509CertificateRequestPkcs10
     * @type {Guid}
     */
    static IID => Guid("{728ab342-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromTemplateName", "InitializeFromPrivateKey", "InitializeFromPublicKey", "InitializeFromCertificate", "InitializeDecode", "CheckSignature", "IsSmartCard", "get_TemplateObjectId", "get_PublicKey", "get_PrivateKey", "get_NullSigned", "get_ReuseKey", "get_OldCertificate", "get_Subject", "put_Subject", "get_CspStatuses", "get_SmimeCapabilities", "put_SmimeCapabilities", "get_SignatureInformation", "get_KeyContainerNamePrefix", "put_KeyContainerNamePrefix", "get_CryptAttributes", "get_X509Extensions", "get_CriticalExtensions", "get_SuppressOids", "get_RawDataToBeSigned", "get_Signature", "GetCspStatuses"]

    /**
     * @type {IObjectId} 
     */
    TemplateObjectId {
        get => this.get_TemplateObjectId()
    }

    /**
     * @type {IX509PublicKey} 
     */
    PublicKey {
        get => this.get_PublicKey()
    }

    /**
     * @type {IX509PrivateKey} 
     */
    PrivateKey {
        get => this.get_PrivateKey()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    NullSigned {
        get => this.get_NullSigned()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ReuseKey {
        get => this.get_ReuseKey()
    }

    /**
     * @type {IX500DistinguishedName} 
     */
    Subject {
        get => this.get_Subject()
        set => this.put_Subject(value)
    }

    /**
     * @type {ICspStatuses} 
     */
    CspStatuses {
        get => this.get_CspStatuses()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    SmimeCapabilities {
        get => this.get_SmimeCapabilities()
        set => this.put_SmimeCapabilities(value)
    }

    /**
     * @type {IX509SignatureInformation} 
     */
    SignatureInformation {
        get => this.get_SignatureInformation()
    }

    /**
     * @type {BSTR} 
     */
    KeyContainerNamePrefix {
        get => this.get_KeyContainerNamePrefix()
        set => this.put_KeyContainerNamePrefix(value)
    }

    /**
     * @type {ICryptAttributes} 
     */
    CryptAttributes {
        get => this.get_CryptAttributes()
    }

    /**
     * @type {IX509Extensions} 
     */
    X509Extensions {
        get => this.get_X509Extensions()
    }

    /**
     * @type {IObjectIds} 
     */
    CriticalExtensions {
        get => this.get_CriticalExtensions()
    }

    /**
     * @type {IObjectIds} 
     */
    SuppressOids {
        get => this.get_SuppressOids()
    }

    /**
     * . (IX509CertificateRequestPkcs10.InitializeFromTemplateName)
     * @remarks
     * The <b>InitializeFromTemplateName</b> method creates the following collections:<ul>
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
     * @param {Integer} Context_ An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509certificateenrollmentcontext">X509CertificateEnrollmentContext</a> enumeration value that specifies whether the requested certificate is intended for an end user, a computer, or administrator acting on behalf of the computer.
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
     * The certificate request object has already been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename
     */
    InitializeFromTemplateName(Context_, strTemplateName) {
        if(strTemplateName is String) {
            pin := BSTR.Alloc(strTemplateName)
            strTemplateName := pin.Value
        }

        result := ComCall(32, this, "int", Context_, "ptr", strTemplateName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes the certificate request by using an IX509PrivateKey object and, optionally, a template.
     * @remarks
     * If you specify a template, the <b>InitializeFromPrivateKey</b> method performs the following actions:<ul>
     * <li>Adds the extensions specified by the template to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensions">IX509Extensions</a> collection.</li>
     * <li>Creates an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a> collection and populates it with the default XCN_OID_KEY_USAGE and XCN_OID_BASIC_CONSTRAINTS2 object identifiers. If the template indicates that these OIDs are not critical, they are removed from the collection. The OIDs marked critical by the template are added.</li>
     * <li>Sets the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_smimecapabilities">SmimeCapabilities</a> property if the template supports symmetric algorithms.</li>
     * <li>Sets the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_alternatesignaturealgorithm">AlternateSignatureAlgorithm</a> property if the template requires a discrete signature algorithm OID.</li>
     * <li>Creates an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509signatureinformation">IX509SignatureInformation</a> object.</li>
     * <li>Creates a hash algorithm OID if the algorithm is specified in the template and sets it on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509signatureinformation">IX509SignatureInformation</a> object.</li>
     * <li>Retrieves an asymmetric encryption algorithm OID, if it exists, from the template and sets it on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509signatureinformation">IX509SignatureInformation</a> object.</li>
     * <li>Populates many of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> properties from the template settings.</li>
     * </ul>
     * 
     * 
     * Whether you specify a template or not, if the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_cspinformations">CSPInformations</a> property is not specified, the method creates an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformations">ICspInformations</a> collection from the providers installed on the computer.
     * 
     * No private key is created at this point. If the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> object passed to the method does not represent an existing key, a key is created when the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method is called. The key will be created by using the default provider if no template was specified and the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_providername">ProviderName</a> property on the <b>IX509PrivateKey</b> is not set. When a private key exists, it is set on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_privatekey">PrivateKey</a> property.
     * @param {Integer} Context_ 
     * @param {IX509PrivateKey} pPrivateKey Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> interface that represents the private key.
     * @param {BSTR} strTemplateName A <b>BSTR</b> variable that contains the Common Name (CN) of the template as it appears in Active Directory or the dotted decimal <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a>. This is an optional parameter.
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
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate request object has already been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey
     */
    InitializeFromPrivateKey(Context_, pPrivateKey, strTemplateName) {
        if(strTemplateName is String) {
            pin := BSTR.Alloc(strTemplateName)
            strTemplateName := pin.Value
        }

        result := ComCall(33, this, "int", Context_, "ptr", pPrivateKey, "ptr", strTemplateName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a null-signed certificate request by using an IX509PublicKey object and, optionally, a template.
     * @remarks
     * If you specify a template, the <b>InitializeFromPublicKey</b> method performs the following actions:<ul>
     * <li>Adds the extensions specified in the optional template, if any, to the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensions">IX509Extensions</a> collection.</li>
     * <li>Creates a <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_criticalextensions">CriticalExtensions</a> collection and populates it with the default XCN_OID_KEY_USAGE and XCN_OID_BASIC_CONSTRAINTS2 object identifiers. If a template is specified and indicates that these OIDs are not critical, they are removed from the collection. The OIDs marked critical by the template, if any,  are added.</li>
     * <li>Sets the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_smimecapabilities">SmimeCapabilities</a> property if the template supports symmetric algorithms.</li>
     * <li>Sets the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_alternatesignaturealgorithm">AlternateSignatureAlgorithm</a> property if the template requires a discrete signature algorithm OID.</li>
     * <li>Creates an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509signatureinformation">IX509SignatureInformation</a> object.</li>
     * <li>Creates a hash algorithm OID if the algorithm is specified in the template and sets it on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509signatureinformation">IX509SignatureInformation</a> object.</li>
     * <li>Creates an asymmetric encryption algorithm OID if the algorithm is specified in the template and sets it on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509signatureinformation">IX509SignatureInformation</a> object.</li>
     * </ul>
     * 
     * 
     * Whether you specify a template or not, if the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_cspinformations">CSPInformations</a> property is not specified, the method creates an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformations">ICspInformations</a> collection from the providers installed on the computer.
     * 
     * The method does not create a private key. The use of this method implies that the request is null-signed. Therefore, the method sets the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-get_nullsigned">NullSigned</a> property on the  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509signatureinformation">IX509SignatureInformation</a> object.
     * @param {Integer} Context_ An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509certificateenrollmentcontext">X509CertificateEnrollmentContext</a> enumeration value that specifies whether the requested certificate is intended for an end user, a computer, or an administrator acting on behalf of the computer.
     * @param {IX509PublicKey} pPublicKey Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509publickey">IX509PublicKey</a> interface that represents the public key.
     * @param {BSTR} strTemplateName A  <b>BSTR</b> variable that contains the Common Name (CN) of the template as it appears in Active Directory or the dotted decimal <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a>. This is an optional parameter.
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
     * The certificate request object has already been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey
     */
    InitializeFromPublicKey(Context_, pPublicKey, strTemplateName) {
        if(strTemplateName is String) {
            pin := BSTR.Alloc(strTemplateName)
            strTemplateName := pin.Value
        }

        result := ComCall(34, this, "int", Context_, "ptr", pPublicKey, "ptr", strTemplateName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes the certificate request by using an existing certificate. (IX509CertificateRequestPkcs10.InitializeFromCertificate)
     * @remarks
     * The <b>InitializeFromCertificate</b> method validates the options specified in the <i>InheritOptions</i> parameter and initializes a new PKCS #10  request object by performing the following actions:<ul>
     * <li>Copies the renewal certificate, if there is one and you have specified <b>InheritRenewalCertificateFlag</b>, from the input certificate to the new request.</li>
     * <li>Copies the template if one is specified in the existing certificate and you set the <b>InheritTemplateFlag</b> value.</li>
     * <li>Copies the subject distinguished name to the new request if you specify <b>InheritSubjectFlag</b>.</li>
     * <li>Copies the subject alternative name to the new request if you specify <b>InheritSubjectAltNameFlag</b>.</li>
     * <li>Copies the extensions to the new request if you specify <b>InheritExtensionsFlag</b>.</li>
     * </ul>
     * @param {Integer} Context_ An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509certificateenrollmentcontext">X509CertificateEnrollmentContext</a> enumeration value that specifies whether the requested certificate is intended for an end user, a computer, or an administrator acting on behalf of the computer.
     * @param {BSTR} strCertificate A <b>BSTR</b> variable that contains the DER-encoded certificate.
     * 
     * Beginning with Windows 7 and Windows Server 2008 R2, you can specify a certificate thumb print or serial number rather than an encoded certificate. Doing so causes the function to search the appropriate local stores for the matching certificate. Keep in mind the following points:
     * 
     * <ul>
     * <li>The <b>BSTR</b> must be an even number of hexadecimal digits.</li>
     * <li>Whitespace between hexadecimal pairs is ignored.</li>
     * <li>The <i>Encoding</i> parameter must be set to <b>XCN_CRYPT_STRING_HEXRAW</b>.</li>
     * <li>The <i>Context</i> parameter determines whether the user or computer stores or both are searched.</li>
     * <li>If a private key is needed, only the personal and request stores are searched.</li>
     * <li>If a private key is not needed, the root and intermediate CA stores are also searched.</li>
     * </ul>
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to  the DER-encoded  certificate. The default value is <b>XCN_CRYPT_STRING_BASE64</b>.
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
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate request object has already been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate
     */
    InitializeFromCertificate(Context_, strCertificate, Encoding, InheritOptions) {
        if(strCertificate is String) {
            pin := BSTR.Alloc(strCertificate)
            strCertificate := pin.Value
        }

        result := ComCall(35, this, "int", Context_, "ptr", strCertificate, "int", Encoding, "int", InheritOptions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Decodes an existing signed or unsigned PKCS (IX509CertificateRequestPkcs10.InitializeDecode)
     * @remarks
     * The <b>InitializeDecode</b> method decodes the existing PKCS #10 request and uses the information retrieved to initialize the following collections for the new request object:<ul>
     * <li>An empty <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icryptattributes">ICryptAttributes</a> collection.</li>
     * <li>An empty <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensions">IX509Extensions</a> collection.</li>
     * <li>An empty <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a> collection for attribute and extension OIDs to be suppressed from the new request.</li>
     * </ul>
     * 
     * 
     * The method also:<ul>
     * <li>Adds the decoded extensions to the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensions">IX509Extensions</a> collection.</li>
     * <li>Adds the decoded attributes to the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icryptattributes">ICryptAttributes</a> collection.</li>
     * <li>Sets the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_criticalextensions">CriticalExtensions</a> property with the decoded critical extensions.</li>
     * <li>Sets the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_clientid">ClientId</a> property.</li>
     * <li>Sets the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_templateobjectid">TemplateObjectId</a> property.</li>
     * </ul>
     * 
     * 
     * By default, the <b>InitializeDecode</b> method assumes that the certificate request to be decoded is for an end user. Beginning with Windows 8 and Windows Server 2012, you can change this default behavior. After creating an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> interface, call <b>InitializeDecode</b> by setting the  <i>Encoding</i> parameter to <b>XCN_CRYPT_STRING_BINARY</b> and the <i>strEncodedData</i> parameter to one of the following values:
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
     * @param {BSTR} strEncodedData A <b>BSTR</b> variable that contains the DER-encoded  request. For more information, see Remarks.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to  the input string that contains the DER-encoded request. The default value is <b>XCN_CRYPT_STRING_BASE64</b>.
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
     * The certificate request object has already been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode
     */
    InitializeDecode(strEncodedData, Encoding) {
        if(strEncodedData is String) {
            pin := BSTR.Alloc(strEncodedData)
            strEncodedData := pin.Value
        }

        result := ComCall(36, this, "ptr", strEncodedData, "int", Encoding, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Verifies that the certificate request has been signed and that the signature is valid. (IX509CertificateRequestPkcs10.CheckSignature)
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
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-checksignature
     */
    CheckSignature(AllowedSignatureTypes) {
        result := ComCall(37, this, "int", AllowedSignatureTypes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a Boolean value that indicates whether any of the cryptographic providers associated with the request object is a smart card provider.
     * @remarks
     * The <b>IsSmartCard</b> method first checks the provider associated with the private key. If that provider is not for a smart card, the method iterates through the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_cspstatuses">CspStatuses</a> collection until it finds a selected provider that is. If no selected smart card providers are found, the method returns <b>False</b>. You must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object before calling this method. For more information, see any of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @returns {VARIANT_BOOL} Pointer to a <b>VARIANT_BOOL</b> variable that indicates whether any of the enumerated and selected providers is  a smart card provider.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-issmartcard
     */
    IsSmartCard() {
        result := ComCall(38, this, "short*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Retrieves the object identifier (OID) of the template used to create the certificate request. (IX509CertificateRequestPkcs10.get_TemplateObjectId)
     * @remarks
     * The object identifier can be an OID for the Active Directory Common Name (CN) of the template. You must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @returns {IObjectId} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_templateobjectid
     */
    get_TemplateObjectId() {
        result := ComCall(39, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IObjectId(ppValue)
    }

    /**
     * Retrieves the IX509PublicKey object that contains the public key included in the certificate request.
     * @remarks
     * You must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @returns {IX509PublicKey} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_publickey
     */
    get_PublicKey() {
        result := ComCall(40, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IX509PublicKey(ppValue)
    }

    /**
     * Retrieves an IX509PrivateKey object that contains the private key used to sign the certificate request.
     * @remarks
     * You must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @returns {IX509PrivateKey} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_privatekey
     */
    get_PrivateKey() {
        result := ComCall(41, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IX509PrivateKey(ppValue)
    }

    /**
     * Retrieves a Boolean value that indicates whether the certificate request is null-signed.
     * @remarks
     * A null-signed PKCS #10 certificate request is not really signed. That is, the signature is a hash created by using a digest algorithm such as SHA-1, but the request is not encrypted with a public key algorithm such as RSA. This can be used when a private key is not available as is often the case when <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authorities</a> are being cross-certified. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a> method.
     * 
     *  You must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_nullsigned
     */
    get_NullSigned() {
        result := ComCall(42, this, "short*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Retrieves a Boolean value that indicates whether an existing private key was used to sign the request.
     * @remarks
     * If you initialized the request object by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a> method, you specified a value for the <i>InheritOptions</i> parameter that indicated whether the private key used to sign the request was inherited from the certificate. If you specified <b>InheritPrivateKey</b> for this parameter, the <b>ReuseKey</b> property returns a value of Boolean true.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_reusekey
     */
    get_ReuseKey() {
        result := ComCall(43, this, "short*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Retrieves the certificate passed to the InitializeFromCertificate method.
     * @remarks
     * You must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_oldcertificate
     */
    get_OldCertificate(Encoding) {
        pValue := BSTR()
        result := ComCall(44, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Specifies or retrieves the X.500 distinguished name of the entity requesting the certificate. (Get)
     * @remarks
     * You must set this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method, and you must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @returns {IX500DistinguishedName} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_subject
     */
    get_Subject() {
        result := ComCall(45, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IX500DistinguishedName(ppValue)
    }

    /**
     * Specifies or retrieves the X.500 distinguished name of the entity requesting the certificate. (Put)
     * @remarks
     * You must set this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method, and you must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @param {IX500DistinguishedName} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-put_subject
     */
    put_Subject(pValue) {
        result := ComCall(46, this, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a collection of ICspStatus objects that matches the intended use of the private key associated with the certificate request.
     * @remarks
     * This property retrieves a collection of <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> objects. Each object represents a single provider/algorithm pair. The <b>CspStatuses</b> property differs from the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-getcspstatuses">GetCspStatuses</a> method. The method enables you to set a <i>KeySpec</i> parameter, but <b>CspStatuses</b> uses the  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a> property set on the private key associated with the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object. This can be one of the following values. <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>XCN_AT_NONE</td>
     * <td>Only Cryptography API: Next Generation (CNG) providers are selected.</td>
     * </tr>
     * <tr>
     * <td>XCN_AT_KEYEXCHANGE</td>
     * <td>Only CryptoAPI cryptographic service providers (CSPs) with encryption algorithms (including key exchange) are selected.</td>
     * </tr>
     * <tr>
     * <td>XCN_AT_SIGNATURE</td>
     * <td>Only CryptoAPI cryptographic service providers (CSPs) with signature algorithms are selected.</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     *  If you specify a template when initializing the request object, template attributes  such as the  <b>pKIDefaultCSPs</b> and <b>pKIDefaultKeySpec</b> affect which provider/algorithm pairs are initially enabled in the collection. You can call the following properties on each <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> object to retrieve information about a pair:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspstatus-get_cspinformation">CspInformation</a> property retrieves provider information.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspstatus-get_cspalgorithm">CspAlgorithm</a> property retrieves algorithm information.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspstatus-get_enrollmentstatus">EnrollmentStatus</a> property retrieves an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmentstatus">IX509EnrollmentStatus</a> object. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> property on the status object to determine whether the provider/algorithm pair is enabled for this request.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspstatus-get_ordinal">Ordinal</a> property retrieves the position in the collection of the provider/algorithm pair.</li>
     * </ul>
     * 
     * 
     * The collection retrieved by this method is saved internally on the request object. The collection exists as long as the PKCS #10 object continues to exist.
     * 
     * Assume, for example, that the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a> property on the private key associated with the request object is set to XCN_AT_SIGNATURE and that a template is used to initialize the request. The following statements will be true:<ul>
     * <li>A collection of <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> objects is created and saved on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object. The collection contains all valid provider/algorithm pairs installed on the computer.</li>
     * <li>Because the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a> property is not set to XCN_AT_NONE, the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> property is set to SelectedNo for each Cryptography API: Next Generation (CNG) provider/algorithm pair in the collection.</li>
     * <li>Because the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a> property is not set to XCN_AT_KEYEXCHANGE, the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> property is set to SelectedNo for each CryptoAPI CSP/algorithm pair in the collection where the algorithm can be used only to encrypt data or archive a key.</li>
     * <li>For each provider referenced by the template or private key but not supported on the computer, a placeholder <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> object is created and added to the collection and the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> property is set to SelectedNo.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> property is set to SelectedYes for each CryptoAPI CSP/algorithm pair where the algorithm can be used only to sign data.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspstatus-get_ordinal">Ordinal</a> property is set to reflect the CSP order, if any, identified by the <b>pKIDefaultCSPs</b> template attribute. The CSPs listed first by the attribute are ordered first in the collection. This property is used during enrollment if a private key must be created. The first selected CSP/algorithm pair is used to create the key, but if the operation fails, the next selected pair is tried.</li>
     * </ul>
     * 
     * 
     *  You must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object before calling this method. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @returns {ICspStatuses} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_cspstatuses
     */
    get_CspStatuses() {
        result := ComCall(47, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICspStatuses(ppValue)
    }

    /**
     * Specifies or retrieves a Boolean value that tells the Encode method whether to create an IX509ExtensionSmimeCapabilities collection that identifies the encryption capabilities supported by the computer. (Get)
     * @remarks
     * Multipurpose Internet Mail Extensions (MIME) is a specification for formatting binary data into text so that it can be sent in email. Secure/Multipurpose Internet Mail Extensions (S/MIME) is a standard for encrypting and signing a MIME message.
     * 
     * The  <b>SmimeCapabilities</b> extension, represented by an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensionsmimecapabilities">IX509ExtensionSmimeCapabilities</a> object, is used when sending and receiving encrypted email messages to report the recipient's decryption capabilities to the sender. This enables the sender to choose the most secure algorithm supported by both the sender and recipient.
     * 
     * If you did not set the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_suppressdefaults">SuppressDefaults</a> property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method, the <b>SmimeCapabilities</b> extension is added by default and the available symmetric algorithm OIDs are enumerated and added to the extension value. Set the <b>SmimeCapabilities</b> property before calling <b>Encode</b>.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_smimecapabilities
     */
    get_SmimeCapabilities() {
        result := ComCall(48, this, "short*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Specifies or retrieves a Boolean value that tells the Encode method whether to create an IX509ExtensionSmimeCapabilities collection that identifies the encryption capabilities supported by the computer. (Put)
     * @remarks
     * Multipurpose Internet Mail Extensions (MIME) is a specification for formatting binary data into text so that it can be sent in email. Secure/Multipurpose Internet Mail Extensions (S/MIME) is a standard for encrypting and signing a MIME message.
     * 
     * The  <b>SmimeCapabilities</b> extension, represented by an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensionsmimecapabilities">IX509ExtensionSmimeCapabilities</a> object, is used when sending and receiving encrypted email messages to report the recipient's decryption capabilities to the sender. This enables the sender to choose the most secure algorithm supported by both the sender and recipient.
     * 
     * If you did not set the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_suppressdefaults">SuppressDefaults</a> property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method, the <b>SmimeCapabilities</b> extension is added by default and the available symmetric algorithm OIDs are enumerated and added to the extension value. Set the <b>SmimeCapabilities</b> property before calling <b>Encode</b>.
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-put_smimecapabilities
     */
    put_SmimeCapabilities(Value) {
        result := ComCall(49, this, "short", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the IX509SignatureInformation object that contains information about the certificate request signature.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509signatureinformation">IX509SignatureInformation</a> object contains information about the hash, public key and signature algorithms used to sign the certificate request. If no <b>IX509SignatureInformation</b> object has been associated with the request, this property attempts to create one and use the private key to set the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-get_publickeyalgorithm">PublicKeyAlgorithm</a> property.
     * 
     *  You must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object and call  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @returns {IX509SignatureInformation} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_signatureinformation
     */
    get_SignatureInformation() {
        result := ComCall(50, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IX509SignatureInformation(ppValue)
    }

    /**
     * Specifies or retrieves a prefix used to create the container name for a new private key. (Get)
     * @remarks
     * Each CryptoAPI <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> or Cryptography API: Next Generation (CNG) key provider maintains a key container for the private key. To retrieve the name of a key container for an existing key, use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_containername">ContainerName</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> object.
     * 
     * A prefix can contain any string limited to the maximum length of the key container name and to legal container name characters. For example, if you do not call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_containername">ContainerName</a> property to specify a key container name, one is automatically created when the private key is created, and the prefix to the container name will be the string "lp". For another example, if you are creating a test harness and want to differentiate key containers by the programs that generated them, you can use the name of the executable as the prefix.
     * 
     * You must set this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method, and you must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_keycontainernameprefix
     */
    get_KeyContainerNamePrefix() {
        pValue := BSTR()
        result := ComCall(51, this, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Specifies or retrieves a prefix used to create the container name for a new private key. (Put)
     * @remarks
     * Each CryptoAPI <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> or Cryptography API: Next Generation (CNG) key provider maintains a key container for the private key. To retrieve the name of a key container for an existing key, use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_containername">ContainerName</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> object.
     * 
     * A prefix can contain any string limited to the maximum length of the key container name and to legal container name characters. For example, if you do not call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_containername">ContainerName</a> property to specify a key container name, one is automatically created when the private key is created, and the prefix to the container name will be the string "lp". For another example, if you are creating a test harness and want to differentiate key containers by the programs that generated them, you can use the name of the executable as the prefix.
     * 
     * You must set this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method, and you must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-put_keycontainernameprefix
     */
    put_KeyContainerNamePrefix(Value) {
        if(Value is String) {
            pin := BSTR.Alloc(Value)
            Value := pin.Value
        }

        result := ComCall(52, this, "ptr", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves an ICryptAttributes collection of optional certificate attributes. (IX509CertificateRequestPkcs10.get_CryptAttributes)
     * @remarks
     * You must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object before calling this property. For more information, see any of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @returns {ICryptAttributes} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_cryptattributes
     */
    get_CryptAttributes() {
        result := ComCall(53, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICryptAttributes(ppValue)
    }

    /**
     * Retrieves a collection of the extensions included in the certificate request. (IX509CertificateRequestPkcs10.get_X509Extensions)
     * @remarks
     * You must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @returns {IX509Extensions} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_x509extensions
     */
    get_X509Extensions() {
        result := ComCall(54, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IX509Extensions(ppValue)
    }

    /**
     * Retrieves an IObjectIds collection that identifies the version 3 certificate extensions marked as critical. (IX509CertificateRequestPkcs10.get_CriticalExtensions)
     * @remarks
     * The extension criticality indicates to an application that uses certificates whether it can ignore the extension. You must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object before calling this property. For more information, see any of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @returns {IObjectIds} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_criticalextensions
     */
    get_CriticalExtensions() {
        result := ComCall(55, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IObjectIds(ppValue)
    }

    /**
     * Retrieves a collection of the default extension and attribute object identifiers (OIDs) that were not added to the request when the request was encoded.
     * @remarks
     * Attributes and extensions are added to a certificate request when it is encoded or initialized. You can suppress the addition of default extensions and attributes by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_suppressdefaults">SuppressDefaults</a> property. For a PKCS #10 request, the following attributes are added by default:
     * 
     * <ul>
     * <li>XCN_OID_REQUEST_CLIENT_INFO
     * (<a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509attributeclientid">IX509AttributeClientId</a>)</li>
     * <li>XCN_OID_ENROLLMENT_CSP_PROVIDER (<a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509attributecspprovider">IX509AttributeCspProvider</a>)</li>
     * <li>XCN_OID_OS_VERSION (<a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509attributeosversion">IX509AttributeOSVersion</a>)</li>
     * <li>XCN_OID_RENEWAL_CERTIFICATE (<a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509attributerenewalcertificate">IX509AttributeRenewalCertificate</a>)</li>
     * </ul>
     * The following extensions are added by default:<ul>
     * <li>XCN_OID_RSA_SMIMECapabilities (<a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensionsmimecapabilities">IX509ExtensionSmimeCapabilities</a>)</li>
     * <li>XCN_OID_SUBJECT_KEY_IDENTIFIER
     * (<a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensionsubjectkeyidentifier">IX509ExtensionSubjectKeyIdentifier</a>)</li>
     * <li>XCN_OID_KEY_USAGE (<a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensionkeyusage">IX509ExtensionKeyUsage</a>)</li>
     * </ul>
     * 
     * 
     * You must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @returns {IObjectIds} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_suppressoids
     */
    get_SuppressOids() {
        result := ComCall(56, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IObjectIds(ppValue)
    }

    /**
     * Retrieves the unsigned certificate request created by the Encode method.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method creates a DER-encoded and signed certificate request, but it also internally saves the unsigned request as a byte array. You can use the <b>RawDataToBeSigned</b> property to retrieve that binary data as an Unicode-encoded string.
     * 
     *  You must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object and call  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_rawdatatobesigned
     */
    get_RawDataToBeSigned(Encoding) {
        pValue := BSTR()
        result := ComCall(57, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Retrieves the request signature created by the Encode method.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method creates a DER-encoded and signed certificate request which it saves internally as a byte array. You can use the <b>Signature</b> property to retrieve a byte array that contains the signature.
     * 
     *  You must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object and call  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_signature
     */
    get_Signature(Encoding) {
        pValue := BSTR()
        result := ComCall(58, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Retrieves an ICspStatuses collection that contains all provider/algorithm pairs consistent with the intended use of the private key as specified by the caller.
     * @remarks
     * This method retrieves a collection of <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> objects. Each object represents a single provider/algorithm pair. If you specify a template when initializing the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> request object, template attributes  such as the  <b>pKIDefaultCSPs</b> and <b>pKIDefaultKeySpec</b> affect which pairs are initially enabled. You can call the following properties on each <b>ICspStatus</b> object to retrieve information about a pair:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspstatus-get_cspinformation">CspInformation</a> property retrieves provider information.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspstatus-get_cspalgorithm">CspAlgorithm</a> property retrieves algorithm information.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspstatus-get_enrollmentstatus">EnrollmentStatus</a> property retrieves an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmentstatus">IX509EnrollmentStatus</a> object. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> property on the status object to determine whether the provider/algorithm pair is enabled for this request.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspstatus-get_ordinal">Ordinal</a> property retrieves the position in the provider/algorithm pair collection.</li>
     * </ul>
     * 
     * 
     * The collection retrieved by this method is saved internally on the request object. Up to three collections, one for each <i>KeySpec</i> value, can be created and saved. This is done to preserve the selection state of the provider/algorithm pairs so that relevant property pages can be displayed accurately and quickly multiple times and so that the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method can identify which providers and algorithms are selected if a private key must be created. If the selection state of a provider/algorithm pair is modified, the changes are saved to the appropriate collection. Changes made to the members of one collection do not affect the members of any other collection. The collections exist as long as the PKCS #10 object continues to exist.
     * 
     * Assume, for example, that this method is called with the <i>KeySpec</i> parameter set to XCN_AT_SIGNATURE and that a template is used to initialize the request. The following statements will be true:<ul>
     * <li>A collection of <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> objects is created and saved on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object. The collection contains all valid provider/algorithm pairs installed on the computer.</li>
     * <li>Because the <i>KeySpec</i> parameter is not set to XCN_AT_NONE, the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> property is set to SelectedNo for each Cryptography API: Next Generation (CNG) provider/algorithm pair in the collection.</li>
     * <li>Because the <i>KeySpec</i> parameter is not set to XCN_AT_KEYEXCHANGE, the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> property is set to SelectedNo for each CryptoAPI CSP/algorithm pair in the collection where the algorithm can be used to encrypt data or archive a key.</li>
     * <li>For each provider referenced by the template or private key but not supported on the computer, a placeholder <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> object is created and added to the collection and the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> property is set to SelectedNo.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> property is set to SelectedYes for each CryptoAPI CSP/algorithm pair where the algorithm can be used only to sign data.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspstatus-get_ordinal">Ordinal</a> property is set to reflect the CSP order, if any, identified by the <b>pKIDefaultCSPs</b> template attribute. The CSPs listed first by the attribute are ordered first in the collection. This property is used during enrollment if a private key must be created. The first selected CSP/algorithm pair is used to create the key, but if the operation fails, the next selected pair is tried.</li>
     * <li>Calling this method again with the same <i>KeySpec</i> parameter retrieves a pointer to the existing collection created previously for that parameter value.</li>
     * <li>Calling this method again with a different <i>KeySpec</i> parameter will not affect the collection created for the XCN_AT_SIGNATURE <i>KeySpec</i> value. Further, changing the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> property on any member of the new collection does not affect any member of the previous collection.</li>
     * </ul>
     * 
     * 
     * The <b>GetCspStatuses</b> method differs from the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_cspstatuses">CspStatuses</a> property by use of the <i>KeySpec</i> parameter. The method allows users to specify this value, but the property uses the value set on the private key associated with the request object.
     * 
     *  You must initialize the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> object before calling this method. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @param {Integer} KeySpec 
     * @returns {ICspStatuses} Address of a variable that receives a pointer to an  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatuses">ICspStatuses</a> interface that represents the collection.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-getcspstatuses
     */
    GetCspStatuses(KeySpec) {
        result := ComCall(59, this, "int", KeySpec, "ptr*", &ppCspStatuses := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICspStatuses(ppCspStatuses)
    }
}
