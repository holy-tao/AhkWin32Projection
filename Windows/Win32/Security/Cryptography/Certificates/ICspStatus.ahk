#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICspAlgorithm.ahk
#Include .\ICspInformation.ahk
#Include .\IX509EnrollmentStatus.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Contains information about a cryptographic provider/algorithm pair.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icspstatus
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICspStatus extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICspStatus
     * @type {Guid}
     */
    static IID => Guid("{728ab309-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "get_Ordinal", "put_Ordinal", "get_CspAlgorithm", "get_CspInformation", "get_EnrollmentStatus", "get_DisplayName"]

    /**
     * @type {Integer} 
     */
    Ordinal {
        get => this.get_Ordinal()
        set => this.put_Ordinal(value)
    }

    /**
     * @type {ICspAlgorithm} 
     */
    CspAlgorithm {
        get => this.get_CspAlgorithm()
    }

    /**
     * @type {ICspInformation} 
     */
    CspInformation {
        get => this.get_CspInformation()
    }

    /**
     * @type {IX509EnrollmentStatus} 
     */
    EnrollmentStatus {
        get => this.get_EnrollmentStatus()
    }

    /**
     * @type {BSTR} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Initializes the object from a cryptographic provider and an associated algorithm.
     * @param {ICspInformation} pCsp Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformation">ICspInformation</a> interface that represents information about the provider.
     * @param {ICspAlgorithm} pAlgorithm Pointer to an  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspalgorithm">ICspAlgorithm</a> interface that represents an algorithm supported by the provider identified in the  <i>pCsp</i> parameter. This parameter is optional and can be <b>NULL</b>.
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
     * The object is already initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspstatus-initialize
     */
    Initialize(pCsp, pAlgorithm) {
        result := ComCall(7, this, "ptr", pCsp, "ptr", pAlgorithm, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves the position of the ICspStatus object in the ICspStatuses collection.
     * @remarks
     * 
     * To iterate through the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatuses">ICspStatuses</a> collection by ordinal, call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspstatuses-get_itembyordinal">ItemByOrdinal</a> property. The ordinal order of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> objects in the collection can vary each time the collection is enumerated for a variety of reasons including, but not limited to, the following:<ul>
     * <li>Certificate request template settings</li>
     * <li>Property values for the cryptographic provider</li>
     * <li>Private key property values</li>
     * </ul>
     * 
     * 
     * For example, assume that the version 2 template chosen to create a certificate request specifies that the certificate can only be used for signing (the <b>pKIDefaultKeySpec</b> template attribute is XCN_AT_SIGNATURE) and that the default provider is the Microsoft Enhanced RSA and AES Cryptographic Provider. Notice that the template restricts the certificate to signing even though the provider supports both encryption and signing algorithms. That is, the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-get_keyspec">KeySpec</a> property on the provider is a bitwise combination of the XCN_AT_KEYEXCHANGE and XCN_AT_SIGNATURE constants, but the <b>pKIDefaultKeySpec</b> template attribute supports only XCN_AT_SIGNATURE.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> objects in the collection will be ordered in the following manner:<ul>
     * <li>Of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> objects enumerated for this provider, those associated with signature algorithms (XCN_AT_SIGNATURE) are ordered first (lower ordinal value) and their <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_display">Display</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> properties are enabled. <div class="alert"><b>Note</b>  If the  <b>pKIDefaultKeySpec</b> template attribute had been XCN_AT_KEYEXCHANGE, the encryption algorithms would be ordered first.</div>
     * <div> </div>
     * </li>
     * <li>Of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> objects enumerated for this provider, those associated with encryption algorithms (XCN_AT_KEYEXCHANGE) are ordered later (higher ordinal values) and their <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_display">Display</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> properties are not enabled.</li>
     * <li>For all other installed CryptoAPI providers that support asymmetric signing algorithms (XCN_AT_SIGNATURE) but which are not associated with the specified provider, the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_display">Display</a> property is enabled and the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> property is not enabled.</li>
     * <li>For all other installed CryptoAPI providers that support asymmetric encryption algorithms (XCN_AT_KEYEXCHANGE), the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_display">Display</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> properties are not enabled.</li>
     * <li>For all installed Cryptography API: Next Generation (CNG) providers, the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_display">Display</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> properties are not enabled.</li>
     * </ul>
     * 
     * 
     * For another example, assume that a version 3 template specifies one specific CNG provider and  algorithm. That provider/algorithm pair (<a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> object) is ordered first, enabled for display and selected. All other algorithms supported by that provider are ordered later, not enabled for display, and not selected. All other providers that support the specified algorithm will be ordered later still, enabled for display, but not selected. All remaining provider/algorithm pairs will not be enabled for display and not selected.<div class="alert"><b>Note</b>  CNG providers do not support the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-get_keyspec">KeySpec</a> intended use concept. They return XCN_AT_NONE for this property value.</div>
     * <div> </div>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspstatus-get_ordinal
     */
    get_Ordinal() {
        result := ComCall(8, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves the position of the ICspStatus object in the ICspStatuses collection.
     * @remarks
     * 
     * To iterate through the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatuses">ICspStatuses</a> collection by ordinal, call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspstatuses-get_itembyordinal">ItemByOrdinal</a> property. The ordinal order of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> objects in the collection can vary each time the collection is enumerated for a variety of reasons including, but not limited to, the following:<ul>
     * <li>Certificate request template settings</li>
     * <li>Property values for the cryptographic provider</li>
     * <li>Private key property values</li>
     * </ul>
     * 
     * 
     * For example, assume that the version 2 template chosen to create a certificate request specifies that the certificate can only be used for signing (the <b>pKIDefaultKeySpec</b> template attribute is XCN_AT_SIGNATURE) and that the default provider is the Microsoft Enhanced RSA and AES Cryptographic Provider. Notice that the template restricts the certificate to signing even though the provider supports both encryption and signing algorithms. That is, the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-get_keyspec">KeySpec</a> property on the provider is a bitwise combination of the XCN_AT_KEYEXCHANGE and XCN_AT_SIGNATURE constants, but the <b>pKIDefaultKeySpec</b> template attribute supports only XCN_AT_SIGNATURE.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> objects in the collection will be ordered in the following manner:<ul>
     * <li>Of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> objects enumerated for this provider, those associated with signature algorithms (XCN_AT_SIGNATURE) are ordered first (lower ordinal value) and their <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_display">Display</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> properties are enabled. <div class="alert"><b>Note</b>  If the  <b>pKIDefaultKeySpec</b> template attribute had been XCN_AT_KEYEXCHANGE, the encryption algorithms would be ordered first.</div>
     * <div> </div>
     * </li>
     * <li>Of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> objects enumerated for this provider, those associated with encryption algorithms (XCN_AT_KEYEXCHANGE) are ordered later (higher ordinal values) and their <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_display">Display</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> properties are not enabled.</li>
     * <li>For all other installed CryptoAPI providers that support asymmetric signing algorithms (XCN_AT_SIGNATURE) but which are not associated with the specified provider, the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_display">Display</a> property is enabled and the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> property is not enabled.</li>
     * <li>For all other installed CryptoAPI providers that support asymmetric encryption algorithms (XCN_AT_KEYEXCHANGE), the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_display">Display</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> properties are not enabled.</li>
     * <li>For all installed Cryptography API: Next Generation (CNG) providers, the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_display">Display</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> properties are not enabled.</li>
     * </ul>
     * 
     * 
     * For another example, assume that a version 3 template specifies one specific CNG provider and  algorithm. That provider/algorithm pair (<a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> object) is ordered first, enabled for display and selected. All other algorithms supported by that provider are ordered later, not enabled for display, and not selected. All other providers that support the specified algorithm will be ordered later still, enabled for display, but not selected. All remaining provider/algorithm pairs will not be enabled for display and not selected.<div class="alert"><b>Note</b>  CNG providers do not support the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-get_keyspec">KeySpec</a> intended use concept. They return XCN_AT_NONE for this property value.</div>
     * <div> </div>
     * 
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspstatus-put_ordinal
     */
    put_Ordinal(Value) {
        result := ComCall(9, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Retrieves an ICspAlgorithm object that contains information about an algorithm supported by the provider.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspalgorithm">ICspAlgorithm</a> object includes the following information about an algorithm:<ul>
     * <li>The default, minimum, maximum, and incremental lengths of the key.</li>
     * <li>The abbreviated and long name of the algorithm.</li>
     * <li>The cryptographic operations that can be performed by the algorithm.</li>
     * </ul>
     * 
     * 
     * @returns {ICspAlgorithm} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspstatus-get_cspalgorithm
     */
    get_CspAlgorithm() {
        result := ComCall(10, this, "ptr*", &ppValue := 0, "HRESULT")
        return ICspAlgorithm(ppValue)
    }

    /**
     * Retrieves an ICspInformation object that contains general information about the provider.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformation">ICspInformation</a> object includes the following information about a CSP:
     * 
     * <ul>
     * <li>A collection of supported algorithms and their intended uses.</li>
     * <li>Whether the CSP is implemented in hardware or software.</li>
     * <li>Whether the CSP is a smart card provider or a legacy provider.</li>
     * <li>The version number and name.</li>
     * <li>Whether the CSP is installed on the client computer.</li>
     * </ul>
     * 
     * 
     * @returns {ICspInformation} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspstatus-get_cspinformation
     */
    get_CspInformation() {
        result := ComCall(11, this, "ptr*", &ppValue := 0, "HRESULT")
        return ICspInformation(ppValue)
    }

    /**
     * Retrieves an IX509EnrollmentStatus object that contains information about the certificate enrollment.
     * @remarks
     * 
     * This property returns an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmentstatus">IX509EnrollmentStatus</a> object. This object is typically populated when you create a PKCS #10 certificate request. The following three properties returned by this object provide information about the  provider/algorithm pair represented by an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> object:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_display">Display</a> property specifies whether the provider and algorithm should be displayed in a user interface.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_selected">Selected</a> property specifies whether the provider and algorithm can be used to create a key pair for a certificate request.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_status">Status</a> property specifies whether the provider and algorithm were skipped or resulted in an error during request initialization.</li>
     * </ul>
     * 
     * 
     * To understand how these properties are important, assume that a certificate request is based on a template that specifies a particular provider and algorithm. The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_display">Display</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_status">Status</a> properties for this provider/algorithm pair are enabled. For other <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> objects, one or both of these properties may not be enabled. For more complete examples, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspstatus-get_ordinal">Ordinal</a> property.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentstatus-get_status">Status</a> property is set to <b>EnrollUnknown</b> when the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmentstatus">IX509EnrollmentStatus</a> object is first created. If a provider/algorithm pair is not selected, the status may be set to <b>EnrollSkipped</b>. The status will be set to <b>EnrollError</b> if key creation fails for the selected provider and algorithm during certificate initialization.
     * 
     * 
     * @returns {IX509EnrollmentStatus} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspstatus-get_enrollmentstatus
     */
    get_EnrollmentStatus() {
        result := ComCall(12, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509EnrollmentStatus(ppValue)
    }

    /**
     * Retrieves a string that contains the name of the provider, the algorithm name, and the operations that can be performed by the algorithm.
     * @remarks
     * 
     * The format of the string returned by this property depends on whether the provider is a CryptoAPI <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) or a Cryptography API: Next Generation (CNG) provider.<ul>
     * <li>The format of the string for a CSP is <i>ProviderName(KeyType)</i> where <i>KeyType</i> is either "Signature" or "Encryption".</li>
     * <li>The format of the string for a CNG provider is <i>AlgorithmName,ProviderName</i> where <i>AlgorithmName</i> can be "Unknown Algorithm".</li>
     * </ul>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspstatus-get_displayname
     */
    get_DisplayName() {
        pValue := BSTR()
        result := ComCall(13, this, "ptr", pValue, "HRESULT")
        return pValue
    }
}
