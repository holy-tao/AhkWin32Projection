#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Gaming
 * @version v4.0.30319
 */
class IGameStatistics extends IUnknown{
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
     * 
     * @param {Pointer<UInt32>} cch 
     * @returns {HRESULT} 
     */
    GetMaxCategoryLength(cch) {
        result := ComCall(3, this, "uint*", cch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} cch 
     * @returns {HRESULT} 
     */
    GetMaxNameLength(cch) {
        result := ComCall(4, this, "uint*", cch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} cch 
     * @returns {HRESULT} 
     */
    GetMaxValueLength(cch) {
        result := ComCall(5, this, "uint*", cch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pMax 
     * @returns {HRESULT} 
     */
    GetMaxCategories(pMax) {
        result := ComCall(6, this, "ushort*", pMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pMax 
     * @returns {HRESULT} 
     */
    GetMaxStatsPerCategory(pMax) {
        result := ComCall(7, this, "ushort*", pMax, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(8, this, "ushort", categoryIndex, "ptr", title, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} categoryIndex 
     * @param {Pointer<PWSTR>} pTitle 
     * @returns {HRESULT} 
     */
    GetCategoryTitle(categoryIndex, pTitle) {
        result := ComCall(9, this, "ushort", categoryIndex, "ptr", pTitle, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(10, this, "ushort", categoryIndex, "ushort", statIndex, "ptr", pName, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(11, this, "ushort", categoryIndex, "ushort", statIndex, "ptr", name, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} trackChanges 
     * @returns {HRESULT} 
     */
    Save(trackChanges) {
        result := ComCall(12, this, "int", trackChanges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} categoryIndex 
     * @returns {HRESULT} 
     */
    SetLastPlayedCategory(categoryIndex) {
        result := ComCall(13, this, "uint", categoryIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCategoryIndex 
     * @returns {HRESULT} 
     */
    GetLastPlayedCategory(pCategoryIndex) {
        result := ComCall(14, this, "uint*", pCategoryIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
