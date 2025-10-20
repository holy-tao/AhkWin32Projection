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
     * 
     * @param {Integer} Index 
     * @param {Pointer<ICspInformation>} pVal 
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
     * @param {Pointer<ICspInformation>} pVal 
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
     * @returns {HRESULT} 
     */
    AddAvailableCsps() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {Pointer<ICspInformation>} ppCspInformation 
     * @returns {HRESULT} 
     */
    get_ItemByName(strName, ppCspInformation) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(14, this, "ptr", strName, "ptr", ppCspInformation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strProviderName 
     * @param {Integer} LegacyKeySpec 
     * @param {Pointer<ICspStatus>} ppValue 
     * @returns {HRESULT} 
     */
    GetCspStatusFromProviderName(strProviderName, LegacyKeySpec, ppValue) {
        strProviderName := strProviderName is String ? BSTR.Alloc(strProviderName).Value : strProviderName

        result := ComCall(15, this, "ptr", strProviderName, "int", LegacyKeySpec, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Operations 
     * @param {Pointer<ICspInformation>} pCspInformation 
     * @param {Pointer<ICspStatuses>} ppValue 
     * @returns {HRESULT} 
     */
    GetCspStatusesFromOperations(Operations, pCspInformation, ppValue) {
        result := ComCall(16, this, "int", Operations, "ptr", pCspInformation, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICspInformation>} pCspInformation 
     * @param {Pointer<ICspAlgorithms>} ppValue 
     * @returns {HRESULT} 
     */
    GetEncryptionCspAlgorithms(pCspInformation, ppValue) {
        result := ComCall(17, this, "ptr", pCspInformation, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICspInformation>} pCspInformation 
     * @param {Pointer<IObjectIds>} ppValue 
     * @returns {HRESULT} 
     */
    GetHashAlgorithms(pCspInformation, ppValue) {
        result := ComCall(18, this, "ptr", pCspInformation, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
