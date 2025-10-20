#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class ITableData extends IUnknown{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<SSortOrderSet>} lpSSortOrderSet 
     * @param {Pointer<CALLERRELEASE>} lpfCallerRelease 
     * @param {Integer} ulCallerData 
     * @param {Pointer<IMAPITable>} lppMAPITable 
     * @returns {HRESULT} 
     */
    HrGetView(lpSSortOrderSet, lpfCallerRelease, ulCallerData, lppMAPITable) {
        result := ComCall(3, this, "ptr", lpSSortOrderSet, "ptr", lpfCallerRelease, "uint", ulCallerData, "ptr", lppMAPITable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SRow>} param0 
     * @returns {HRESULT} 
     */
    HrModifyRow(param0) {
        result := ComCall(4, this, "ptr", param0, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPropValue>} lpSPropValue 
     * @returns {HRESULT} 
     */
    HrDeleteRow(lpSPropValue) {
        result := ComCall(5, this, "ptr", lpSPropValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPropValue>} lpsPropValue 
     * @param {Pointer<SRow>} lppSRow 
     * @param {Pointer<UInt32>} lpuliRow 
     * @returns {HRESULT} 
     */
    HrQueryRow(lpsPropValue, lppSRow, lpuliRow) {
        result := ComCall(6, this, "ptr", lpsPropValue, "ptr", lppSRow, "uint*", lpuliRow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulRowNumber 
     * @param {Pointer<SRow>} lppSRow 
     * @returns {HRESULT} 
     */
    HrEnumRow(ulRowNumber, lppSRow) {
        result := ComCall(7, this, "uint", ulRowNumber, "ptr", lppSRow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Integer} cValues 
     * @param {Pointer<SPropValue>} lpSPropValue 
     * @returns {HRESULT} 
     */
    HrNotify(ulFlags, cValues, lpSPropValue) {
        result := ComCall(8, this, "uint", ulFlags, "uint", cValues, "ptr", lpSPropValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uliRow 
     * @param {Pointer<SRow>} lpSRow 
     * @returns {HRESULT} 
     */
    HrInsertRow(uliRow, lpSRow) {
        result := ComCall(9, this, "uint", uliRow, "ptr", lpSRow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<SRowSet>} lpSRowSet 
     * @returns {HRESULT} 
     */
    HrModifyRows(ulFlags, lpSRowSet) {
        result := ComCall(10, this, "uint", ulFlags, "ptr", lpSRowSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<SRowSet>} lprowsetToDelete 
     * @param {Pointer<UInt32>} cRowsDeleted 
     * @returns {HRESULT} 
     */
    HrDeleteRows(ulFlags, lprowsetToDelete, cRowsDeleted) {
        result := ComCall(11, this, "uint", ulFlags, "ptr", lprowsetToDelete, "uint*", cRowsDeleted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
