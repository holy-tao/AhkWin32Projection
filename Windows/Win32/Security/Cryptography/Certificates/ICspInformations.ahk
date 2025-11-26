#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICspInformation.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include .\ICspStatus.ahk
#Include .\ICspStatuses.ahk
#Include .\ICspAlgorithms.ahk
#Include .\IObjectIds.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ICspInformations interface defines the following methods and properties to manage a collection of ICspInformation objects.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icspinformations
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICspInformations extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICspInformations
     * @type {Guid}
     */
    static IID => Guid("{728ab308-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ItemByIndex", "get_Count", "get__NewEnum", "Add", "Remove", "Clear", "AddAvailableCsps", "get_ItemByName", "GetCspStatusFromProviderName", "GetCspStatusesFromOperations", "GetEncryptionCspAlgorithms", "GetHashAlgorithms"]

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
     * Retrieves an ICspInformation object from the collection by index number.
     * @param {Integer} Index 
     * @returns {ICspInformation} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformations-get_itembyindex
     */
    get_ItemByIndex(Index) {
        result := ComCall(7, this, "int", Index, "ptr*", &pVal := 0, "HRESULT")
        return ICspInformation(pVal)
    }

    /**
     * Retrieves the number of ICspInformation objects in the collection.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformations-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the enumerator for the collection.
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformations-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * Adds an ICspInformation object to the collection.
     * @param {ICspInformation} pVal Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformation">ICspInformation</a> object to add to the collection.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformations-add
     */
    Add(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * Removes an ICspInformation object from the collection by index number.
     * @param {Integer} Index A <b>LONG</b> variable that contains the index of the object to remove.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformations-remove
     */
    Remove(Index) {
        result := ComCall(11, this, "int", Index, "HRESULT")
        return result
    }

    /**
     * Removes all ICspInformation objects from the collection.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformations-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Adds the providers installed on the computer to the collection.
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
     * <dt><b><b>HRESULT_FROM_WIN32(ERROR_INVALID_OPERATION)</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The collection is not empty.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformations-addavailablecsps
     */
    AddAvailableCsps() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Retrieves an ICspInformation object from the collection by name.
     * @param {BSTR} strName 
     * @returns {ICspInformation} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformations-get_itembyname
     */
    get_ItemByName(strName) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(14, this, "ptr", strName, "ptr*", &ppCspInformation := 0, "HRESULT")
        return ICspInformation(ppCspInformation)
    }

    /**
     * Retrieves an ICspStatus object for a legacy provider by provider name and supported key operations.
     * @param {BSTR} strProviderName A <b>BSTR</b> that contains the cryptographic provider name or the provider and algorithm names separated by a comma in the format <i>algorithm_name, provider_name</i>.
     * @param {Integer} LegacyKeySpec 
     * @returns {ICspStatus} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> interface that contains information about a cryptographic provider and algorithm pair that satisfies the <i>strProviderName</i> and <i>LegacyKeySpec</i> parameter values.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformations-getcspstatusfromprovidername
     */
    GetCspStatusFromProviderName(strProviderName, LegacyKeySpec) {
        strProviderName := strProviderName is String ? BSTR.Alloc(strProviderName).Value : strProviderName

        result := ComCall(15, this, "ptr", strProviderName, "int", LegacyKeySpec, "ptr*", &ppValue := 0, "HRESULT")
        return ICspStatus(ppValue)
    }

    /**
     * Retrieves an ICspStatuses collection by supported key operations and optional provider information.
     * @param {Integer} Operations An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-algorithmoperationflags">AlgorithmOperationFlags</a> enumeration value that  specifies the supported operations. This can be a bitwise combination of the following flags:
     * 
     * <ul>
     * <li>XCN_NCRYPT_NO_OPERATION</li>
     * <li>XCN_NCRYPT_CIPHER_OPERATION</li>
     * <li>XCN_NCRYPT_HASH_OPERATION</li>
     * <li>XCN_NCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION</li>
     * <li>XCN_NCRYPT_SECRET_AGREEMENT_OPERATION</li>
     * <li>XCN_NCRYPT_SIGNATURE_OPERATION</li>
     * <li>XCN_NCRYPT_RNG_OPERATION</li>
     * <li>XCN_NCRYPT_ANY_ASYMMETRIC_OPERATION</li>
     * <li>XCN_NCRYPT_PREFER_SIGNATURE_ONLY_OPERATION</li>
     * <li>XCN_NCRYPT_PREFER_NON_SIGNATURE_OPERATION</li>
     * <li>XCN_NCRYPT_EXACT_MATCH_OPERATION</li>
     * <li>XCN_NCRYPT_PREFERENCE_MASK_OPERATION</li>
     * </ul>
     * @param {ICspInformation} pCspInformation Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformation">ICspInformation</a> interface that represents information for a specific provider.
     * @returns {ICspStatuses} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatuses">ICspStatuses</a> interface that contains the collection.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformations-getcspstatusesfromoperations
     */
    GetCspStatusesFromOperations(Operations, pCspInformation) {
        result := ComCall(16, this, "int", Operations, "ptr", pCspInformation, "ptr*", &ppValue := 0, "HRESULT")
        return ICspStatuses(ppValue)
    }

    /**
     * Retrieves the collection of encryption algorithms supported by a provider.
     * @param {ICspInformation} pCspInformation Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformation">ICspInformation</a> interface that represents the provider. This can be a legacy cryptographic service provider (CSP), a Cryptography API: Next Generation (CNG) provider, or <b>NULL</b>. If you specify <b>NULL</b>, this method returns the collection of all encryption algorithms supported by all CSPs and CNG providers.
     * @returns {ICspAlgorithms} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspalgorithms">ICspAlgorithms</a> interface that represents the collection.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformations-getencryptioncspalgorithms
     */
    GetEncryptionCspAlgorithms(pCspInformation) {
        result := ComCall(17, this, "ptr", pCspInformation, "ptr*", &ppValue := 0, "HRESULT")
        return ICspAlgorithms(ppValue)
    }

    /**
     * Retrieves the collection of hash algorithms supported by a provider.
     * @param {ICspInformation} pCspInformation Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformation">ICspInformation</a> interface that represents the provider. This can be a legacy cryptographic service provider (CSP), a Cryptography API: Next Generation (CNG) provider, or <b>NULL</b>. If you specify <b>NULL</b>, this method returns the collection of all hash algorithms supported by all CSPs and CNG providers.
     * @returns {IObjectIds} Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a> interface that represents the collection.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformations-gethashalgorithms
     */
    GetHashAlgorithms(pCspInformation) {
        result := ComCall(18, this, "ptr", pCspInformation, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectIds(ppValue)
    }
}
