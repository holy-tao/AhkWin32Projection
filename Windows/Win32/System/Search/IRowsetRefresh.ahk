#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HACCESSOR.ahk" { HACCESSOR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowsetRefresh extends IUnknown {
    /**
     * The interface identifier for IRowsetRefresh
     * @type {Guid}
     */
    static IID := Guid("{0c733aa9-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowsetRefresh interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RefreshVisibleData : IntPtr
        GetLastVisibleData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowsetRefresh.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rghRows 
     * @param {BOOL} fOverWrite 
     * @param {Pointer<Pointer>} pcRowsRefreshed 
     * @param {Pointer<Pointer<Pointer>>} prghRowsRefreshed 
     * @param {Pointer<Pointer<Integer>>} prgRowStatus 
     * @returns {HRESULT} 
     */
    RefreshVisibleData(hChapter, cRows, rghRows, fOverWrite, pcRowsRefreshed, prghRowsRefreshed, prgRowStatus) {
        rghRowsMarshal := rghRows is VarRef ? "ptr*" : "ptr"
        pcRowsRefreshedMarshal := pcRowsRefreshed is VarRef ? "ptr*" : "ptr"
        prghRowsRefreshedMarshal := prghRowsRefreshed is VarRef ? "ptr*" : "ptr"
        prgRowStatusMarshal := prgRowStatus is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", hChapter, "ptr", cRows, rghRowsMarshal, rghRows, BOOL, fOverWrite, pcRowsRefreshedMarshal, pcRowsRefreshed, prghRowsRefreshedMarshal, prghRowsRefreshed, prgRowStatusMarshal, prgRowStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hRow 
     * @param {HACCESSOR} _hAccessor 
     * @returns {Void} 
     */
    GetLastVisibleData(hRow, _hAccessor) {
        result := ComCall(4, this, "ptr", hRow, HACCESSOR, _hAccessor, "ptr", &pData := 0, "HRESULT")
        return pData
    }

    Query(iid) {
        if (IRowsetRefresh.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RefreshVisibleData := CallbackCreate(GetMethod(implObj, "RefreshVisibleData"), flags, 8)
        this.vtbl.GetLastVisibleData := CallbackCreate(GetMethod(implObj, "GetLastVisibleData"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RefreshVisibleData)
        CallbackFree(this.vtbl.GetLastVisibleData)
    }
}
