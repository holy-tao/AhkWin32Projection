#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IColumnData interface is introduced in MMC 1.2.
 * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nn-mmc-icolumndata
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
     * @remarks
     * If the user selects a scope item, and the snap-in then calls <b>IColumnData::SetColumnConfigData</b> to modify the column configuration data of the list view of the selected item. MMC will apply the changes to the list view only after the user has deselected and then reselected the item. Be aware that MMC also applies the changes to all column sets with the same ID, so if the user selects a different item with the same column set ID, MMC will also apply the persisted data to it.
     * 
     * Calling 
     * <b>IColumnData::SetColumnConfigData</b> clears the previously stored sort information and column configuration information.
     * @param {Pointer<SColumnSetID>} pColID A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-scolumnsetid">SColumnSetID</a> structure that contains the ID of the column set whose data is to be set.
     * @param {Pointer<MMC_COLUMN_SET_DATA>} pColSetData A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_column_set_data">MMC_COLUMN_SET_DATA</a> structure that contains the number of columns in the column set as well as the column data to be set.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nf-mmc-icolumndata-setcolumnconfigdata
     */
    SetColumnConfigData(pColID, pColSetData) {
        result := ComCall(3, this, "ptr", pColID, "ptr", pColSetData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IColumnData::GetColumnConfigData method enables a snap-in to retrieve the current width, order, and hidden status of each column in a column set that is stored in memory by MMC.
     * @remarks
     * Suppose the user selects a scope item and then modifies the column configuration data of the list view of the selected item. If the snap-in calls <b>IColumnData::GetColumnConfigData</b> to retrieve that list view's column configuration data, the method will return the new data, regardless of whether or not the user has deselected the item.
     * 
     * The 
     * <b>MMC_COLUMN_SET_DATA</b> structure and its array of 
     * <b>MMC_COLUMN_DATA</b> structures are allocated as one contiguous memory block by MMC during calls to 
     * <b>GetColumnConfigData</b>. The snap-in must call <b>CoTaskMemFree</b> with the given pointer to 
     * <b>MMC_COLUMN_SET_DATA</b>. This frees the entire memory block.
     * 
     * All data set and retrieved by the methods of the 
     * <b>IColumnData</b> interface is persisted by MMC in memory, and not in a stream or storage medium. This data is saved to an .MSC console file only when the user clicks the 
     * <b>Save</b> menu command.
     * @param {Pointer<SColumnSetID>} pColID A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-scolumnsetid">SColumnSetID</a> structure that holds the ID of the column set whose data is to be retrieved.
     * @returns {Pointer<MMC_COLUMN_SET_DATA>} A pointer to a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_column_set_data">MMC_COLUMN_SET_DATA</a> structure that will hold the retrieved column data.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nf-mmc-icolumndata-getcolumnconfigdata
     */
    GetColumnConfigData(pColID) {
        result := ComCall(4, this, "ptr", pColID, "ptr*", &ppColSetData := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppColSetData
    }

    /**
     * The IColumnData::SetColumnSortData method enables a snap-in to set the sorted column and sorting direction for columns in a column set.
     * @remarks
     * If the user selects a scope item, and the snap-in then calls <b>IColumnData::SetColumnSortData</b> to modify the sort data of the list view of the selected item. MMC will apply the changes to the list view only after the user has deselected and then reselected the item. Be aware that MMC also applies the changes to all column sets with the same ID, so if the user selects a different item with the same column set ID, MMC will also apply the persisted data to it.
     * 
     * MMC 1.2 supports only single-column sorting, which is why 
     * SetColumnSortData returns <b>E_FAIL</b> when the number of sort columns is greater than 1.
     * 
     * All data set and retrieved by the methods of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icolumndata">IColumnData</a> interface is persisted by MMC in memory, and not in a stream or storage medium. This data is persisted to an .msc console file only when the user chooses the 
     * <b>Save</b> menu command.
     * @param {Pointer<SColumnSetID>} pColID A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-scolumnsetid">SColumnSetID</a> structure that contains the column set ID of the column set whose sort data is to be set.
     * @param {Pointer<MMC_SORT_SET_DATA>} pColSortData A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_sort_set_data">MMC_SORT_SET_DATA</a> structure that contains the column sort data of the column set.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nf-mmc-icolumndata-setcolumnsortdata
     */
    SetColumnSortData(pColID, pColSortData) {
        result := ComCall(5, this, "ptr", pColID, "ptr", pColSortData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IColumnData::GetColumnSortData method enables a snap-in to retrieve from memory the sorted column and sorting direction for columns in a column set.
     * @remarks
     * If the user selects a scope item and then modifies the sort data of the list view of the selected item. If the snap-in calls <b>IColumnData::GetColumnSortData</b> to retrieve the same sort data, the method will return the new data, regardless of whether the user has deselected the item or not.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_sort_set_data">MMC_SORT_SET_DATA</a> structure and its array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_sort_data">MMC_SORT_DATA</a> structures are allocated as one contiguous memory block by MMC during calls to 
     * GetColumnSortData. The snap-in must call CoTaskMemFree with the given pointer to 
     * <b>MMC_SORT_SET_DATA</b>. This frees the entire memory block.
     * 
     * All data set and retrieved by the methods of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icolumndata">IColumnData</a> interface is persisted by MMC in memory, and not in a stream or storage medium. This data is persisted to an .msc console file only when the user chooses the 
     * <b>Save</b> menu command.
     * @param {Pointer<SColumnSetID>} pColID A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-scolumnsetid">SColumnSetID</a> structure that contains the ID of the column set whose sort data is to be retrieved.
     * @returns {Pointer<MMC_SORT_SET_DATA>} A pointer to a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_sort_set_data">MMC_SORT_SET_DATA</a> structure that will contain the column sort data of the column set.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nf-mmc-icolumndata-getcolumnsortdata
     */
    GetColumnSortData(pColID) {
        result := ComCall(6, this, "ptr", pColID, "ptr*", &ppColSortData := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppColSortData
    }
}
