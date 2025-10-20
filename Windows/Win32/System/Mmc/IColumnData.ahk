#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IColumnData interface is introduced in MMC 1.2.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-icolumndata
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IColumnData extends IUnknown{
    /**
     * The interface identifier for IColumnData
     * @type {Guid}
     */
    static IID => Guid("{547c1354-024d-11d3-a707-00c04f8ef4cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<SColumnSetID>} pColID 
     * @param {Pointer<MMC_COLUMN_SET_DATA>} pColSetData 
     * @returns {HRESULT} 
     */
    SetColumnConfigData(pColID, pColSetData) {
        result := ComCall(3, this, "ptr", pColID, "ptr", pColSetData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SColumnSetID>} pColID 
     * @param {Pointer<MMC_COLUMN_SET_DATA>} ppColSetData 
     * @returns {HRESULT} 
     */
    GetColumnConfigData(pColID, ppColSetData) {
        result := ComCall(4, this, "ptr", pColID, "ptr", ppColSetData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SColumnSetID>} pColID 
     * @param {Pointer<MMC_SORT_SET_DATA>} pColSortData 
     * @returns {HRESULT} 
     */
    SetColumnSortData(pColID, pColSortData) {
        result := ComCall(5, this, "ptr", pColID, "ptr", pColSortData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SColumnSetID>} pColID 
     * @param {Pointer<MMC_SORT_SET_DATA>} ppColSortData 
     * @returns {HRESULT} 
     */
    GetColumnSortData(pColID, ppColSortData) {
        result := ComCall(6, this, "ptr", pColID, "ptr", ppColSortData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
