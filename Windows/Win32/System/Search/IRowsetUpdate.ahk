#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HACCESSOR.ahk" { HACCESSOR }
#Import ".\IRowsetChange.ahk" { IRowsetChange }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowsetUpdate extends IRowsetChange {
    /**
     * The interface identifier for IRowsetUpdate
     * @type {Guid}
     */
    static IID := Guid("{0c733a6d-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowsetUpdate interfaces
    */
    struct Vtbl extends IRowsetChange.Vtbl {
        GetOriginalData : IntPtr
        GetPendingRows  : IntPtr
        GetRowStatus    : IntPtr
        Undo            : IntPtr
        Update          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowsetUpdate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} hRow 
     * @param {HACCESSOR} _hAccessor 
     * @returns {Void} 
     */
    GetOriginalData(hRow, _hAccessor) {
        result := ComCall(6, this, "ptr", hRow, HACCESSOR, _hAccessor, "ptr", &pData := 0, "HRESULT")
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
     * Restore the active configuration of the collector from the previous backup file (determined by going back from the current original timestamp).
     * @param {Pointer} hReserved 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rghRows 
     * @param {Pointer<Pointer>} pcRowsUndone 
     * @param {Pointer<Pointer<Pointer>>} prgRowsUndone 
     * @param {Pointer<Pointer<Integer>>} prgRowStatus 
     * @returns {HRESULT} <dl> <dt>
     * 
     * 
     * </dt> <dd>
     * 
     * 0
     * 
     * Failure
     * 
     * </dd> <dt>
     * 
     * 
     * </dt> <dd>
     * 
     * 1
     * 
     * Success
     * 
     * </dd> </dl>
     * @see https://learn.microsoft.com/windows/win32/BEvtColProv/control-undo
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
     * Learn more about: Update constructor
     * @param {Pointer} hReserved 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rghRows 
     * @param {Pointer<Pointer>} pcRows 
     * @param {Pointer<Pointer<Pointer>>} prgRows 
     * @param {Pointer<Pointer<Integer>>} prgRowStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/update-constructor
     */
    Update(hReserved, cRows, rghRows, pcRows, prgRows, prgRowStatus) {
        rghRowsMarshal := rghRows is VarRef ? "ptr*" : "ptr"
        pcRowsMarshal := pcRows is VarRef ? "ptr*" : "ptr"
        prgRowsMarshal := prgRows is VarRef ? "ptr*" : "ptr"
        prgRowStatusMarshal := prgRowStatus is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "ptr", hReserved, "ptr", cRows, rghRowsMarshal, rghRows, pcRowsMarshal, pcRows, prgRowsMarshal, prgRows, prgRowStatusMarshal, prgRowStatus, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRowsetUpdate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOriginalData := CallbackCreate(GetMethod(implObj, "GetOriginalData"), flags, 4)
        this.vtbl.GetPendingRows := CallbackCreate(GetMethod(implObj, "GetPendingRows"), flags, 6)
        this.vtbl.GetRowStatus := CallbackCreate(GetMethod(implObj, "GetRowStatus"), flags, 5)
        this.vtbl.Undo := CallbackCreate(GetMethod(implObj, "Undo"), flags, 7)
        this.vtbl.Update := CallbackCreate(GetMethod(implObj, "Update"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOriginalData)
        CallbackFree(this.vtbl.GetPendingRows)
        CallbackFree(this.vtbl.GetRowStatus)
        CallbackFree(this.vtbl.Undo)
        CallbackFree(this.vtbl.Update)
    }
}
