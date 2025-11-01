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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddString", "GetString", "GetStringLength", "DeleteString", "DeleteAllStrings", "FindString", "Enumerate"]

    /**
     * 
     * @param {PWSTR} pszAdd 
     * @param {Pointer<Integer>} pStringID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-istringtable-addstring
     */
    AddString(pszAdd, pStringID) {
        pszAdd := pszAdd is String ? StrPtr(pszAdd) : pszAdd

        pStringIDMarshal := pStringID is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pszAdd, pStringIDMarshal, pStringID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StringID 
     * @param {Integer} cchBuffer 
     * @param {PWSTR} lpBuffer 
     * @param {Pointer<Integer>} pcchOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-istringtable-getstring
     */
    GetString(StringID, cchBuffer, lpBuffer, pcchOut) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        pcchOutMarshal := pcchOut is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", StringID, "uint", cchBuffer, "ptr", lpBuffer, pcchOutMarshal, pcchOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StringID 
     * @param {Pointer<Integer>} pcchString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-istringtable-getstringlength
     */
    GetStringLength(StringID, pcchString) {
        pcchStringMarshal := pcchString is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", StringID, pcchStringMarshal, pcchString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StringID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-istringtable-deletestring
     */
    DeleteString(StringID) {
        result := ComCall(6, this, "uint", StringID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-istringtable-deleteallstrings
     */
    DeleteAllStrings() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszFind 
     * @param {Pointer<Integer>} pStringID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-istringtable-findstring
     */
    FindString(pszFind, pStringID) {
        pszFind := pszFind is String ? StrPtr(pszFind) : pszFind

        pStringIDMarshal := pStringID is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pszFind, pStringIDMarshal, pStringID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumString>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-istringtable-enumerate
     */
    Enumerate(ppEnum) {
        result := ComCall(9, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
