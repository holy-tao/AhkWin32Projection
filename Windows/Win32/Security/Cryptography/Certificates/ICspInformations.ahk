#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Integer} Index 
     * @param {Pointer<ICspInformation>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-get_itembyindex
     */
    get_ItemByIndex(Index, pVal) {
        result := ComCall(7, this, "int", Index, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-get_count
     */
    get_Count(pVal) {
        result := ComCall(8, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-get__newenum
     */
    get__NewEnum(pVal) {
        result := ComCall(9, this, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICspInformation} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-add
     */
    Add(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-remove
     */
    Remove(Index) {
        result := ComCall(11, this, "int", Index, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-addavailablecsps
     */
    AddAvailableCsps() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {Pointer<ICspInformation>} ppCspInformation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-get_itembyname
     */
    get_ItemByName(strName, ppCspInformation) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(14, this, "ptr", strName, "ptr*", ppCspInformation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strProviderName 
     * @param {Integer} LegacyKeySpec 
     * @param {Pointer<ICspStatus>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-getcspstatusfromprovidername
     */
    GetCspStatusFromProviderName(strProviderName, LegacyKeySpec, ppValue) {
        strProviderName := strProviderName is String ? BSTR.Alloc(strProviderName).Value : strProviderName

        result := ComCall(15, this, "ptr", strProviderName, "int", LegacyKeySpec, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Operations 
     * @param {ICspInformation} pCspInformation 
     * @param {Pointer<ICspStatuses>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-getcspstatusesfromoperations
     */
    GetCspStatusesFromOperations(Operations, pCspInformation, ppValue) {
        result := ComCall(16, this, "int", Operations, "ptr", pCspInformation, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICspInformation} pCspInformation 
     * @param {Pointer<ICspAlgorithms>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-getencryptioncspalgorithms
     */
    GetEncryptionCspAlgorithms(pCspInformation, ppValue) {
        result := ComCall(17, this, "ptr", pCspInformation, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICspInformation} pCspInformation 
     * @param {Pointer<IObjectIds>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-gethashalgorithms
     */
    GetHashAlgorithms(pCspInformation, ppValue) {
        result := ComCall(18, this, "ptr", pCspInformation, "ptr*", ppValue, "HRESULT")
        return result
    }
}
