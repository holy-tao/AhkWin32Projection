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
     * The IColumnData::SetColumnConfigData method enables a snap-in to set the persisted width, order, and hidden status of columns in a column set.
     * @param {Pointer<SColumnSetID>} pColID A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-scolumnsetid">SColumnSetID</a> structure that contains the ID of the column set whose data is to be set.
     * @param {Pointer<MMC_COLUMN_SET_DATA>} pColSetData A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_column_set_data">MMC_COLUMN_SET_DATA</a> structure that contains the number of columns in the column set as well as the column data to be set.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-icolumndata-setcolumnconfigdata
     */
    SetColumnConfigData(pColID, pColSetData) {
        result := ComCall(3, this, "ptr", pColID, "ptr", pColSetData, "HRESULT")
        return result
    }

    /**
     * The IColumnData::GetColumnConfigData method enables a snap-in to retrieve the current width, order, and hidden status of each column in a column set that is stored in memory by MMC.
     * @param {Pointer<SColumnSetID>} pColID A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-scolumnsetid">SColumnSetID</a> structure that holds the ID of the column set whose data is to be retrieved.
     * @returns {Pointer<MMC_COLUMN_SET_DATA>} A pointer to a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_column_set_data">MMC_COLUMN_SET_DATA</a> structure that will hold the retrieved column data.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-icolumndata-getcolumnconfigdata
     */
    GetColumnConfigData(pColID) {
        result := ComCall(4, this, "ptr", pColID, "ptr*", &ppColSetData := 0, "HRESULT")
        return ppColSetData
    }

    /**
     * The IColumnData::SetColumnSortData method enables a snap-in to set the sorted column and sorting direction for columns in a column set.
     * @param {Pointer<SColumnSetID>} pColID A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-scolumnsetid">SColumnSetID</a> structure that contains the column set ID of the column set whose sort data is to be set.
     * @param {Pointer<MMC_SORT_SET_DATA>} pColSortData A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_sort_set_data">MMC_SORT_SET_DATA</a> structure that contains the column sort data of the column set.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-icolumndata-setcolumnsortdata
     */
    SetColumnSortData(pColID, pColSortData) {
        result := ComCall(5, this, "ptr", pColID, "ptr", pColSortData, "HRESULT")
        return result
    }

    /**
     * The IColumnData::GetColumnSortData method enables a snap-in to retrieve from memory the sorted column and sorting direction for columns in a column set.
     * @param {Pointer<SColumnSetID>} pColID A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-scolumnsetid">SColumnSetID</a> structure that contains the ID of the column set whose sort data is to be retrieved.
     * @returns {Pointer<MMC_SORT_SET_DATA>} A pointer to a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_sort_set_data">MMC_SORT_SET_DATA</a> structure that will contain the column sort data of the column set.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-icolumndata-getcolumnsortdata
     */
    GetColumnSortData(pColID) {
        result := ComCall(6, this, "ptr", pColID, "ptr*", &ppColSortData := 0, "HRESULT")
        return ppColSortData
    }
}
