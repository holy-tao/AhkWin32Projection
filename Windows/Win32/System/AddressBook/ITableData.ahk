#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPITable.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides utility methods for working with tables. MAPI provides objects that implement ITableData to help service providers perform table maintenance.
 * @remarks
 * The MAPI implementation of **ITableData** works with tables by holding all of the data and any associated restrictions in memory, making it unsuitable for use with very large tables. Large restrictions and complex operations such as categorization are not supported. 
 *   
 * Table data objects identify rows by using an index column, a property that is guaranteed to have a unique value for each row. Most service providers use the **PR_INSTANCE_KEY** ([PidTagInstanceKey](pidtaginstancekey-canonical-property.md)) property as the index column. Properties that have multiple values cannot be used as an index column.
 *   
 * Table data objects generate a single notification regardless of the number of rows affected by a change or deletion. If a target row in an operation does not exist, a row is added.
 * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/itabledataiunknown
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class ITableData extends IUnknown{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HrGetView", "HrModifyRow", "HrDeleteRow", "HrQueryRow", "HrEnumRow", "HrNotify", "HrInsertRow", "HrModifyRows", "HrDeleteRows"]

    /**
     * 
     * @remarks
     * The **ITableData::HrGetView** method creates a read-only view of the data in the table, sorted in the order pointed to by the  _lpSSortOrderSet_ parameter. The cursor is placed at the beginning of the first row in the view. An **IMAPITable** interface implementation for accessing the view is returned. 
     *   
     * Service providers call **HrGetView** when they need to give a client access to a table. **HrGetView** creates the view and returns the **IMAPITable** pointer. Service providers in turn pass the pointer on to the client. When the client is finished using the table and calls its [IUnknown::Release](https://msdn.microsoft.com/library/4b494c6f-f0ee-4c35-ae45-ed956f40dc7a%28Office.15%29.aspx) method, **HrGetView** calls the callback function pointed to by the  _lpfCallerRelease_ parameter. 
     *   
     * If a service provider needs to return to a client a view that has a customized column set or a restriction, the provider can call the view's [IMAPITable::SetColumns](imapitable-setcolumns.md) and [IMAPITable::Restrict](imapitable-restrict.md) methods before allowing the client access.
     * @param {Pointer<SSortOrderSet>} lpSSortOrderSet > [in] A pointer to a sort order structure that describes the sort order for the table view. If NULL is passed in the _lpSSortOrderSet_ parameter, the view is not sorted.
     * @param {Pointer<Pointer<CALLERRELEASE>>} lpfCallerRelease > [in] A pointer to a callback function based on the [CALLERRELEASE](callerrelease.md) prototype that MAPI calls when it releases the view. If NULL is passed in the _lpfCallerRelease_ parameter, no function is called on release of the view.
     * @param {Integer} ulCallerData > [in] The data that must be saved with the new view and passed to the callback function pointed to by  _lpfCallerRelease_.
     * @returns {IMAPITable} > [out] A pointer to a pointer to the newly created view.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/itabledata-hrgetview
     */
    HrGetView(lpSSortOrderSet, lpfCallerRelease, ulCallerData) {
        lpfCallerReleaseMarshal := lpfCallerRelease is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", lpSSortOrderSet, lpfCallerReleaseMarshal, lpfCallerRelease, "uint", ulCallerData, "ptr*", &lppMAPITable := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMAPITable(lppMAPITable)
    }

    /**
     * 
     * @remarks
     * The **ITableData::HrModifyRow** method inserts the row described by the **SRow** structure pointed to by the  _lpSRow_ parameter. If a row that has the same value for its index column as the row that  _lpSRow_ points to already exists in the table, the existing row is replaced. If no row exists that matches the one included in the **SRow** structure, **HrModifyRow** adds the row to the end of the table. 
     *   
     * All views of the table are modified to include the row pointed to by  _lpSRow_. However, if a view has a restriction in place that excludes the row, it may not be visible to the user. 
     *   
     * The columns in the row pointed to by  _lpSRow_ do not have to be in the same order as the columns in the table. The caller can also include as columns properties that are not currently in the table. For existing views, **HrModifyRow** makes these new columns available but does not include them in the current column set. For future views, **HrModifyRow** includes the new columns in the column set. 
     *   
     * After **HrModifyRow** adds the row, notifications are sent to all clients or service providers that have a view of the table and that have called the table's [IMAPITable::Advise](imapitable-advise.md) method to register for notifications.
     * @param {Pointer<SRow>} param0 
     * @returns {HRESULT} S_OK 
     *   
     * > The row was successfully inserted or modified.
     *     
     * MAPI_E_INVALID_PARAMETER 
     *   
     * > The passed-in row does not have an index column.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/itabledata-hrmodifyrow
     */
    HrModifyRow(param0) {
        result := ComCall(4, this, "ptr", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @remarks
     * The **ITableData::HrDeleteRow** method removes the table row that contains the column that matches the property pointed to by the  _lpSPropValue_ parameter. The data for the row is deleted and the row is removed from all open views. 
     *   
     * After the row is deleted, notifications are sent to all clients or service providers that have a view of the table and that have called the table's [IMAPITable::Advise](imapitable-advise.md) method to register for notifications. 
     *   
     * Deleting a row does not reduce the column set that is available to existing views or subsequently opened views, even if the deleted row is the last row that has a value for a specific column.
     * @param {Pointer<SPropValue>} lpSPropValue > [in] A pointer to a property value structure that describes the index column for the row to be deleted. The **ulPropTag** member of the property value structure should contain the same property tag as the  _ulPropTagIndexColumn_ parameter from the call to the [CreateTable](createtable.md) function.
     * @returns {HRESULT} S_OK 
     *   
     * > The row was successfully deleted.
     *     
     * MAPI_E_NOT_FOUND 
     *   
     * > The property pointed to by the  _lpSPropValue_ parameter does not identify a row in the table.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/itabledata-hrdeleterow
     */
    HrDeleteRow(lpSPropValue) {
        result := ComCall(5, this, "ptr", lpSPropValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @remarks
     * The **ITableData::HrQueryRow** method retrieves all of the properties for the row that has an index column that matches the value of the index column included in the property structure pointed to by  _lpSPropValue_. **HrQueryRow** also returns the row number, if the caller requests it, that identifies the row's position in the table. 
     *   
     * Because **HrQueryRow** does not modify the **SPropValue** structure pointed to by  _lpSPropValue_, callers must free the structure when **HrQueryRow** returns. Callers must also free the **SRow** structure that contains the retrieved row.
     * @param {Pointer<SPropValue>} lpsPropValue 
     * @param {Pointer<Pointer<SRow>>} lppSRow > [out] A pointer to a pointer to the retrieved row.
     * @param {Pointer<Integer>} lpuliRow > [in, out] On input, a valid pointer or NULL, which indicates that no information needs to be returned. On output, a valid pointer that points to the row's row number, a sequential number that identifies the row's position in the table.
     * @returns {HRESULT} S_OK 
     *   
     * > The row was successfully retrieved.
     *     
     * MAPI_E_INVALID_PARAMETER 
     *   
     * > The [SPropValue](spropvalue.md) structure that  _lpSPropValue_ points to does not contain the index column property.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/itabledata-hrqueryrow
     */
    HrQueryRow(lpsPropValue, lppSRow, lpuliRow) {
        lppSRowMarshal := lppSRow is VarRef ? "ptr*" : "ptr"
        lpuliRowMarshal := lpuliRow is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", lpsPropValue, lppSRowMarshal, lppSRow, lpuliRowMarshal, lpuliRow, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @remarks
     * The **ITableData::HrEnumRow** method retrieves a row based on a sequential number. This number represents the order of insertion (0 indicates the first row, and the number of rows minus 1 indicates the last row). MAPI maintains this chronological order of row insertion for the lifetime of the table data object. 
     *   
     * If the number specified in  _ulRowNumber_ does not correspond to a row in the table, **HrEnumRow** returns S_OK and sets the  _lppSRow_ parameter to NULL. 
     *   
     * MAPI allocates memory for the returned **SRow** structure by using the [MAPIAllocateBuffer](mapiallocatebuffer.md) function when the table data object is created. The caller must release this memory by calling the [MAPIFreeBuffer](mapifreebuffer.md) function. 
     *   
     * To retrieve rows from a table in the order that they were inserted, table data object users call the **HrEnumRow** method.
     * @param {Integer} ulRowNumber > [in] The number of the row for which to return properties. The value in the _ulRowNumber_ parameter can be any value from 0, which indicates the first row in the table, through n - 1, which indicates the last row in the table.
     * @param {Pointer<Pointer<SRow>>} lppSRow > [out] A pointer to a pointer to an [SRow](srow.md) structure that describes the target row.
     * @returns {HRESULT} S_OK 
     *   
     * > The row was retrieved successfully, or a row for the row number specified by the  _ulRowNumber_ parameter does not exist.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/itabledata-hrenumrow
     */
    HrEnumRow(ulRowNumber, lppSRow) {
        lppSRowMarshal := lppSRow is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "uint", ulRowNumber, lppSRowMarshal, lppSRow, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @remarks
     * The **ITableData::HrNotify** method sends a TABLE_ROW_MODIFIED notification for the row that matches the row described by the properties pointed to by the  _lpSPropValue_ parameter. **HrNotify** sends the notification regardless of whether changes have occurred to the row. All clients and service providers that have views of the table and have called [IMAPITable::Advise](imapitable-advise.md) to register for notifications on their views receive this notification.
     * @param {Integer} ulFlags > [in] Reserved; must be zero.
     * @param {Integer} cValues > [in] The count of property values in the [SPropValue](spropvalue.md) structure pointed to by the  _lpSPropValue_ parameter.
     * @param {Pointer<SPropValue>} lpSPropValue > [in] A pointer to an **SPropValue** structure that describes the values of the columns in the target row.
     * @returns {HRESULT} S_OK 
     *   
     * > The call succeeded and has returned the expected value or values.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/itabledata-hrnotify
     */
    HrNotify(ulFlags, cValues, lpSPropValue) {
        result := ComCall(8, this, "uint", ulFlags, "uint", cValues, "ptr", lpSPropValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @remarks
     * The **ITableData::HrInsertRow** method inserts a row into a table at a particular position. The new row is inserted after the row that is in the position specified by the  _uliRow_ parameter. 
     *   
     * If  _uliRow_ is set to the number of rows in the table, the new row is appended to the end of the table. 
     *   
     * The property that acts as the index column for the table must be included in the **lpProps** member of the [SRow](srow.md) structure pointed to by the  _lpSRow_ parameter. This index property, typically **PR_INSTANCE_KEY** ([PidTagInstanceKey](pidtaginstancekey-canonical-property.md)), is used to uniquely identify the row for future maintenance tasks.
     *   
     * The property columns in the **SRow** structure do not have to be in the same order as the property columns in the table. 
     *   
     * After the row is inserted, notifications are sent to all clients or service providers that have a view of the table and that have called the table's [IMAPITable::Advise](imapitable-advise.md) method to register for notifications. No notification is sent if the inserted row is not included in the view due to a restriction.
     * @param {Integer} uliRow > [in] A sequential row number that represents a specific row. The new row will be placed after the row that the number indicates. The  _uliRow_ parameter can contains row numbers from 0 through n, where n is the total number of rows in the table. Passing n in  _uliRow_ appends the row to the end of the table.
     * @param {Pointer<SRow>} lpSRow > [in] A pointer to an [SRow](srow.md) structure that describes the row to be inserted.
     * @returns {HRESULT} S_OK 
     *   
     * > The row was successfully inserted.
     *     
     * MAPI_E_INVALID_PARAMETER 
     *   
     * > A row that has the same value for its index column as the row to be inserted already exists in the table.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/itabledata-hrinsertrow
     */
    HrInsertRow(uliRow, lpSRow) {
        result := ComCall(9, this, "uint", uliRow, "ptr", lpSRow, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @remarks
     * The **ITableData::HrModifyRows** method inserts the rows described by the [SRowSet](srowset.md) structure pointed to by the  _lpSRowSet_ parameter. If the index column value of a row in the row set matches the value for an existing row in the table, the existing row is replaced. If no row exists that matches the one included in the **SRowSet** structure, **HrModifyRows** adds the row to the end of the table. 
     *   
     * All views of the table are modified to include the rows pointed to by  _lpSRowSet_. However, if a view has a restriction in place that excludes a row, it may not be visible to the user. 
     *   
     * The columns in the rows pointed to by  _lpSRowSet_ do not have to be in the same order as the columns in the table. The caller can also include as columns properties that are not currently in the table. For existing views, **HrModifyRows** makes these new columns available but does not include them in the current column set. For future views, **HrModifyRows** includes the new columns in the column set. 
     *   
     * After **HrModifyRows** has added the rows, notifications are sent to all clients or service providers that have a view of the table and that have called the table's [IMAPITable::Advise](imapitable-advise.md) method to register for notifications. MAPI sends TABLE_ROW_ADDED or TABLE_ROW_MODIFIED notifications for each row, up to eight rows. If more than eight rows are affected by the **HrModifyRows** call, MAPI sends a single TABLE_CHANGED notification instead.
     * @param {Integer} ulFlags > [in] Reserved; must be zero.
     * @param {Pointer<SRowSet>} lpSRowSet > [in] A pointer to an [SRowSet](srowset.md) structure that contains the set of rows to be added, replacing existing rows if necessary. One of the property value structures pointed to by the **lpProps** member of each [SRow](srow.md) structure in the row set should contain the index column, the same value that was specified in the _ulPropTagIndexColumn_ parameter in the call to the [CreateTable](createtable.md) function.
     * @returns {HRESULT} S_OK 
     *   
     * > The rows were successfully inserted or modified.
     *     
     * MAPI_E_INVALID_PARAMETER 
     *   
     * > One or more of the passed-in rows does not have an index column. If this error is returned, no rows are changed.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/itabledata-hrmodifyrows
     */
    HrModifyRows(ulFlags, lpSRowSet) {
        result := ComCall(10, this, "uint", ulFlags, "ptr", lpSRowSet, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @remarks
     * The **ITableData::HrDeleteRows** method locates and removes the table rows that contain the columns that match the property pointed to by the **lpProps** member of each **aRow** entry in the row set. An index column is used to identify each row; this column must have the same property tag as the property tag passed in the _ulPropTagIndexColumn_ parameter in the call to the [CreateTable](createtable.md) function. 
     *   
     * The number of rows that were actually deleted is returned in  _cRowsDeleted_. No error is returned if one or more rows could not be found. 
     *   
     * After the rows are deleted, notifications are sent to all clients or service providers that have a view of the table and that have called the table's [IMAPITable::Advise](imapitable-advise.md) method to register for notifications. 
     *   
     * Deleting rows does not reduce the columns available to existing table views or subsequently opened table views, even if the deleted rows are the last that have values for a specific column.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the deletion. The following flag can be set:
     *     
     * TAD_ALL_ROWS 
     *   
     * > Deletes all rows from the table and all corresponding views, sending a single TABLE_RELOAD notification.
     * @param {Pointer<SRowSet>} lprowsetToDelete > [in] A pointer to a row set that describes the rows to be deleted. The  _lprowsetToDelete_ parameter can be NULL if the TAD_ALL_ROWS flag is set in the _ulFlags_ parameter.
     * @param {Pointer<Integer>} cRowsDeleted > [out] The count of the deleted rows.
     * @returns {HRESULT} S_OK 
     *   
     * > The table rows were successfully deleted.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/itabledata-hrdeleterows
     */
    HrDeleteRows(ulFlags, lprowsetToDelete, cRowsDeleted) {
        cRowsDeletedMarshal := cRowsDeleted is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", ulFlags, "ptr", lprowsetToDelete, cRowsDeletedMarshal, cRowsDeleted, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
