#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Integer} Index 
     * @param {Pointer<ICspStatus>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspstatuses-get_itembyindex
     */
    get_ItemByIndex(Index, pVal) {
        result := ComCall(7, this, "int", Index, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspstatuses-get_count
     */
    get_Count(pVal) {
        result := ComCall(8, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspstatuses-get__newenum
     */
    get__NewEnum(pVal) {
        result := ComCall(9, this, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICspStatus} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspstatuses-add
     */
    Add(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspstatuses-remove
     */
    Remove(Index) {
        result := ComCall(11, this, "int", Index, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspstatuses-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strCspName 
     * @param {BSTR} strAlgorithmName 
     * @param {Pointer<ICspStatus>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspstatuses-get_itembyname
     */
    get_ItemByName(strCspName, strAlgorithmName, ppValue) {
        strCspName := strCspName is String ? BSTR.Alloc(strCspName).Value : strCspName
        strAlgorithmName := strAlgorithmName is String ? BSTR.Alloc(strAlgorithmName).Value : strAlgorithmName

        result := ComCall(13, this, "ptr", strCspName, "ptr", strAlgorithmName, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Ordinal 
     * @param {Pointer<ICspStatus>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspstatuses-get_itembyordinal
     */
    get_ItemByOrdinal(Ordinal, ppValue) {
        result := ComCall(14, this, "int", Ordinal, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strCspName 
     * @param {BSTR} strAlgorithmName 
     * @param {Integer} Operations 
     * @param {Pointer<ICspStatus>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspstatuses-get_itembyoperations
     */
    get_ItemByOperations(strCspName, strAlgorithmName, Operations, ppValue) {
        strCspName := strCspName is String ? BSTR.Alloc(strCspName).Value : strCspName
        strAlgorithmName := strAlgorithmName is String ? BSTR.Alloc(strAlgorithmName).Value : strAlgorithmName

        result := ComCall(15, this, "ptr", strCspName, "ptr", strAlgorithmName, "int", Operations, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICspStatus} pCspStatus 
     * @param {Pointer<ICspStatus>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspstatuses-get_itembyprovider
     */
    get_ItemByProvider(pCspStatus, ppValue) {
        result := ComCall(16, this, "ptr", pCspStatus, "ptr*", ppValue, "HRESULT")
        return result
    }
}
