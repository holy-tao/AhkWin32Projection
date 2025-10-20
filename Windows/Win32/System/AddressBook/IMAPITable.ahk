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

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * Retrieves the calling thread's last-error code value.
     * @param {HRESULT} hResult 
     * @param {Integer} ulFlags 
     * @param {Pointer<MAPIERROR>} lppMAPIError 
     * @returns {HRESULT} The return value is the calling thread's last-error code.
     * 
     * The Return Value section of the documentation for each function that sets the last-error code notes the conditions under which the function sets the last-error code. Most functions that set the thread's last-error code set it when they fail. However, some functions also set the last-error code when they succeed. If the function is not documented to set the last-error code, the value returned by this function is simply the most recent last-error code to have been set; some functions set the last-error code to 0 on success and others do not.
     * @see https://docs.microsoft.com/windows/win32/api//errhandlingapi/nf-errhandlingapi-getlasterror
     */
    GetLastError(hResult, ulFlags, lppMAPIError) {
        result := ComCall(3, this, "int", hResult, "uint", ulFlags, "ptr", lppMAPIError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulEventMask 
     * @param {Pointer<IMAPIAdviseSink>} lpAdviseSink 
     * @param {Pointer<UInt32>} lpulConnection 
     * @returns {HRESULT} 
     */
    Advise(ulEventMask, lpAdviseSink, lpulConnection) {
        result := ComCall(4, this, "uint", ulEventMask, "ptr", lpAdviseSink, "uint*", lpulConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulConnection 
     * @returns {HRESULT} 
     */
    Unadvise(ulConnection) {
        result := ComCall(5, this, "uint", ulConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpulTableStatus 
     * @param {Pointer<UInt32>} lpulTableType 
     * @returns {HRESULT} 
     */
    GetStatus(lpulTableStatus, lpulTableType) {
        result := ComCall(6, this, "uint*", lpulTableStatus, "uint*", lpulTableType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPropTagArray>} lpPropTagArray 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    SetColumns(lpPropTagArray, ulFlags) {
        result := ComCall(7, this, "ptr", lpPropTagArray, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<SPropTagArray>} lpPropTagArray 
     * @returns {HRESULT} 
     */
    QueryColumns(ulFlags, lpPropTagArray) {
        result := ComCall(8, this, "uint", ulFlags, "ptr", lpPropTagArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<UInt32>} lpulCount 
     * @returns {HRESULT} 
     */
    GetRowCount(ulFlags, lpulCount) {
        result := ComCall(9, this, "uint", ulFlags, "uint*", lpulCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bkOrigin 
     * @param {Integer} lRowCount 
     * @param {Pointer<Int32>} lplRowsSought 
     * @returns {HRESULT} 
     */
    SeekRow(bkOrigin, lRowCount, lplRowsSought) {
        result := ComCall(10, this, "uint", bkOrigin, "int", lRowCount, "int*", lplRowsSought, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulNumerator 
     * @param {Integer} ulDenominator 
     * @returns {HRESULT} 
     */
    SeekRowApprox(ulNumerator, ulDenominator) {
        result := ComCall(11, this, "uint", ulNumerator, "uint", ulDenominator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpulRow 
     * @param {Pointer<UInt32>} lpulNumerator 
     * @param {Pointer<UInt32>} lpulDenominator 
     * @returns {HRESULT} 
     */
    QueryPosition(lpulRow, lpulNumerator, lpulDenominator) {
        result := ComCall(12, this, "uint*", lpulRow, "uint*", lpulNumerator, "uint*", lpulDenominator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SRestriction>} lpRestriction 
     * @param {Integer} bkOrigin 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    FindRow(lpRestriction, bkOrigin, ulFlags) {
        result := ComCall(13, this, "ptr", lpRestriction, "uint", bkOrigin, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SRestriction>} lpRestriction 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    Restrict(lpRestriction, ulFlags) {
        result := ComCall(14, this, "ptr", lpRestriction, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpbkPosition 
     * @returns {HRESULT} 
     */
    CreateBookmark(lpbkPosition) {
        result := ComCall(15, this, "uint*", lpbkPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bkPosition 
     * @returns {HRESULT} 
     */
    FreeBookmark(bkPosition) {
        result := ComCall(16, this, "uint", bkPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SSortOrderSet>} lpSortCriteria 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    SortTable(lpSortCriteria, ulFlags) {
        result := ComCall(17, this, "ptr", lpSortCriteria, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SSortOrderSet>} lppSortCriteria 
     * @returns {HRESULT} 
     */
    QuerySortOrder(lppSortCriteria) {
        result := ComCall(18, this, "ptr", lppSortCriteria, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lRowCount 
     * @param {Integer} ulFlags 
     * @param {Pointer<SRowSet>} lppRows 
     * @returns {HRESULT} 
     */
    QueryRows(lRowCount, ulFlags, lppRows) {
        result := ComCall(19, this, "int", lRowCount, "uint", ulFlags, "ptr", lppRows, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Abort() {
        result := ComCall(20, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbInstanceKey 
     * @param {Pointer<Byte>} pbInstanceKey 
     * @param {Integer} ulRowCount 
     * @param {Integer} ulFlags 
     * @param {Pointer<SRowSet>} lppRows 
     * @param {Pointer<UInt32>} lpulMoreRows 
     * @returns {HRESULT} 
     */
    ExpandRow(cbInstanceKey, pbInstanceKey, ulRowCount, ulFlags, lppRows, lpulMoreRows) {
        result := ComCall(21, this, "uint", cbInstanceKey, "char*", pbInstanceKey, "uint", ulRowCount, "uint", ulFlags, "ptr", lppRows, "uint*", lpulMoreRows, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbInstanceKey 
     * @param {Pointer<Byte>} pbInstanceKey 
     * @param {Integer} ulFlags 
     * @param {Pointer<UInt32>} lpulRowCount 
     * @returns {HRESULT} 
     */
    CollapseRow(cbInstanceKey, pbInstanceKey, ulFlags, lpulRowCount) {
        result := ComCall(22, this, "uint", cbInstanceKey, "char*", pbInstanceKey, "uint", ulFlags, "uint*", lpulRowCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Integer} ulTimeout 
     * @param {Pointer<UInt32>} lpulTableStatus 
     * @returns {HRESULT} 
     */
    WaitForCompletion(ulFlags, ulTimeout, lpulTableStatus) {
        result := ComCall(23, this, "uint", ulFlags, "uint", ulTimeout, "uint*", lpulTableStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Integer} cbInstanceKey 
     * @param {Pointer<Byte>} lpbInstanceKey 
     * @param {Pointer<UInt32>} lpcbCollapseState 
     * @param {Pointer<Byte>} lppbCollapseState 
     * @returns {HRESULT} 
     */
    GetCollapseState(ulFlags, cbInstanceKey, lpbInstanceKey, lpcbCollapseState, lppbCollapseState) {
        result := ComCall(24, this, "uint", ulFlags, "uint", cbInstanceKey, "char*", lpbInstanceKey, "uint*", lpcbCollapseState, "char*", lppbCollapseState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Integer} cbCollapseState 
     * @param {Pointer<Byte>} pbCollapseState 
     * @param {Pointer<UInt32>} lpbkLocation 
     * @returns {HRESULT} 
     */
    SetCollapseState(ulFlags, cbCollapseState, pbCollapseState, lpbkLocation) {
        result := ComCall(25, this, "uint", ulFlags, "uint", cbCollapseState, "char*", pbCollapseState, "uint*", lpbkLocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
