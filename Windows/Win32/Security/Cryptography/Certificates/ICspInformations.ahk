#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\X509KeySpec.ahk" { X509KeySpec }
#Import ".\AlgorithmOperationFlags.ahk" { AlgorithmOperationFlags }
#Import ".\ICspStatuses.ahk" { ICspStatuses }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ICspInformation.ahk" { ICspInformation }
#Import ".\IObjectIds.ahk" { IObjectIds }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ICspAlgorithms.ahk" { ICspAlgorithms }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ICspStatus.ahk" { ICspStatus }

/**
 * The ICspInformations interface defines the following methods and properties to manage a collection of ICspInformation objects.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-icspinformations
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICspInformations extends IDispatch {
    /**
     * The interface identifier for ICspInformations
     * @type {Guid}
     */
    static IID := Guid("{728ab308-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICspInformations interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ItemByIndex              : IntPtr
        get_Count                    : IntPtr
        get__NewEnum                 : IntPtr
        Add                          : IntPtr
        Remove                       : IntPtr
        Clear                        : IntPtr
        AddAvailableCsps             : IntPtr
        get_ItemByName               : IntPtr
        GetCspStatusFromProviderName : IntPtr
        GetCspStatusesFromOperations : IntPtr
        GetEncryptionCspAlgorithms   : IntPtr
        GetHashAlgorithms            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICspInformations.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-get_itembyindex
     */
    get_ItemByIndex(Index) {
        result := ComCall(7, this, "int", Index, "ptr*", &pVal := 0, "HRESULT")
        return ICspInformation(pVal)
    }

    /**
     * Retrieves the number of ICspInformation objects in the collection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the enumerator for the collection. (ICspInformations.get__NewEnum)
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-get__newenum
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
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-add
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
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-remove
     */
    Remove(Index) {
        result := ComCall(11, this, "int", Index, "HRESULT")
        return result
    }

    /**
     * Removes all ICspInformation objects from the collection.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Adds the providers installed on the computer to the collection.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformations">ICspInformations</a> collection must be empty before you call this method.
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-addavailablecsps
     */
    AddAvailableCsps() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Retrieves an ICspInformation object from the collection by name.
     * @param {BSTR} strName 
     * @returns {ICspInformation} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-get_itembyname
     */
    get_ItemByName(strName) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(14, this, BSTR, strName, "ptr*", &ppCspInformation := 0, "HRESULT")
        return ICspInformation(ppCspInformation)
    }

    /**
     * Retrieves an ICspStatus object for a legacy provider by provider name and supported key operations.
     * @param {BSTR} strProviderName A <b>BSTR</b> that contains the cryptographic provider name or the provider and algorithm names separated by a comma in the format <i>algorithm_name, provider_name</i>.
     * @param {X509KeySpec} LegacyKeySpec 
     * @returns {ICspStatus} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> interface that contains information about a cryptographic provider and algorithm pair that satisfies the <i>strProviderName</i> and <i>LegacyKeySpec</i> parameter values.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-getcspstatusfromprovidername
     */
    GetCspStatusFromProviderName(strProviderName, LegacyKeySpec) {
        strProviderName := strProviderName is String ? BSTR.Alloc(strProviderName).Value : strProviderName

        result := ComCall(15, this, BSTR, strProviderName, X509KeySpec, LegacyKeySpec, "ptr*", &ppValue := 0, "HRESULT")
        return ICspStatus(ppValue)
    }

    /**
     * Retrieves an ICspStatuses collection by supported key operations and optional provider information.
     * @param {AlgorithmOperationFlags} Operations An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-algorithmoperationflags">AlgorithmOperationFlags</a> enumeration value that  specifies the supported operations. This can be a bitwise combination of the following flags:
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-getcspstatusesfromoperations
     */
    GetCspStatusesFromOperations(Operations, pCspInformation) {
        result := ComCall(16, this, AlgorithmOperationFlags, Operations, "ptr", pCspInformation, "ptr*", &ppValue := 0, "HRESULT")
        return ICspStatuses(ppValue)
    }

    /**
     * Retrieves the collection of encryption algorithms supported by a provider.
     * @param {ICspInformation} pCspInformation Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformation">ICspInformation</a> interface that represents the provider. This can be a legacy cryptographic service provider (CSP), a Cryptography API: Next Generation (CNG) provider, or <b>NULL</b>. If you specify <b>NULL</b>, this method returns the collection of all encryption algorithms supported by all CSPs and CNG providers.
     * @returns {ICspAlgorithms} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspalgorithms">ICspAlgorithms</a> interface that represents the collection.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-getencryptioncspalgorithms
     */
    GetEncryptionCspAlgorithms(pCspInformation) {
        result := ComCall(17, this, "ptr", pCspInformation, "ptr*", &ppValue := 0, "HRESULT")
        return ICspAlgorithms(ppValue)
    }

    /**
     * Retrieves the collection of hash algorithms supported by a provider.
     * @param {ICspInformation} pCspInformation Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformation">ICspInformation</a> interface that represents the provider. This can be a legacy cryptographic service provider (CSP), a Cryptography API: Next Generation (CNG) provider, or <b>NULL</b>. If you specify <b>NULL</b>, this method returns the collection of all hash algorithms supported by all CSPs and CNG providers.
     * @returns {IObjectIds} Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a> interface that represents the collection.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-gethashalgorithms
     */
    GetHashAlgorithms(pCspInformation) {
        result := ComCall(18, this, "ptr", pCspInformation, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectIds(ppValue)
    }

    Query(iid) {
        if (ICspInformations.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ItemByIndex := CallbackCreate(GetMethod(implObj, "get_ItemByIndex"), flags, 3)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
        this.vtbl.AddAvailableCsps := CallbackCreate(GetMethod(implObj, "AddAvailableCsps"), flags, 1)
        this.vtbl.get_ItemByName := CallbackCreate(GetMethod(implObj, "get_ItemByName"), flags, 3)
        this.vtbl.GetCspStatusFromProviderName := CallbackCreate(GetMethod(implObj, "GetCspStatusFromProviderName"), flags, 4)
        this.vtbl.GetCspStatusesFromOperations := CallbackCreate(GetMethod(implObj, "GetCspStatusesFromOperations"), flags, 4)
        this.vtbl.GetEncryptionCspAlgorithms := CallbackCreate(GetMethod(implObj, "GetEncryptionCspAlgorithms"), flags, 3)
        this.vtbl.GetHashAlgorithms := CallbackCreate(GetMethod(implObj, "GetHashAlgorithms"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ItemByIndex)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.Clear)
        CallbackFree(this.vtbl.AddAvailableCsps)
        CallbackFree(this.vtbl.get_ItemByName)
        CallbackFree(this.vtbl.GetCspStatusFromProviderName)
        CallbackFree(this.vtbl.GetCspStatusesFromOperations)
        CallbackFree(this.vtbl.GetEncryptionCspAlgorithms)
        CallbackFree(this.vtbl.GetHashAlgorithms)
    }
}
