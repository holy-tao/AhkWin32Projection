#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICspStatus.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Contains information about a cryptographic provider/algorithm pair.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icspstatuses
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICspStatuses extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICspStatuses
     * @type {Guid}
     */
    static IID => Guid("{728ab30a-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ItemByIndex", "get_Count", "get__NewEnum", "Add", "Remove", "Clear", "get_ItemByName", "get_ItemByOrdinal", "get_ItemByOperations", "get_ItemByProvider"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Retrieves an ICspStatus object from the collection by index number.
     * @param {Integer} Index 
     * @returns {ICspStatus} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspstatuses-get_itembyindex
     */
    get_ItemByIndex(Index) {
        result := ComCall(7, this, "int", Index, "ptr*", &pVal := 0, "HRESULT")
        return ICspStatus(pVal)
    }

    /**
     * Retrieves the number of ICspStatus objects in the collection.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspstatuses-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the enumerator for the collection.
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspstatuses-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * Adds an ICspStatus object to the collection.
     * @param {ICspStatus} pVal Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> object to add to the collection.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspstatuses-add
     */
    Add(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * Removes an ICspStatus object from the collection by index number.
     * @param {Integer} Index A <b>LONG</b> variable that contains the index of the object to remove.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspstatuses-remove
     */
    Remove(Index) {
        result := ComCall(11, this, "int", Index, "HRESULT")
        return result
    }

    /**
     * Removes all ICspStatus objects from the collection.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspstatuses-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Retrieves an ICspStatus object from the collection by provider and algorithm name.
     * @param {BSTR} strCspName 
     * @param {BSTR} strAlgorithmName 
     * @returns {ICspStatus} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspstatuses-get_itembyname
     */
    get_ItemByName(strCspName, strAlgorithmName) {
        strCspName := strCspName is String ? BSTR.Alloc(strCspName).Value : strCspName
        strAlgorithmName := strAlgorithmName is String ? BSTR.Alloc(strAlgorithmName).Value : strAlgorithmName

        result := ComCall(13, this, "ptr", strCspName, "ptr", strAlgorithmName, "ptr*", &ppValue := 0, "HRESULT")
        return ICspStatus(ppValue)
    }

    /**
     * Retrieves an ICspStatus object from the collection by ordinal number.
     * @remarks
     * 
     * The ordinal order of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> objects in the collection can vary each time the collection is enumerated for a variety of reasons including, but not limited to, the following:<ul>
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
     * @param {Integer} Ordinal 
     * @returns {ICspStatus} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspstatuses-get_itembyordinal
     */
    get_ItemByOrdinal(Ordinal) {
        result := ComCall(14, this, "int", Ordinal, "ptr*", &ppValue := 0, "HRESULT")
        return ICspStatus(ppValue)
    }

    /**
     * Retrieves an ICspStatus object that has the same name as the provider specified on input and the same algorithm but identifies a different cryptographic operation.
     * @param {BSTR} strCspName 
     * @param {BSTR} strAlgorithmName 
     * @param {Integer} Operations 
     * @returns {ICspStatus} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspstatuses-get_itembyoperations
     */
    get_ItemByOperations(strCspName, strAlgorithmName, Operations) {
        strCspName := strCspName is String ? BSTR.Alloc(strCspName).Value : strCspName
        strAlgorithmName := strAlgorithmName is String ? BSTR.Alloc(strAlgorithmName).Value : strAlgorithmName

        result := ComCall(15, this, "ptr", strCspName, "ptr", strAlgorithmName, "int", Operations, "ptr*", &ppValue := 0, "HRESULT")
        return ICspStatus(ppValue)
    }

    /**
     * Retrieves an ICspStatus object that has the same name as the provider specified on input but identifies an algorithm that supports a different intended key use.
     * @remarks
     * 
     * The <b>ItemByProvider</b>  property retrieves the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> object that matches the name of the input provider but is associated with a different <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509keyspec">X509KeySpec</a> enumeration value. For example, if the input provider has a <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-get_keyspec">KeySpec</a> value of XCN_AT_KEYEXCHANGE, the <b>ItemByProvider</b> property attempts to find an <b>ICspStatus</b> object for the same provider but with a <b>KeySpec</b> value of XCN_AT_SIGNATURE.
     * 
     * Because the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-get_keyspec">KeySpec</a> property is only associated with legacy providers, if you specify a Cryptography API: Next Generation (CNG) providers, the <b>ItemByProvider</b>  property returns the same <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> object as that entered.
     * 
     * To use this property to iterate through the collection, perform the following steps:<ul>
     * <li>Retrieve an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatuses">ICspStatuses</a> collection by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-getcspstatuses">GetCspStatuses</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_cspstatuses">CspStatuses</a> property on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> interface.</li>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspstatuses-get_itembyindex">ItemByIndex</a> property to iterate through the collection.</li>
     * <li>For each <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> element retrieved that contains the provider you are interested in, call <b>ItemByProvider</b>.</li>
     * </ul>
     * 
     * 
     * @param {ICspStatus} pCspStatus 
     * @returns {ICspStatus} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspstatuses-get_itembyprovider
     */
    get_ItemByProvider(pCspStatus) {
        result := ComCall(16, this, "ptr", pCspStatus, "ptr*", &ppValue := 0, "HRESULT")
        return ICspStatus(ppValue)
    }
}
