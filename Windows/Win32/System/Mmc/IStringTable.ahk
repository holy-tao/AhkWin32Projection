#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IStringTable interface is introduced in MMC 1.1.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-istringtable
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IStringTable extends IUnknown{
    /**
     * The interface identifier for IStringTable
     * @type {Guid}
     */
    static IID => Guid("{de40b7a4-0f65-11d2-8e25-00c04f8ecd78}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszAdd 
     * @param {Pointer<UInt32>} pStringID 
     * @returns {HRESULT} 
     */
    AddString(pszAdd, pStringID) {
        pszAdd := pszAdd is String ? StrPtr(pszAdd) : pszAdd

        result := ComCall(3, this, "ptr", pszAdd, "uint*", pStringID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StringID 
     * @param {Integer} cchBuffer 
     * @param {PWSTR} lpBuffer 
     * @param {Pointer<UInt32>} pcchOut 
     * @returns {HRESULT} 
     */
    GetString(StringID, cchBuffer, lpBuffer, pcchOut) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        result := ComCall(4, this, "uint", StringID, "uint", cchBuffer, "ptr", lpBuffer, "uint*", pcchOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StringID 
     * @param {Pointer<UInt32>} pcchString 
     * @returns {HRESULT} 
     */
    GetStringLength(StringID, pcchString) {
        result := ComCall(5, this, "uint", StringID, "uint*", pcchString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StringID 
     * @returns {HRESULT} 
     */
    DeleteString(StringID) {
        result := ComCall(6, this, "uint", StringID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteAllStrings() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszFind 
     * @param {Pointer<UInt32>} pStringID 
     * @returns {HRESULT} 
     */
    FindString(pszFind, pStringID) {
        pszFind := pszFind is String ? StrPtr(pszFind) : pszFind

        result := ComCall(8, this, "ptr", pszFind, "uint*", pStringID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumString>} ppEnum 
     * @returns {HRESULT} 
     */
    Enumerate(ppEnum) {
        result := ComCall(9, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
