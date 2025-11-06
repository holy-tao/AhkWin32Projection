#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRowsetChange.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetUpdate extends IRowsetChange{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowsetUpdate
     * @type {Guid}
     */
    static IID => Guid("{0c733a6d-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOriginalData", "GetPendingRows", "GetRowStatus", "Undo", "Update"]

    /**
     * 
     * @param {Pointer} hRow 
     * @param {HACCESSOR} hAccessor 
     * @returns {Void} 
     */
    GetOriginalData(hRow, hAccessor) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        result := ComCall(6, this, "ptr", hRow, "ptr", hAccessor, "ptr", &pData := 0, "HRESULT")
        return pData
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Integer} dwRowStatus 
     * @param {Pointer<Pointer>} pcPendingRows 
     * @param {Pointer<Pointer<Pointer>>} prgPendingRows 
     * @param {Pointer<Pointer<Integer>>} prgPendingStatus 
     * @returns {HRESULT} 
     */
    GetPendingRows(hReserved, dwRowStatus, pcPendingRows, prgPendingRows, prgPendingStatus) {
        pcPendingRowsMarshal := pcPendingRows is VarRef ? "ptr*" : "ptr"
        prgPendingRowsMarshal := prgPendingRows is VarRef ? "ptr*" : "ptr"
        prgPendingStatusMarshal := prgPendingStatus is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", hReserved, "uint", dwRowStatus, pcPendingRowsMarshal, pcPendingRows, prgPendingRowsMarshal, prgPendingRows, prgPendingStatusMarshal, prgPendingStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rghRows 
     * @returns {Integer} 
     */
    GetRowStatus(hReserved, cRows, rghRows) {
        rghRowsMarshal := rghRows is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", hReserved, "ptr", cRows, rghRowsMarshal, rghRows, "uint*", &rgPendingStatus := 0, "HRESULT")
        return rgPendingStatus
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rghRows 
     * @param {Pointer<Pointer>} pcRowsUndone 
     * @param {Pointer<Pointer<Pointer>>} prgRowsUndone 
     * @param {Pointer<Pointer<Integer>>} prgRowStatus 
     * @returns {HRESULT} 
     */
    Undo(hReserved, cRows, rghRows, pcRowsUndone, prgRowsUndone, prgRowStatus) {
        rghRowsMarshal := rghRows is VarRef ? "ptr*" : "ptr"
        pcRowsUndoneMarshal := pcRowsUndone is VarRef ? "ptr*" : "ptr"
        prgRowsUndoneMarshal := prgRowsUndone is VarRef ? "ptr*" : "ptr"
        prgRowStatusMarshal := prgRowStatus is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", hReserved, "ptr", cRows, rghRowsMarshal, rghRows, pcRowsUndoneMarshal, pcRowsUndone, prgRowsUndoneMarshal, prgRowsUndone, prgRowStatusMarshal, prgRowStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rghRows 
     * @param {Pointer<Pointer>} pcRows 
     * @param {Pointer<Pointer<Pointer>>} prgRows 
     * @param {Pointer<Pointer<Integer>>} prgRowStatus 
     * @returns {HRESULT} 
     */
    Update(hReserved, cRows, rghRows, pcRows, prgRows, prgRowStatus) {
        rghRowsMarshal := rghRows is VarRef ? "ptr*" : "ptr"
        pcRowsMarshal := pcRows is VarRef ? "ptr*" : "ptr"
        prgRowsMarshal := prgRows is VarRef ? "ptr*" : "ptr"
        prgRowStatusMarshal := prgRowStatus is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "ptr", hReserved, "ptr", cRows, rghRowsMarshal, rghRows, pcRowsMarshal, pcRows, prgRowsMarshal, prgRows, prgRowStatusMarshal, prgRowStatus, "HRESULT")
        return result
    }
}
