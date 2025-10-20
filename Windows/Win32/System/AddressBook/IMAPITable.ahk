#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Do not use. This interface is used for content tables of Windows Address Book (WAB) containers and distribution lists.
 * @see https://docs.microsoft.com/windows/win32/api//wabdefs/nn-wabdefs-imapitable
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
     * Retrieves the calling thread's last-error code value.
     * @param {HRESULT} hResult 
     * @param {Integer} ulFlags 
     * @param {Pointer<Pointer<MAPIERROR>>} lppMAPIError 
     * @returns {HRESULT} The return value is the calling thread's last-error code.
     * 
     * The Return Value section of the documentation for each function that sets the last-error code notes the conditions under which the function sets the last-error code. Most functions that set the thread's last-error code set it when they fail. However, some functions also set the last-error code when they succeed. If the function is not documented to set the last-error code, the value returned by this function is simply the most recent last-error code to have been set; some functions set the last-error code to 0 on success and others do not.
     * @see https://docs.microsoft.com/windows/win32/api//errhandlingapi/nf-errhandlingapi-getlasterror
     */
    GetLastError(hResult, ulFlags, lppMAPIError) {
        result := ComCall(3, this, "int", hResult, "uint", ulFlags, "ptr*", lppMAPIError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulEventMask 
     * @param {IMAPIAdviseSink} lpAdviseSink 
     * @param {Pointer<Integer>} lpulConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-advise
     */
    Advise(ulEventMask, lpAdviseSink, lpulConnection) {
        result := ComCall(4, this, "uint", ulEventMask, "ptr", lpAdviseSink, "uint*", lpulConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-unadvise
     */
    Unadvise(ulConnection) {
        result := ComCall(5, this, "uint", ulConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpulTableStatus 
     * @param {Pointer<Integer>} lpulTableType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-getstatus
     */
    GetStatus(lpulTableStatus, lpulTableType) {
        result := ComCall(6, this, "uint*", lpulTableStatus, "uint*", lpulTableType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPropTagArray>} lpPropTagArray 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-setcolumns
     */
    SetColumns(lpPropTagArray, ulFlags) {
        result := ComCall(7, this, "ptr", lpPropTagArray, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<Pointer<SPropTagArray>>} lpPropTagArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-querycolumns
     */
    QueryColumns(ulFlags, lpPropTagArray) {
        result := ComCall(8, this, "uint", ulFlags, "ptr*", lpPropTagArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpulCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-getrowcount
     */
    GetRowCount(ulFlags, lpulCount) {
        result := ComCall(9, this, "uint", ulFlags, "uint*", lpulCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bkOrigin 
     * @param {Integer} lRowCount 
     * @param {Pointer<Integer>} lplRowsSought 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-seekrow
     */
    SeekRow(bkOrigin, lRowCount, lplRowsSought) {
        result := ComCall(10, this, "uint", bkOrigin, "int", lRowCount, "int*", lplRowsSought, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulNumerator 
     * @param {Integer} ulDenominator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-seekrowapprox
     */
    SeekRowApprox(ulNumerator, ulDenominator) {
        result := ComCall(11, this, "uint", ulNumerator, "uint", ulDenominator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpulRow 
     * @param {Pointer<Integer>} lpulNumerator 
     * @param {Pointer<Integer>} lpulDenominator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-queryposition
     */
    QueryPosition(lpulRow, lpulNumerator, lpulDenominator) {
        result := ComCall(12, this, "uint*", lpulRow, "uint*", lpulNumerator, "uint*", lpulDenominator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SRestriction>} lpRestriction 
     * @param {Integer} bkOrigin 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-findrow
     */
    FindRow(lpRestriction, bkOrigin, ulFlags) {
        result := ComCall(13, this, "ptr", lpRestriction, "uint", bkOrigin, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SRestriction>} lpRestriction 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-restrict
     */
    Restrict(lpRestriction, ulFlags) {
        result := ComCall(14, this, "ptr", lpRestriction, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpbkPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-createbookmark
     */
    CreateBookmark(lpbkPosition) {
        result := ComCall(15, this, "uint*", lpbkPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bkPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-freebookmark
     */
    FreeBookmark(bkPosition) {
        result := ComCall(16, this, "uint", bkPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SSortOrderSet>} lpSortCriteria 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-sorttable
     */
    SortTable(lpSortCriteria, ulFlags) {
        result := ComCall(17, this, "ptr", lpSortCriteria, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SSortOrderSet>>} lppSortCriteria 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-querysortorder
     */
    QuerySortOrder(lppSortCriteria) {
        result := ComCall(18, this, "ptr*", lppSortCriteria, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lRowCount 
     * @param {Integer} ulFlags 
     * @param {Pointer<Pointer<SRowSet>>} lppRows 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-queryrows
     */
    QueryRows(lRowCount, ulFlags, lppRows) {
        result := ComCall(19, this, "int", lRowCount, "uint", ulFlags, "ptr*", lppRows, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-abort
     */
    Abort() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbInstanceKey 
     * @param {Pointer<Integer>} pbInstanceKey 
     * @param {Integer} ulRowCount 
     * @param {Integer} ulFlags 
     * @param {Pointer<Pointer<SRowSet>>} lppRows 
     * @param {Pointer<Integer>} lpulMoreRows 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-expandrow
     */
    ExpandRow(cbInstanceKey, pbInstanceKey, ulRowCount, ulFlags, lppRows, lpulMoreRows) {
        result := ComCall(21, this, "uint", cbInstanceKey, "char*", pbInstanceKey, "uint", ulRowCount, "uint", ulFlags, "ptr*", lppRows, "uint*", lpulMoreRows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbInstanceKey 
     * @param {Pointer<Integer>} pbInstanceKey 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpulRowCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-collapserow
     */
    CollapseRow(cbInstanceKey, pbInstanceKey, ulFlags, lpulRowCount) {
        result := ComCall(22, this, "uint", cbInstanceKey, "char*", pbInstanceKey, "uint", ulFlags, "uint*", lpulRowCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Integer} ulTimeout 
     * @param {Pointer<Integer>} lpulTableStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-waitforcompletion
     */
    WaitForCompletion(ulFlags, ulTimeout, lpulTableStatus) {
        result := ComCall(23, this, "uint", ulFlags, "uint", ulTimeout, "uint*", lpulTableStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Integer} cbInstanceKey 
     * @param {Pointer<Integer>} lpbInstanceKey 
     * @param {Pointer<Integer>} lpcbCollapseState 
     * @param {Pointer<Pointer<Integer>>} lppbCollapseState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-getcollapsestate
     */
    GetCollapseState(ulFlags, cbInstanceKey, lpbInstanceKey, lpcbCollapseState, lppbCollapseState) {
        result := ComCall(24, this, "uint", ulFlags, "uint", cbInstanceKey, "char*", lpbInstanceKey, "uint*", lpcbCollapseState, "ptr*", lppbCollapseState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Integer} cbCollapseState 
     * @param {Pointer<Integer>} pbCollapseState 
     * @param {Pointer<Integer>} lpbkLocation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapitable-setcollapsestate
     */
    SetCollapseState(ulFlags, cbCollapseState, pbCollapseState, lpbkLocation) {
        result := ComCall(25, this, "uint", ulFlags, "uint", cbCollapseState, "char*", pbCollapseState, "uint*", lpbkLocation, "HRESULT")
        return result
    }
}
