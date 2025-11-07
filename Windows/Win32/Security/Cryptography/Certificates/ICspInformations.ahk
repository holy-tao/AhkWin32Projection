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
     * 
     * @param {Integer} Index 
     * @returns {ICspInformation} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-get_itembyindex
     */
    get_ItemByIndex(Index) {
        result := ComCall(7, this, "int", Index, "ptr*", &pVal := 0, "HRESULT")
        return ICspInformation(pVal)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
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
     * @returns {ICspInformation} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-get_itembyname
     */
    get_ItemByName(strName) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(14, this, "ptr", strName, "ptr*", &ppCspInformation := 0, "HRESULT")
        return ICspInformation(ppCspInformation)
    }

    /**
     * 
     * @param {BSTR} strProviderName 
     * @param {Integer} LegacyKeySpec 
     * @returns {ICspStatus} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-getcspstatusfromprovidername
     */
    GetCspStatusFromProviderName(strProviderName, LegacyKeySpec) {
        strProviderName := strProviderName is String ? BSTR.Alloc(strProviderName).Value : strProviderName

        result := ComCall(15, this, "ptr", strProviderName, "int", LegacyKeySpec, "ptr*", &ppValue := 0, "HRESULT")
        return ICspStatus(ppValue)
    }

    /**
     * 
     * @param {Integer} Operations 
     * @param {ICspInformation} pCspInformation 
     * @returns {ICspStatuses} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-getcspstatusesfromoperations
     */
    GetCspStatusesFromOperations(Operations, pCspInformation) {
        result := ComCall(16, this, "int", Operations, "ptr", pCspInformation, "ptr*", &ppValue := 0, "HRESULT")
        return ICspStatuses(ppValue)
    }

    /**
     * 
     * @param {ICspInformation} pCspInformation 
     * @returns {ICspAlgorithms} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-getencryptioncspalgorithms
     */
    GetEncryptionCspAlgorithms(pCspInformation) {
        result := ComCall(17, this, "ptr", pCspInformation, "ptr*", &ppValue := 0, "HRESULT")
        return ICspAlgorithms(ppValue)
    }

    /**
     * 
     * @param {ICspInformation} pCspInformation 
     * @returns {IObjectIds} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspinformations-gethashalgorithms
     */
    GetHashAlgorithms(pCspInformation) {
        result := ComCall(18, this, "ptr", pCspInformation, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectIds(ppValue)
    }
}
