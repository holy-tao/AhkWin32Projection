#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HACCESSOR.ahk" { HACCESSOR }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowsetResynch extends IUnknown {
    /**
     * The interface identifier for IRowsetResynch
     * @type {Guid}
     */
    static IID := Guid("{0c733a84-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowsetResynch interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetVisibleData : IntPtr
        ResynchRows    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowsetResynch.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} hRow 
     * @param {HACCESSOR} _hAccessor 
     * @returns {Void} 
     */
    GetVisibleData(hRow, _hAccessor) {
        result := ComCall(3, this, "ptr", hRow, HACCESSOR, _hAccessor, "ptr", &pData := 0, "HRESULT")
        return pData
    }

    /**
     * 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rghRows 
     * @param {Pointer<Pointer>} pcRowsResynched 
     * @param {Pointer<Pointer<Pointer>>} prghRowsResynched 
     * @param {Pointer<Pointer<Integer>>} prgRowStatus 
     * @returns {HRESULT} 
     */
    ResynchRows(cRows, rghRows, pcRowsResynched, prghRowsResynched, prgRowStatus) {
        rghRowsMarshal := rghRows is VarRef ? "ptr*" : "ptr"
        pcRowsResynchedMarshal := pcRowsResynched is VarRef ? "ptr*" : "ptr"
        prghRowsResynchedMarshal := prghRowsResynched is VarRef ? "ptr*" : "ptr"
        prgRowStatusMarshal := prgRowStatus is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", cRows, rghRowsMarshal, rghRows, pcRowsResynchedMarshal, pcRowsResynched, prghRowsResynchedMarshal, prghRowsResynched, prgRowStatusMarshal, prgRowStatus, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRowsetResynch.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetVisibleData := CallbackCreate(GetMethod(implObj, "GetVisibleData"), flags, 4)
        this.vtbl.ResynchRows := CallbackCreate(GetMethod(implObj, "ResynchRows"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetVisibleData)
        CallbackFree(this.vtbl.ResynchRows)
    }
}
