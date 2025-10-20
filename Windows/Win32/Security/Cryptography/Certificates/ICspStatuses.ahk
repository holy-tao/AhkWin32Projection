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
     * 
     * @param {Integer} Index 
     * @param {Pointer<ICspStatus>} pVal 
     * @returns {HRESULT} 
     */
    get_ItemByIndex(Index, pVal) {
        result := ComCall(7, this, "int", Index, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_Count(pVal) {
        result := ComCall(8, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pVal 
     * @returns {HRESULT} 
     */
    get__NewEnum(pVal) {
        result := ComCall(9, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICspStatus>} pVal 
     * @returns {HRESULT} 
     */
    Add(pVal) {
        result := ComCall(10, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     */
    Remove(Index) {
        result := ComCall(11, this, "int", Index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strCspName 
     * @param {BSTR} strAlgorithmName 
     * @param {Pointer<ICspStatus>} ppValue 
     * @returns {HRESULT} 
     */
    get_ItemByName(strCspName, strAlgorithmName, ppValue) {
        strCspName := strCspName is String ? BSTR.Alloc(strCspName).Value : strCspName
        strAlgorithmName := strAlgorithmName is String ? BSTR.Alloc(strAlgorithmName).Value : strAlgorithmName

        result := ComCall(13, this, "ptr", strCspName, "ptr", strAlgorithmName, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Ordinal 
     * @param {Pointer<ICspStatus>} ppValue 
     * @returns {HRESULT} 
     */
    get_ItemByOrdinal(Ordinal, ppValue) {
        result := ComCall(14, this, "int", Ordinal, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strCspName 
     * @param {BSTR} strAlgorithmName 
     * @param {Integer} Operations 
     * @param {Pointer<ICspStatus>} ppValue 
     * @returns {HRESULT} 
     */
    get_ItemByOperations(strCspName, strAlgorithmName, Operations, ppValue) {
        strCspName := strCspName is String ? BSTR.Alloc(strCspName).Value : strCspName
        strAlgorithmName := strAlgorithmName is String ? BSTR.Alloc(strAlgorithmName).Value : strAlgorithmName

        result := ComCall(15, this, "ptr", strCspName, "ptr", strAlgorithmName, "int", Operations, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICspStatus>} pCspStatus 
     * @param {Pointer<ICspStatus>} ppValue 
     * @returns {HRESULT} 
     */
    get_ItemByProvider(pCspStatus, ppValue) {
        result := ComCall(16, this, "ptr", pCspStatus, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
