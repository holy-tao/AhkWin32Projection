#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPITable.ahk
#Include ..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/itabledataiunknown
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
     * @param {Pointer<SSortOrderSet>} lpSSortOrderSet 
     * @param {Pointer<Pointer<CALLERRELEASE>>} lpfCallerRelease 
     * @param {Integer} ulCallerData 
     * @returns {IMAPITable} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/itabledata-hrgetview
     */
    HrGetView(lpSSortOrderSet, lpfCallerRelease, ulCallerData) {
        lpfCallerReleaseMarshal := lpfCallerRelease is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", lpSSortOrderSet, lpfCallerReleaseMarshal, lpfCallerRelease, "uint", ulCallerData, "ptr*", &lppMAPITable := 0, "HRESULT")
        return IMAPITable(lppMAPITable)
    }

    /**
     * 
     * @param {Pointer<SRow>} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/itabledata-hrmodifyrow
     */
    HrModifyRow(param0) {
        result := ComCall(4, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPropValue>} lpSPropValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/itabledata-hrdeleterow
     */
    HrDeleteRow(lpSPropValue) {
        result := ComCall(5, this, "ptr", lpSPropValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPropValue>} lpsPropValue 
     * @param {Pointer<Pointer<SRow>>} lppSRow 
     * @param {Pointer<Integer>} lpuliRow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/itabledata-hrqueryrow
     */
    HrQueryRow(lpsPropValue, lppSRow, lpuliRow) {
        lppSRowMarshal := lppSRow is VarRef ? "ptr*" : "ptr"
        lpuliRowMarshal := lpuliRow is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", lpsPropValue, lppSRowMarshal, lppSRow, lpuliRowMarshal, lpuliRow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulRowNumber 
     * @param {Pointer<Pointer<SRow>>} lppSRow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/itabledata-hrenumrow
     */
    HrEnumRow(ulRowNumber, lppSRow) {
        lppSRowMarshal := lppSRow is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "uint", ulRowNumber, lppSRowMarshal, lppSRow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Integer} cValues 
     * @param {Pointer<SPropValue>} lpSPropValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/itabledata-hrnotify
     */
    HrNotify(ulFlags, cValues, lpSPropValue) {
        result := ComCall(8, this, "uint", ulFlags, "uint", cValues, "ptr", lpSPropValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uliRow 
     * @param {Pointer<SRow>} lpSRow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/itabledata-hrinsertrow
     */
    HrInsertRow(uliRow, lpSRow) {
        result := ComCall(9, this, "uint", uliRow, "ptr", lpSRow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<SRowSet>} lpSRowSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/itabledata-hrmodifyrows
     */
    HrModifyRows(ulFlags, lpSRowSet) {
        result := ComCall(10, this, "uint", ulFlags, "ptr", lpSRowSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<SRowSet>} lprowsetToDelete 
     * @param {Pointer<Integer>} cRowsDeleted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/itabledata-hrdeleterows
     */
    HrDeleteRows(ulFlags, lprowsetToDelete, cRowsDeleted) {
        cRowsDeletedMarshal := cRowsDeleted is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", ulFlags, "ptr", lprowsetToDelete, cRowsDeletedMarshal, cRowsDeleted, "HRESULT")
        return result
    }
}
