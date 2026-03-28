#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Do not use. This interface is used for content tables of Windows Address Book (WAB) containers and distribution lists.
 * @see https://learn.microsoft.com/windows/win32/api/wabdefs/nn-wabdefs-imapitable
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMAPITable extends IUnknown{

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
    static VTableNames => ["GetLastError", "Advise", "Unadvise", "GetStatus", "SetColumns", "QueryColumns", "GetRowCount", "SeekRow", "SeekRowApprox", "QueryPosition", "FindRow", "Restrict", "CreateBookmark", "FreeBookmark", "SortTable", "QuerySortOrder", "QueryRows", "Abort", "ExpandRow", "CollapseRow", "WaitForCompletion", "GetCollapseState", "SetCollapseState"]

    /**
     * 
     * @remarks
     * The **IMAPITable::GetLastError** method returns detailed information, if available, about a prior method call that failed. This information can be displayed in a message or a dialog box.
     * @param {HRESULT} _hResult 
     * @param {Integer} ulFlags > [in] Bitmask of flags that controls the type of the returned strings. The following flag can be set:
     *     
     * MAPI_UNICODE 
     *   
     * > The strings in the **MAPIERROR** structure returned in the _lppMAPIError_ parameter are in Unicode format. If the MAPI_UNICODE flag is not set, the strings are in ANSI format.
     * @param {Pointer<Pointer<MAPIERROR>>} lppMAPIError > [out] Pointer to a pointer to the returned **MAPIERROR** structure containing version, component, and context information for the error. The  _lppMAPIError_ parameter can be set to NULL if a **MAPIERROR** structure with appropriate information cannot be provided.
     * @returns {HRESULT} S_OK 
     *   
     * > The call succeeded and has returned the expected value or values.
     *     
     * MAPI_E_BAD_CHARWIDTH 
     *   
     * > Either the MAPI_UNICODE flag was set and the implementation does not support Unicode, or MAPI_UNICODE was not set and the implementation only supports Unicode.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-getlasterror
     */
    GetLastError(_hResult, ulFlags, lppMAPIError) {
        lppMAPIErrorMarshal := lppMAPIError is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "int", _hResult, "uint", ulFlags, lppMAPIErrorMarshal, lppMAPIError, "HRESULT")
        return result
    }

    /**
     * Registers an advise sink object to receive notification of specified events affecting the table.
     * @remarks
     * Use the **IMAPITable::Advise** method to register a table object implemented in the provider for notification callbacks. Whenever a change occurs to the table object, the provider checks to see what event mask bit was set in the _ulEventMask_ parameter and thus what type of change occurred. If a bit is set, then the provider calls the [IMAPIAdviseSink::OnNotify](imapiadvisesink-onnotify.md) method for the advise sink object indicated by the  _lpAdviseSink_ parameter to report the event. Data passed in the notification structure to the **OnNotify** routine describes the event.
     *   
     * The call to **OnNotify** can occur during the call that changes the object, or at any following time. On systems that support multiple threads of execution, the call to **OnNotify** can occur on any thread. For a way to turn a call to **OnNotify** that might happen at an inopportune time into one that is safer to handle, a provider should use the [HrThisThreadAdviseSink](hrthisthreadadvisesink.md) function.
     *   
     * To provide notifications, the provider implementing **Advise** needs to keep a copy of the pointer to the  _lpAdviseSink_ advise sink object; to do so, it calls the **IUnknown::AddRef** method for the advise sink to maintain its object pointer until notification registration is canceled with a call to the [IMAPITable::Unadvise](imapitable-unadvise.md) method. The **Advise** implementation should assign a connection number to the notification registration and call **AddRef** on this connection number before returning it in the _lpulConnection_ parameter. Service providers can release the advise sink object before the registration is canceled, but they must not release the connection number until **Unadvise** has been called.
     *   
     * After a call to **Advise** has succeeded and before **Unadvise** has been called, clients must be prepared for the advise sink object to be released. A client should therefore release its advise sink object after **Advise** returns unless it has a specific long-term use for it.
     *   
     * Because of the asynchronous behavior of notification, implementations that change table column settings can receive notifications with information organized in a previous column order. For instance, a table row might be returned for a message that has just been deleted from the container. Such a notification is sent when the column setting change has been made and information about it sent but the notification table view has not been updated with that information yet.
     *   
     * For more information on the notification process, see [Event Notification in MAPI](event-notification-in-mapi.md). For specific information about table notification, see [About Table Notifications](about-table-notifications.md). For information about using the **IMAPISupport** methods to support notification, see [Supporting Event Notification](supporting-event-notification.md).
     * @param {Integer} ulEventMask > [in] Value indicating the type of event that will generate the notification. Only the following value is valid:
     * @param {IMAPIAdviseSink} lpAdviseSink > [in] Pointer to an advise sink object to receive the subsequent notifications. This advise sink object must have been already allocated.
     * @param {Pointer<Integer>} lpulConnection > [out] Pointer to a nonzero value that represents the successful notification registration.
     * @returns {HRESULT} S_OK
     *   
     * > The notification registration successfully completed.
     * 
     * MAPI_E_NO_SUPPORT
     *   
     * > The table implementation either does not support changes to its rows and columns or does not support notification.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-advise
     */
    Advise(ulEventMask, lpAdviseSink, lpulConnection) {
        lpulConnectionMarshal := lpulConnection is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", ulEventMask, "ptr", lpAdviseSink, lpulConnectionMarshal, lpulConnection, "HRESULT")
        return result
    }

    /**
     * IMAPITable Unadvise cancels the sending of notifications previously set up with a call to the IMAPITable Advise method.
     * @remarks
     * Use the **IMAPITable::Unadvise** method to release the pointer to the advise sink object passed in the _lpAdviseSink_ parameter in the previous call to **IMAPITable::Advise**, thereby canceling a notification registration. As part of discarding the pointer to the advise sink object, the object's **IUnknown::Release** method is called. Generally, **Release** is called during the **Unadvise** call, but if another thread is in the process of calling the [IMAPIAdviseSink::OnNotify](imapiadvisesink-onnotify.md) method for the advise sink, the **Release** call is delayed until the **OnNotify** method returns. 
     *   
     * For more information on the notification process, see [Event Notification in MAPI](event-notification-in-mapi.md). For specific information about table notification, see [About Table Notifications](about-table-notifications.md). For information about using the **IMAPISupport** methods to support notification, see [Supporting Event Notification](supporting-event-notification.md).
     * @param {Integer} ulConnection > [in] The number of the registration connection returned by a call to [IMAPITable::Advise](imapitable-advise.md).
     * @returns {HRESULT} S_OK 
     *   
     * > The call succeeded.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-unadvise
     */
    Unadvise(ulConnection) {
        result := ComCall(5, this, "uint", ulConnection, "HRESULT")
        return result
    }

    /**
     * Desribes the syntax, parameters, and return value of IMAPITableGetStatus, which returns the table's status and type.
     * @remarks
     * The **IMAPTable::GetStatus** method retrieves information about a table's type and current status.
     * @param {Pointer<Integer>} lpulTableStatus > [out] Pointer to a value indicating the status of the table. One of the following values can be returned:
     *     
     * TBLSTAT_COMPLETE 
     *   
     * > No operations are in progress.
     *     
     * TBLSTAT_QCHANGED 
     *   
     * > The contents of the table have expectantly changed. This status value is not returned for changes that result from sort or restriction operations.
     *     
     * TBLSTAT_RESTRICT_ERROR 
     *   
     * > An error occurred during an [IMAPITable::Restrict](imapitable-restrict.md) operation. 
     *     
     * TBLSTAT_RESTRICTING 
     *   
     * > An **IMAPITable::Restrict** operation is in progress. 
     *     
     * TBLSTAT_SETCOL_ERROR 
     *   
     * > An error occurred during an [IMAPITable::SetColumns](imapitable-setcolumns.md) operation. 
     *     
     * TBLSTAT_SETTING_COLS 
     *   
     * > An **IMAPITable::SetColumns** operation is in progress. 
     *     
     * TBLSTAT_SORT_ERROR 
     *   
     * > An error occurred during an [IMAPITable::SortTable](imapitable-sorttable.md) operation. 
     *     
     * TBLSTAT_SORTING 
     *   
     * > An **IMAPITable::SortTable** operation is in progress.
     * @param {Pointer<Integer>} lpulTableType > [out] Pointer to a value that indicates the table's type. One of the following three table types can be returned:
     *     
     * TBLTYPE_DYNAMIC 
     *   
     * > The table's contents are dynamic; the rows and column values can change as the underlying data changes.
     *     
     * TBLTYPE_KEYSET 
     *   
     * > The rows within the table are fixed, but the values of the columns within these rows are dynamic and can change as the underlying data changes.
     *     
     * TBLTYPE_SNAPSHOT 
     *   
     * > The table is static, and its contents do not change when the underlying data changes.
     * @returns {HRESULT} S_OK 
     *   
     * > The table's status was successfully returned.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-getstatus
     */
    GetStatus(lpulTableStatus, lpulTableType) {
        lpulTableStatusMarshal := lpulTableStatus is VarRef ? "uint*" : "ptr"
        lpulTableTypeMarshal := lpulTableType is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, lpulTableStatusMarshal, lpulTableStatus, lpulTableTypeMarshal, lpulTableType, "HRESULT")
        return result
    }

    /**
     * IMAPITableSetColumns defines the particular properties and order of properties to appear as columns in the table.
     * @remarks
     * The column set of a table is the group of properties that make up the columns for the rows in the table. There is a default column set for each type of table. The default column set is made up of the properties that the table implementer automatically includes. Table users can alter this default set by calling the **IMAPITable::SetColumns** method. They can request that other columns be added to the default set if the table implementer supports them that columns be removed, or that the order of columns be changed. **SetColumns** specifies the columns that are returned with each row and the order of these columns within the row. 
     *   
     * The success of the **SetColumns** operation is apparent only after a subsequent call has been made to retrieve the data of the table. It is then that any errors are reported.
     * @param {Pointer<SPropTagArray>} lpPropTagArray > [in] Pointer to an array of property tags identifying properties to be included as columns in the table. The property type portion of each tag can be set to a valid type or to **PR_NULL** to reserve space for subsequent additions. The  _lpPropTagArray_ parameter cannot be set to NULL; every table must have at least one column.
     * @param {Integer} ulFlags > [in] Bitmask of flags that controls the return of an asynchronous call to **SetColumns**, for example when **SetColumns** is used in notification. The following flags can be set: 
     *     
     * TBL_ASYNC 
     *   
     * > Requests that the column setting operation be performed asynchronously causing **SetColumns** to potentially return before the operation has fully completed. 
     *     
     * TBL_BATCH 
     *   
     * > Permits the table to postpone the column setting operation until the data is actually required.
     * @returns {HRESULT} S_OK 
     *   
     * > The column setting operation was successful.
     *     
     * MAPI_E_BUSY 
     *   
     * > Another operation is in progress that prevents the column setting operation from starting. Either the operation in progress should be allowed to complete or it should be stopped.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-setcolumns
     */
    SetColumns(lpPropTagArray, ulFlags) {
        result := ComCall(7, this, "ptr", lpPropTagArray, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * Describes the syntax, parameters, and return value of IMAPITable QueryColumns, which returns a list of columns for the table.
     * @remarks
     * The **IMAPITable::QueryColumns** method can be called to retrieve: 
     *   
     * - The default column set for a table.
     *     
     * - The current column set for a table, as established by a call to the [IMAPITable::SetColumns](imapitable-setcolumns.md) method. 
     *     
     * - The complete column set for a table, the columns that are available, but not necessarily part of the current set.
     * @param {Integer} ulFlags > [in] Bitmask of flags that indicates which column set should be returned. The following flag can be set:
     *     
     * TBL_ALL_COLUMNS 
     *   
     * > The table should return all available columns.
     * @param {Pointer<Pointer<SPropTagArray>>} lpPropTagArray > [out] Pointer to an [SPropTagArray](sproptagarray.md) structure containing the property tags for the column set.
     * @returns {HRESULT} S_OK 
     *   
     * > The column set was successfully returned.
     *     
     * MAPI_E_BUSY 
     *   
     * > Another operation is in progress that prevents the column set retrieval operation from starting. Either the operation in progress should be allowed to complete or it should be stopped.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-querycolumns
     */
    QueryColumns(ulFlags, lpPropTagArray) {
        lpPropTagArrayMarshal := lpPropTagArray is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "uint", ulFlags, lpPropTagArrayMarshal, lpPropTagArray, "HRESULT")
        return result
    }

    /**
     * Describes the syntax, parameters, and return value of IMAPITableGetRowCount, which returns the total number of rows in the table.
     * @remarks
     * The **IMAPITable::GetRowCount** method retrieves the total number of rows in a table.
     * @param {Integer} ulFlags > Reserved; must be zero.
     * @param {Pointer<Integer>} lpulCount > [out] Pointer to the number of rows in the table.
     * @returns {HRESULT} S_OK 
     *   
     * > The row count was successfully returned.
     *     
     * MAPI_E_BUSY 
     *   
     * > Another operation is in progress that prevents the row count retrieval operation from starting. Either the operation in progress should be allowed to complete or it should be stopped.
     *     
     * MAPI_E_NO_SUPPORT 
     *   
     * > The table cannot calculate the number of rows.
     *     
     * MAPI_W_APPROX_COUNT 
     *   
     * > The call succeeded, but an approximate row count was returned because the exact row count could not be determined possibly due to memory constraints. To test for this warning, use the **HR_FAILED** macro. See [Using Macros for Error Handling](using-macros-for-error-handling.md).
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-getrowcount
     */
    GetRowCount(ulFlags, lpulCount) {
        lpulCountMarshal := lpulCount is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", ulFlags, lpulCountMarshal, lpulCount, "HRESULT")
        return result
    }

    /**
     * Describes the syntax, parameters, and return value of IMAPITableSeekRow, which moves the cursor to a specific position in the table.
     * @remarks
     * The **IMAPITable::SeekRow** method establishes a new BOOKMARK_CURRENT position for the cursor. The  _lRowCount_ parameter indicates the number of rows that the cursor moves and the direction of movement.
     *   
     * If the resulting position is beyond the last row of the table, the cursor is positioned after the last row. If the resulting position is before the first row of the table, the cursor is positioned at the beginning of the first row.
     * @param {Integer} bkOrigin > [in] The bookmark identifying the starting position for the seek operation. A bookmark can be created using the [IMAPITable::CreateBookmark](imapitable-createbookmark.md) method, or one of the following predefined values can be passed.
     * 
     * BOOKMARK_BEGINNING
     *   
     * > Starts the seek operation from the beginning of the table.
     * 
     * BOOKMARK_CURRENT
     *   
     * > Starts the seek operation from the row in the table where the cursor is located.
     * 
     * BOOKMARK_END
     *   
     * > Starts the seek operation from the end of the table.
     * @param {Integer} lRowCount > [in] The signed count of the number of rows to move, starting from the bookmark identified by the  _bkOrigin_ parameter.
     * @param {Pointer<Integer>} lplRowsSought > [out] If  _lRowCount_ is a valid pointer on input, _lplRowsSought_ points to the number of rows that were processed in the seek operation, the sign of which indicates the direction of search, forward or backward. If  _lRowCount_ is negative, then  _lplRowsSought_ is negative.
     * @returns {HRESULT} S_OK
     *   
     * > The seek operation was successful.
     * 
     * MAPI_E_BUSY
     *   
     * > Another operation is in progress that prevents the row-seeking operation from starting. Either the operation in progress should be allowed to complete or it should be stopped.
     * 
     * MAPI_E_INVALID_BOOKMARK
     *   
     * > The bookmark specified in the _bkOrigin_ parameter is invalid because it was removed or because it is beyond the last row requested.
     * 
     * MAPI_W_POSITION_CHANGED
     *   
     * > The call succeeded, but the bookmark specified in the _bkOrigin_ parameter is no longer set at the same row as it was when it was last used. If the bookmark has not been used, it is no longer in the same position as it was when it was created. When this warning is returned, the call should be handled as successful. To test for this warning, use the **HR_FAILED** macro. For more information, see [Using Macros for Error Handling](using-macros-for-error-handling.md).
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-seekrow
     */
    SeekRow(bkOrigin, lRowCount, lplRowsSought) {
        lplRowsSoughtMarshal := lplRowsSought is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "uint", bkOrigin, "int", lRowCount, lplRowsSoughtMarshal, lplRowsSought, "HRESULT")
        return result
    }

    /**
     * 
     * @remarks
     * The cursor position in a table after a call to the **IMAPITable::SeekRowApprox** method is heuristically the fraction and might not be exact. For example, certain providers might implement a table on top of a binary tree, treating the table's halfway point as the top of the tree for performance reasons. If the tree is not balanced, then the halfway point used might not be exactly halfway through the table.
     * @param {Integer} ulNumerator > [in] Pointer to the numerator of the fraction representing the table position. If the  _ulNumerator_ parameter is zero, the cursor is positioned at the beginning of the table regardless of the denominator value. If  _ulNumerator_ is equal to the  _ulDenominator_ parameter, the cursor is positioned after the last table row.
     * @param {Integer} ulDenominator > [in] Pointer to the denominator of the fraction representing the table position. The  _ulDenominator_ parameter cannot be zero.
     * @returns {HRESULT} S_OK 
     *   
     * > The seek operation was successful.
     *     
     * MAPI_E_BUSY 
     *   
     * > Another operation is in progress that prevents the row seeking operation from starting. Either the operation in progress should be allowed to complete or it should be stopped.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-seekrowapprox
     */
    SeekRowApprox(ulNumerator, ulDenominator) {
        result := ComCall(11, this, "uint", ulNumerator, "uint", ulDenominator, "HRESULT")
        return result
    }

    /**
     * 
     * @remarks
     * The **IMAPITable::QueryPosition** method determines the current row position and returns both the number of the current row and a fractional value indicating its relative position to the end of the table. MAPI defines the current row as the next row to be read.
     * @param {Pointer<Integer>} lpulRow > [out] Pointer to the number of the current row. The row number is zero-based; the first row in the table is zero.
     * @param {Pointer<Integer>} lpulNumerator > [out] Pointer to the numerator for the fraction identifying the table position.
     * @param {Pointer<Integer>} lpulDenominator > [out] Pointer to the denominator for the fraction identifying the table position. The _lpulDenominator_ parameter cannot be zero.
     * @returns {HRESULT} S_OK
     * 
     * > The method returned valid values in _lpulRow_, _lpulNumerator_, and _lpulDenominator_.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-queryposition
     */
    QueryPosition(lpulRow, lpulNumerator, lpulDenominator) {
        lpulRowMarshal := lpulRow is VarRef ? "uint*" : "ptr"
        lpulNumeratorMarshal := lpulNumerator is VarRef ? "uint*" : "ptr"
        lpulDenominatorMarshal := lpulDenominator is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, lpulRowMarshal, lpulRow, lpulNumeratorMarshal, lpulNumerator, lpulDenominatorMarshal, lpulDenominator, "HRESULT")
        return result
    }

    /**
     * IMAPITableFindRow finds the next row in a table that matches specific search criteria and moves the cursor to that row.
     * @remarks
     * The **IMAPITable::FindRow** method locates the first row in the table to match a set of search criteria described in the **SRestriction** structure pointed to by the  _lpRestriction_ parameter. 
     *   
     * Usually, **FindRow** searches forward from the specified bookmark. The caller can set the search to move backward from the bookmark by setting the DIR_BACKWARD flag in the _ulFlags_ parameter. Searching forward starts from the current bookmark; searching backward starts from the row prior to the bookmark. The end position of the search is just before the first row found that satisfied the restriction. 
     *   
     * If the row pointed to by the bookmark in the _BkOrigin_ parameter no longer exists in the table and the table cannot establish a new position for the bookmark, **FindRow** returns MAPI_E_INVALID_BOOKMARK. If the row pointed to by  _BkOrigin_ no longer exists and the table is able to establish a new position for the bookmark, **FindRow** returns MAPI_W_POSITION_CHANGED. 
     *   
     * If the bookmark passed in  _BkOrigin_ is either BOOKMARK_BEGINNING or BOOKMARK_END, **FindRow** returns MAPI_E_NOT_FOUND if no matching row is found. If the bookmark used in  _BkOrigin_ is BOOKMARK_CURRENT, **FindRow** can return MAPI_W_POSITION_CHANGED but not MAPI_E_INVALID_BOOKMARK because there is always a current cursor position. 
     *   
     * The **PR_INSTANCE_KEY** ([PidTagInstanceKey](pidtaginstancekey-canonical-property.md)) property column is required for all tables, and all implementations of **FindRow** are required to support calls seeking a row based on PR_INSTANCE_KEY.
     * @param {Pointer<SRestriction>} lpRestriction > [in] A pointer to an [SRestriction](srestriction.md) structure that describes the search criteria.
     * @param {Integer} bkOrigin 
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the direction of the search. The following flag can be set:
     *     
     * DIR_BACKWARD 
     *   
     * > Searches backward from the row identified by the bookmark.
     * @returns {HRESULT} S_OK 
     *   
     * > The find operation was successful.
     *     
     * MAPI_E_INVALID_BOOKMARK 
     *   
     * > The bookmark in the _BkOrigin_ parameter is invalid because it has been removed or because it is beyond the last row requested. 
     *     
     * MAPI_E_NOT_FOUND 
     *   
     * > No rows were found that matched the restriction.
     *     
     * MAPI_W_POSITION_CHANGED
     *   
     * > The call succeeded, but the bookmark used in the operation is no longer set at the same row as when it was last used; if the bookmark has not been used, it is no longer in the same position as when it was created. When this warning is returned, the call should be handled as successful. To test for this warning, use the **HR_FAILED** macro. See [Using Macros for Error Handling](using-macros-for-error-handling.md).
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-findrow
     */
    FindRow(lpRestriction, bkOrigin, ulFlags) {
        result := ComCall(13, this, "ptr", lpRestriction, "uint", bkOrigin, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * IMAPITableRestrict applies a filter to a table, reducing the row set to only those rows matching the specified criteria.
     * @remarks
     * The **IMAPITable::Restrict** method establishes a restriction, or filter, on a table. If there is a previous restriction, it is discarded and the new one applied. Applying a restriction has no affect on the underlying data of a table; it simply alters the view by limiting the rows that can be retrieved to rows containing data that satisfy the restriction. 
     *   
     * There are several different types of restrictions, each described with a different structure. The [SRestriction](srestriction.md) structure contains two members: a value that indicates the type of restriction and the specific structure applicable for that type. 
     *   
     * Notifications for table rows that are hidden from view by calls to **Restrict** are never generated. 
     *   
     * A property restriction on a multivalued property works like a restriction on a single-valued property. A multivalued property to be used in a property restriction must have the MVI_FLAG flag set. If it doesn't have this flag set, it is treated as a totally ordered tuple. A comparison of two multivalued columns compares the column elements in order, reporting the relation of the columns at the first inequality. Equality is returned only if the columns compared contain the same values in the same order. If one column has fewer values than the other, the reported relation is that of a null value to the other value.
     *   
     * For more information about restrictions, see [About Restrictions](about-restrictions.md).
     *   
     * > [!NOTE]
     * > If you create dynamic queries to search for data on the server, use the **FindRow** method instead of using the **Restrict** method and the **QueryRows** method together. The **Restrict** method creates a cached view that is used to evaluate all messages added to or modified in the base folder. If a client application uses the **Restrict** method for each dynamic query, a cached view will be created for each query.
     * @param {Pointer<SRestriction>} lpRestriction > [in] Pointer to an [SRestriction](srestriction.md) structure defining the conditions of the filter. Passing NULL in the _lpRestriction_ parameter removes the current filter.
     * @param {Integer} ulFlags > [in] Bitmask of flags that controls the timing of the restriction operation. The following flags can be set:
     *     
     * TBL_ASYNC 
     *   
     * > Starts the operation asynchronously and returns before the operation completes.
     *     
     * TBL_BATCH 
     *   
     * > Defers evaluation of the filter until the data in the table is required.
     * @returns {HRESULT} S_OK 
     *   
     * > The filter was successfully applied.
     *     
     * MAPI_E_BUSY 
     *   
     * > Another operation is in progress that prevents the restriction operation from starting. Either the operation in progress should be allowed to complete or it should be stopped.
     *     
     * MAPI_E_TOO_COMPLEX 
     *   
     * > The table cannot perform the operation because the particular filter pointed to by the  _lpRestriction_ parameter is too complicated.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-restrict
     */
    Restrict(lpRestriction, ulFlags) {
        result := ComCall(14, this, "ptr", lpRestriction, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @remarks
     * The **IMAPITable::CreateBookmark** method marks a table position by creating a value called a bookmark. A bookmark can be used to return to the position identified by the bookmark. The bookmarked position is associated with the object at that row in the table. 
     *   
     * Bookmarks are not supported on attachment tables, and attachment table implementations of **CreateBookmark** return MAPI_E_NO_SUPPORT.
     * @param {Pointer<Integer>} lpbkPosition > [out] Pointer to the returned 32-bit bookmark value. This bookmark can later be passed in a call to the [IMAPITable::SeekRow](imapitable-seekrow.md) method.
     * @returns {HRESULT} S_OK 
     *   
     * > The call succeeded and has returned the expected value or values.
     *     
     * MAPI_E_UNABLE_TO_COMPLETE 
     *   
     * > The requested operation could not be completed.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-createbookmark
     */
    CreateBookmark(lpbkPosition) {
        lpbkPositionMarshal := lpbkPosition is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, lpbkPositionMarshal, lpbkPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @remarks
     * The **IMAPITable::FreeBookmark** method releases a bookmark that is no longer needed. The bookmark is no longer valid after this call. Whenever a table is released from memory, all of its associated bookmarks are also released.
     * @param {Integer} bkPosition > [in] The bookmark to be freed, created by calling the [IMAPITable::CreateBookmark](imapitable-createbookmark.md) method.
     * @returns {HRESULT} S_OK 
     *   
     * > The bookmark was successfully freed.
     *     
     * MAPI_E_INVALID_BOOKMARK 
     *   
     * > The specified bookmark does not exist.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-freebookmark
     */
    FreeBookmark(bkPosition) {
        result := ComCall(16, this, "uint", bkPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @remarks
     * The **IMAPITable::SortTable** method orders the rows in a table view. Whereas some tables support both standard and categorized sorting on various sort key columns, other tables are more limited in their support. Address book providers ordinarily do not support table sorting. Message store providers usually support sorting to the extent that they keep the sort order of folders that results when a full table (a table without restrictions) is sorted. 
     *   
     * Some tables allow sorting to be done on any table column. Other tables do not; columns not included in the table view are unaffected by a **SortTable** call. Some tables require that sort keys be built only with columns in the table's current column set. 
     *   
     * A table can return either MAPI_E_NO_SUPPORT or MAPI_E_TOO_COMPLEX from **SortTable** when it cannot complete a sort operation. Moreover, store providers are not guaranteed to honor the sort order set specified for hierarchy tables. 
     *   
     * When there are zero columns in the [SSortOrderSet](ssortorderset.md) structure pointed to by the  _lpSortCriteria_ parameter, the table returns the current column set. The current sort order can be retrieved by calling the table's [IMAPITable::QuerySortOrder](imapitable-querysortorder.md) method. 
     *   
     * All bookmarks for a table are invalidated and should be deleted when a call to **SortTable** is made, and the BOOKMARK_CURRENT bookmark that indicates the current cursor position, should be set to the beginning of the table. 
     *   
     * If you are sorting on a column that contains a multivalued property without the MVI_FLAG flag set, the column's values are treated as a completely ordered tuple. A comparison of two multivalued columns compares the column elements in order, reporting the relation of the columns at the first inequality, and returns equality only if the columns being compared contain the same values in the same order. If one column has fewer values than the other, the reported relation is that of a null value to the other value.
     * @param {Pointer<SSortOrderSet>} lpSortCriteria > [in] Pointer to an [SSortOrderSet](ssortorderset.md) structure that contains the sort criteria to apply. Passing an **SSortOrderSet** structure that contains zero columns indicates that the table does not have to be sorted in any particular order.
     * @param {Integer} ulFlags > [in] Bitmask of flags that controls the timing of the **IMAPITable::SortTable** operation. The following flags can be set: 
     *     
     * TBL_ASYNC 
     *   
     * > Starts the operation asynchronously and returns before the operation is complete.
     *     
     * TBL_BATCH 
     *   
     * > Defers the completion of the sort until the data in the table is required.
     * @returns {HRESULT} S_OK 
     *   
     * > The sort operation was successful.
     *     
     * MAPI_E_BUSY 
     *   
     * > Another operation is in progress that prevents the sort operation from starting. Either the operation in progress should be allowed to complete or it should be stopped.
     *     
     * MAPI_E_NO_SUPPORT 
     *   
     * > The table does not support the type of sorting requested.
     *     
     * MAPI_E_TOO_COMPLEX 
     *   
     * > The table cannot perform the operation because the particular sort criteria pointed to by the  _lpSortCriteria_ parameter is too complex. **SortTable** can return MAPI_E_TOO_COMPLEX under the following conditions. 
     *     
     *    - A sort operation is requested for a property column that the implementation cannot sort.
     *     
     *    - The implementation does not support the sort order requested in the **ulOrder** member of the **SSortOrderSet** structure. 
     *     
     *    - The number of columns to be sorted, as specified in the **cSorts** member in **SSortOrderSet**, is larger than the implementation can handle.
     *     
     *    - A sort operation is requested, as indicated by a property tag in **SSortOrderSet**, based on a property that is not in the available or active set and the implementation does not support sorting on properties not in the available set.
     *     
     *    - One property is specified multiple times in a sort order set, as indicated by multiple instances of the same property tag, and the implementation cannot perform such a sort operation.
     *     
     *    - A sort operation based on multivalued property columns is requested using MVI_FLAG and the implementation does not support sorting on multivalued properties. 
     *     
     *    - A property tag for a property in **SSortOrderSet** specifies a property or type that the implementation does not support. 
     *     
     *    - A sort operation other than one that proceeds through the table from the **PR_RENDERING_POSITION** ([PidTagRenderingPosition](pidtagrenderingposition-canonical-property.md)) property forward is specified only for an attachment table that supports this type of sorting.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-sorttable
     */
    SortTable(lpSortCriteria, ulFlags) {
        result := ComCall(17, this, "ptr", lpSortCriteria, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @remarks
     * The **IMAPITable::QuerySortOrder** method retrieves the current sort order for a table. Sort orders are described with an [SSortOrderSet](ssortorderset.md) structure. 
     *   
     * - The **cSorts** member of the **SSortOrderSet** structure can be set to zero if: 
     *     
     * - The table is unsorted.
     *     
     * - There is no information about how the table is sorted.
     *     
     * - The **SSortOrderSet** structure is not appropriate for describing the sort order.
     * @param {Pointer<Pointer<SSortOrderSet>>} lppSortCriteria > [out] Pointer to a pointer to the [SSortOrderSet](ssortorderset.md) structure holding the current sort order.
     * @returns {HRESULT} S_OK 
     *   
     * > The current sort order was successfully returned.
     *     
     * MAPI_E_BUSY 
     *   
     * > Another operation is in progress that prevents the sort order retrieval operation from starting. Either the operation in progress should be allowed to complete or it should be stopped.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-querysortorder
     */
    QuerySortOrder(lppSortCriteria) {
        lppSortCriteriaMarshal := lppSortCriteria is VarRef ? "ptr*" : "ptr"

        result := ComCall(18, this, lppSortCriteriaMarshal, lppSortCriteria, "HRESULT")
        return result
    }

    /**
     * IMAPITableQueryRows returns one or more rows from a table, beginning at the current cursor position.
     * @remarks
     * The **IMAPITable::QueryRows** method gets one or more rows of data from a table. The value of the  _IRowCount_ parameter affects the starting point for the retrieval. If  _IRowCount_ is positive, rows are read in a forward direction, starting at the current position. If  _IRowCount_ is negative, **QueryRows** resets the starting point by moving backward the indicated number of rows. After the cursor is reset, rows are read in forward order. 
     *   
     * The **cRows** member in the [SRowSet](srowset.md) structure pointed to by the  _lppRows_ parameter indicates the number of rows returned. If zero rows are returned: 
     *   
     * - The cursor was already positioned at the beginning of the table and the value of  _IRowCount_ is negative. -Or- 
     *     
     * - The cursor was already positioned at the end of the table and the value of  _IRowCount_ is positive. 
     *     
     * The number of columns and their ordering is the same for each row. If a property does not exist for a row or there is an error reading a property, the **SPropValue** structure for the property in the row contains the following values: 
     *   
     * - PT_ERROR for the property type in the **ulPropTag** member. 
     *     
     * - MAPI_E_NOT_FOUND for the **Value** member. 
     *     
     * Memory used for the [SPropValue](spropvalue.md) structures in the row set pointed to by the  _lppRows_ parameter must be separately allocated and freed for each row. Use [MAPIFreeBuffer](mapifreebuffer.md) to free the property value structures and to free the row set. When a call to **QueryRows** returns zero, however, indicating the beginning or end of the table, only the **SRowSet** structure itself needs to be freed. For more information about how to allocate and free memory in an **SRowSet** structure, see [Managing Memory for ADRLIST and SRowSet Structures](managing-memory-for-adrlist-and-srowset-structures.md).
     *   
     * The rows that are returned and the order in which they are returned depend on whether or not successful calls have been made to [IMAPITable::Restrict](imapitable-restrict.md) and [IMAPITable::SortTable](imapitable-sorttable.md). **Restrict** filters rows from the view, causing **QueryRows** to return only the rows that match the criteria specified in the restriction. **SortTable** establishes a standard or categorized sort order, affecting the sequence of rows returned by **QueryRows**. The returned rows are in the order specified in the [SSortOrderSet](ssortorderset.md) structure passed to **SortTable**.
     *   
     * The columns returned for each row and the order in which they are returned depend on whether or not a successful call has been made to [IMAPITable::SetColumns](imapitable-setcolumns.md). **SetColumns** establishes a column set, specifying the properties to be included in columns in the table and the order in which they should be included. If a **SetColumns** call has been made, the particular columns in each row and the order of those columns match the column set specified in the call. If no **SetColumns** call has been made, the table returns its default column set. 
     *   
     * If none of these calls has been made, **QueryRows** returns all of the rows in the table. Each row contains the default column set in default order. 
     *   
     * When the column set established in a call to [IMAPITable::SetColumns](imapitable-setcolumns.md) includes columns set to PR_NULL, the [SPropValue](spropvalue.md) array within the row set returned in  _lppRows_ will contain empty slots.
     * @param {Integer} lRowCount > [in] Maximum number of rows to be returned.
     * @param {Integer} ulFlags > [in] Bitmask of flags that control how rows are returned. The following flag can be set:
     *     
     * TBL_NOADVANCE 
     *   
     * > Prevents the cursor from advancing as a result of the row retrieval. If the TBL_NOADVANCE flag is set, the cursor points to the first row returned. If the TBL_NOADVANCE flag is not set, the cursor points to the row following the last row returned.
     * @param {Pointer<Pointer<SRowSet>>} lppRows > [out] Pointer to a pointer to an [SRowSet](srowset.md) structure holding the table rows.
     * @returns {HRESULT} S_OK 
     *   
     * > The rows were successfully returned.
     *     
     * MAPI_E_BUSY 
     *   
     * > Another operation is in progress that prevents the row retrieval operation from starting. Either the operation in progress should be allowed to complete or it should be stopped.
     *     
     * MAPI_E_INVALID_PARAMETER 
     *   
     * > The  _IRowCount_ parameter is set to zero.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-queryrows
     */
    QueryRows(lRowCount, ulFlags, lppRows) {
        lppRowsMarshal := lppRows is VarRef ? "ptr*" : "ptr"

        result := ComCall(19, this, "int", lRowCount, "uint", ulFlags, lppRowsMarshal, lppRows, "HRESULT")
        return result
    }

    /**
     * 
     * @remarks
     * The **IMAPITable::Abort** method stops any asynchronous operation that is currently in progress.
     * @returns {HRESULT} None
     *   
     * 
     * S_OK 
     *   
     * > One or more asynchronous operations have been stopped.
     *     
     * MAPI_E_UNABLE_TO_ABORT 
     *   
     * > An asynchronous operation is in progress and cannot be stopped or it has already completed.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-abort
     */
    Abort() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * IMAPITableExpandRow expands a collapsed table category, adding the leaf or lower-level heading rows belonging to the category to the table view.
     * @remarks
     * The **IMAPITable::ExpandRow** method expands a collapsed table category, adding the leaf or lower-level heading rows that belong to the category to the table view. A limit to the number of rows to be returned in the _lppRows_ parameter can be specified in the _ulRowCount_ parameter. When  _ulRowCount_ is set to a value greater than zero and one or more rows are returned in the row set pointed to by  _lppRows_, the position of the bookmark BOOKMARK_CURRENT is moved to the row immediately following the last row in the row set.
     *   
     * When  _ulRowCount_ is set to zero, requesting that zero leaf or lower-level heading rows be added to the category, or zero rows are returned because there are no leaf or lower-level heading rows in the category, the position of BOOKMARK_CURRENT is set to the row following the row identified by  _pbInstanceKey_.
     * @param {Integer} cbInstanceKey > [in] The count of bytes in the PR_INSTANCE_KEY property pointed to by the  _pbInstanceKey_ parameter.
     * @param {Pointer<Integer>} pbInstanceKey > [in] A pointer to the **PR_INSTANCE_KEY** ([PidTagInstanceKey](pidtaginstancekey-canonical-property.md)) property that identifies the heading row for the category.
     * @param {Integer} ulRowCount > [in] The maximum number of rows to return in the _lppRows_ parameter.
     * @param {Integer} ulFlags > Reserved; must be zero.
     * @param {Pointer<Pointer<SRowSet>>} lppRows > [out] A pointer to an [SRowSet](srowset.md) structure receiving the first (up to  _ulRowCount_) rows that have been inserted into the table view as a result of the expansion. These rows are inserted after the heading row identified by the  _pbInstanceKey_ parameter. The  _lppRows_ parameter can be NULL if the _ulRowCount_ parameter is zero.
     * @param {Pointer<Integer>} lpulMoreRows > [out] A pointer to the total number of rows that were added to the table view.
     * @returns {HRESULT} S_OK 
     *   
     * > The category was expanded successfully.
     *     
     * MAPI_E_NOT_FOUND 
     *   
     * > The row identified by the  _pbInstanceKey_ parameter does not exist.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-expandrow
     */
    ExpandRow(cbInstanceKey, pbInstanceKey, ulRowCount, ulFlags, lppRows, lpulMoreRows) {
        pbInstanceKeyMarshal := pbInstanceKey is VarRef ? "char*" : "ptr"
        lppRowsMarshal := lppRows is VarRef ? "ptr*" : "ptr"
        lpulMoreRowsMarshal := lpulMoreRows is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "uint", cbInstanceKey, pbInstanceKeyMarshal, pbInstanceKey, "uint", ulRowCount, "uint", ulFlags, lppRowsMarshal, lppRows, lpulMoreRowsMarshal, lpulMoreRows, "HRESULT")
        return result
    }

    /**
     * IMAPITableCollapseRow collapses an expanded table category, removing any lower-level headings and leaf rows belonging to the category from the table view.
     * @remarks
     * The **IMAPITable::CollapseRow** method collapses a table category and removes it from the table view. The rows are collapsed starting at the row identified by the **PR_INSTANCE_KEY** property pointed to by the  _pbInstanceKey_ parameter. The number of rows that are removed from the view is returned in the contents of the  _lpulRowCount_ parameter. 
     *   
     * Notifications are never generated for table rows that are removed from a view as the result of a collapse operation. 
     *   
     * When a row that is defined by a bookmark is collapsed out of view, the bookmark is moved to point to the next visible row. 
     *   
     * For more information about categorized tables, see [Sorting and Categorization](sorting-and-categorization.md).
     * @param {Integer} cbInstanceKey > [in] The count of bytes in the PR_INSTANCE_KEY property pointed to by the  _pbInstanceKey_ parameter.
     * @param {Pointer<Integer>} pbInstanceKey > [in] A pointer to the **PR_INSTANCE_KEY** ([PidTagInstanceKey](pidtaginstancekey-canonical-property.md)) property that identifies the heading row for the category.
     * @param {Integer} ulFlags > Reserved; must be zero.
     * @param {Pointer<Integer>} lpulRowCount > [out] A pointer to the total number of rows that are being removed from the table view.
     * @returns {HRESULT} S_OK 
     *   
     * > The collapse operation has succeeded.
     *     
     * MAPI_E_NOT_FOUND 
     *   
     * > The row identified by the  _pbInstanceKey_ parameter does not exist. 
     *     
     * MAPI_E_INVALID_ENTRYID 
     *   
     * > The row identified by the  _pbInstanceKey_ parameter does not exist. This error is an alternative to MAPI_E_NOT_FOUND; service providers can return either one.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-collapserow
     */
    CollapseRow(cbInstanceKey, pbInstanceKey, ulFlags, lpulRowCount) {
        pbInstanceKeyMarshal := pbInstanceKey is VarRef ? "char*" : "ptr"
        lpulRowCountMarshal := lpulRowCount is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, "uint", cbInstanceKey, pbInstanceKeyMarshal, pbInstanceKey, "uint", ulFlags, lpulRowCountMarshal, lpulRowCount, "HRESULT")
        return result
    }

    /**
     * 
     * @remarks
     * The **IMAPITable::WaitForCompletion** method suspends processing until any asynchronous operations currently under way for the table have completed. **WaitForCompletion** can allow the asynchronous operations either to fully complete or to run for a certain number of milliseconds, as indicated by  _ulTimeout_, before being interrupted. To detect asynchronous operations in progress, call the [IMAPITable::GetStatus](imapitable-getstatus.md) method.
     * @param {Integer} ulFlags > Reserved; must be zero.
     * @param {Integer} ulTimeout > [in] Maximum number of milliseconds to wait for the asynchronous operation or operations to complete. To wait indefinitely until completion occurs, set  _ulTimeout_ to 0xFFFFFFFF.
     * @param {Pointer<Integer>} lpulTableStatus > [in, out] On input, either a valid pointer or NULL. On output, if  _lpulTableStatus_ is a valid pointer, it points to the most recent status of the table. If  _lpulTableStatus_ is NULL, no status information is returned. If **WaitForCompletion** returns an unsuccessful HRESULT value, the contents of  _lpulTableStatus_ are undefined.
     * @returns {HRESULT} S_OK 
     *   
     * > The wait operation was successful.
     *     
     * MAPI_E_NO_SUPPORT 
     *   
     * > The table does not support waiting for the completion of asynchronous operations.
     *     
     * MAPI_E_TIMEOUT 
     *   
     * > The asynchronous operation or operations did not complete in the specified time.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-waitforcompletion
     */
    WaitForCompletion(ulFlags, ulTimeout, lpulTableStatus) {
        lpulTableStatusMarshal := lpulTableStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, "uint", ulFlags, "uint", ulTimeout, lpulTableStatusMarshal, lpulTableStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @remarks
     * The **IMAPITable::GetCollapseState** method works with the [IMAPITable::SetCollapseState](imapitable-setcollapsestate.md) method to change the user's view of a categorized table. **GetCollapseState** saves the data that is needed for **SetCollapseState** to use to rebuild the appropriate views of the categories of a categorized table. Service providers determine the data to be saved. However, most service providers implementing **GetCollapseState** save the following: 
     *   
     * - The sort keys (standard columns and category columns).
     *     
     * - Information about the row that the instance key represents.
     *     
     * - Information to restore the collapsed and expanded categories of the table.
     *     
     * For more information about categorized tables, see [Sorting and Categorization](sorting-and-categorization.md).
     * @param {Integer} ulFlags > Reserved; must be zero.
     * @param {Integer} cbInstanceKey > [in] The count of bytes in the instance key pointed to by the  _lpbInstanceKey_ parameter.
     * @param {Pointer<Integer>} lpbInstanceKey > [in] A pointer to the **PR_INSTANCE_KEY** ([PidTagInstanceKey](pidtaginstancekey-canonical-property.md)) property of the row at which the current collapsed or expanded state should be rebuilt. The  _lpbInstanceKey_ parameter cannot be NULL.
     * @param {Pointer<Integer>} lpcbCollapseState > [out] A pointer to the count of structures pointed to by the  _lppbCollapseState_ parameter.
     * @param {Pointer<Pointer<Integer>>} lppbCollapseState > [out] A pointer to a pointer to structures that contain data that describes the current table view.
     * @returns {HRESULT} S_OK 
     *   
     * > The state for the categorized table was successfully saved.
     *     
     * MAPI_E_BUSY 
     *   
     * > Another operation is in progress that prevents the operation from starting. Either the operation in progress should be allowed to complete or it should be stopped.
     *     
     * MAPI_E_NO_SUPPORT 
     *   
     * > The table does not support categorization and expanded and collapsed views.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-getcollapsestate
     */
    GetCollapseState(ulFlags, cbInstanceKey, lpbInstanceKey, lpcbCollapseState, lppbCollapseState) {
        lpbInstanceKeyMarshal := lpbInstanceKey is VarRef ? "char*" : "ptr"
        lpcbCollapseStateMarshal := lpcbCollapseState is VarRef ? "uint*" : "ptr"
        lppbCollapseStateMarshal := lppbCollapseState is VarRef ? "ptr*" : "ptr"

        result := ComCall(24, this, "uint", ulFlags, "uint", cbInstanceKey, lpbInstanceKeyMarshal, lpbInstanceKey, lpcbCollapseStateMarshal, lpcbCollapseState, lppbCollapseStateMarshal, lppbCollapseState, "HRESULT")
        return result
    }

    /**
     * 
     * @remarks
     * The **IMAPITable::SetCollapseState** method reestablishes the expanded or collapsed state of the table view. **SetCollapseState** and **GetCollapseState** work together as follows: 
     *   
     * 1. When the state of a categorized table is about to change, [IMAPITable::GetCollapseState](imapitable-getcollapsestate.md) is called to save all of the data pertaining to the state prior to the change. 
     *     
     * 2. To restore the view of the table to its saved state, **SetCollapseState** is called. The data saved by **GetCollapseState** is passed to **SetCollapseState**. **SetCollapseState** is able to use that data to restore the state. 
     *     
     * 3. **SetCollapseState** returns as an output parameter a bookmark that identifies the same row as the instance key passed as input to **GetCollapseState**.
     *     
     * For more information about categorized tables, see [Sorting and Categorization](sorting-and-categorization.md).
     * @param {Integer} ulFlags > Reserved; must be zero.
     * @param {Integer} cbCollapseState > [in] Count of bytes in the structure pointed to by the  _pbCollapseState_ parameter.
     * @param {Pointer<Integer>} pbCollapseState > [in] Pointer to the structures containing the data needed to rebuild the table view.
     * @param {Pointer<Integer>} lpbkLocation > [out] Pointer to a bookmark identifying the row in the table at which the collapsed or expanded state should be rebuilt. This bookmark and the instance key passed in the _lpbInstanceKey_ parameter in the call to [IMAPITable::GetCollapseState](imapitable-getcollapsestate.md) identify the same row.
     * @returns {HRESULT} S_OK 
     *   
     * > The state of the categorized table was successfully rebuilt.
     *     
     * MAPI_E_BUSY 
     *   
     * > Another operation is in progress that prevents the operation from starting. Either the operation in progress should be allowed to complete or it should be stopped.
     *     
     * MAPI_E_UNABLE_TO_COMPLETE 
     *   
     * > The table could not finish rebuilding the collapsed or expanded view.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-setcollapsestate
     */
    SetCollapseState(ulFlags, cbCollapseState, pbCollapseState, lpbkLocation) {
        pbCollapseStateMarshal := pbCollapseState is VarRef ? "char*" : "ptr"
        lpbkLocationMarshal := lpbkLocation is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, "uint", ulFlags, "uint", cbCollapseState, pbCollapseStateMarshal, pbCollapseState, lpbkLocationMarshal, lpbkLocation, "HRESULT")
        return result
    }
}
