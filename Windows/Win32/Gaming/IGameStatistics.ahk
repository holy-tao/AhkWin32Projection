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
     * @returns {Integer} 
     */
    GetMaxCategoryLength() {
        result := ComCall(3, this, "uint*", &cch := 0, "HRESULT")
        return cch
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxNameLength() {
        result := ComCall(4, this, "uint*", &cch := 0, "HRESULT")
        return cch
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxValueLength() {
        result := ComCall(5, this, "uint*", &cch := 0, "HRESULT")
        return cch
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxCategories() {
        result := ComCall(6, this, "ushort*", &pMax := 0, "HRESULT")
        return pMax
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxStatsPerCategory() {
        result := ComCall(7, this, "ushort*", &pMax := 0, "HRESULT")
        return pMax
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
     * @returns {PWSTR} 
     */
    GetCategoryTitle(categoryIndex) {
        result := ComCall(9, this, "ushort", categoryIndex, "ptr*", &pTitle := 0, "HRESULT")
        return pTitle
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
        pNameMarshal := pName is VarRef ? "ptr*" : "ptr"
        pValueMarshal := pValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "ushort", categoryIndex, "ushort", statIndex, pNameMarshal, pName, pValueMarshal, pValue, "HRESULT")
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
     * @returns {Integer} 
     */
    GetLastPlayedCategory() {
        result := ComCall(14, this, "uint*", &pCategoryIndex := 0, "HRESULT")
        return pCategoryIndex
    }
}
