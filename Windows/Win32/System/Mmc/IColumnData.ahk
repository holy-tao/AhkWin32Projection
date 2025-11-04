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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetColumnConfigData", "GetColumnConfigData", "SetColumnSortData", "GetColumnSortData"]

    /**
     * 
     * @param {Pointer<SColumnSetID>} pColID 
     * @param {Pointer<MMC_COLUMN_SET_DATA>} pColSetData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icolumndata-setcolumnconfigdata
     */
    SetColumnConfigData(pColID, pColSetData) {
        result := ComCall(3, this, "ptr", pColID, "ptr", pColSetData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SColumnSetID>} pColID 
     * @param {Pointer<Pointer<MMC_COLUMN_SET_DATA>>} ppColSetData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icolumndata-getcolumnconfigdata
     */
    GetColumnConfigData(pColID, ppColSetData) {
        ppColSetDataMarshal := ppColSetData is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pColID, ppColSetDataMarshal, ppColSetData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SColumnSetID>} pColID 
     * @param {Pointer<MMC_SORT_SET_DATA>} pColSortData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icolumndata-setcolumnsortdata
     */
    SetColumnSortData(pColID, pColSortData) {
        result := ComCall(5, this, "ptr", pColID, "ptr", pColSortData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SColumnSetID>} pColID 
     * @param {Pointer<Pointer<MMC_SORT_SET_DATA>>} ppColSortData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icolumndata-getcolumnsortdata
     */
    GetColumnSortData(pColID, ppColSortData) {
        ppColSortDataMarshal := ppColSortData is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", pColID, ppColSortDataMarshal, ppColSortData, "HRESULT")
        return result
    }
}
