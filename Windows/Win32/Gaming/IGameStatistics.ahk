#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Gaming
 * @version v4.0.30319
 */
class IGameStatistics extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameStatistics
     * @type {Guid}
     */
    static IID => Guid("{3887c9ca-04a0-42ae-bc4c-5fa6c7721145}")

    /**
     * The class identifier for GameStatistics
     * @type {Guid}
     */
    static CLSID => Guid("{dbc85a2c-c0dc-4961-b6e2-d28b62c11ad4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMaxCategoryLength", "GetMaxNameLength", "GetMaxValueLength", "GetMaxCategories", "GetMaxStatsPerCategory", "SetCategoryTitle", "GetCategoryTitle", "GetStatistic", "SetStatistic", "Save", "SetLastPlayedCategory", "GetLastPlayedCategory"]

    /**
     * 
     * @param {Pointer<Integer>} cch 
     * @returns {HRESULT} 
     */
    GetMaxCategoryLength(cch) {
        cchMarshal := cch is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, cchMarshal, cch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} cch 
     * @returns {HRESULT} 
     */
    GetMaxNameLength(cch) {
        cchMarshal := cch is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, cchMarshal, cch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} cch 
     * @returns {HRESULT} 
     */
    GetMaxValueLength(cch) {
        cchMarshal := cch is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, cchMarshal, cch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMax 
     * @returns {HRESULT} 
     */
    GetMaxCategories(pMax) {
        pMaxMarshal := pMax is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, pMaxMarshal, pMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMax 
     * @returns {HRESULT} 
     */
    GetMaxStatsPerCategory(pMax) {
        pMaxMarshal := pMax is VarRef ? "ushort*" : "ptr"

        result := ComCall(7, this, pMaxMarshal, pMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} categoryIndex 
     * @param {PWSTR} title 
     * @returns {HRESULT} 
     */
    SetCategoryTitle(categoryIndex, title) {
        title := title is String ? StrPtr(title) : title

        result := ComCall(8, this, "ushort", categoryIndex, "ptr", title, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} categoryIndex 
     * @param {Pointer<PWSTR>} pTitle 
     * @returns {HRESULT} 
     */
    GetCategoryTitle(categoryIndex, pTitle) {
        result := ComCall(9, this, "ushort", categoryIndex, "ptr", pTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} categoryIndex 
     * @param {Integer} statIndex 
     * @param {Pointer<PWSTR>} pName 
     * @param {Pointer<PWSTR>} pValue 
     * @returns {HRESULT} 
     */
    GetStatistic(categoryIndex, statIndex, pName, pValue) {
        result := ComCall(10, this, "ushort", categoryIndex, "ushort", statIndex, "ptr", pName, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} categoryIndex 
     * @param {Integer} statIndex 
     * @param {PWSTR} name 
     * @param {PWSTR} value 
     * @returns {HRESULT} 
     */
    SetStatistic(categoryIndex, statIndex, name, value) {
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        result := ComCall(11, this, "ushort", categoryIndex, "ushort", statIndex, "ptr", name, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} trackChanges 
     * @returns {HRESULT} 
     */
    Save(trackChanges) {
        result := ComCall(12, this, "int", trackChanges, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} categoryIndex 
     * @returns {HRESULT} 
     */
    SetLastPlayedCategory(categoryIndex) {
        result := ComCall(13, this, "uint", categoryIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCategoryIndex 
     * @returns {HRESULT} 
     */
    GetLastPlayedCategory(pCategoryIndex) {
        pCategoryIndexMarshal := pCategoryIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pCategoryIndexMarshal, pCategoryIndex, "HRESULT")
        return result
    }
}
