#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IRowset.ahk" { IRowset }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowsetNotify extends IUnknown {
    /**
     * The interface identifier for IRowsetNotify
     * @type {Guid}
     */
    static IID := Guid("{0c733a83-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowsetNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnFieldChange  : IntPtr
        OnRowChange    : IntPtr
        OnRowsetChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowsetNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IRowset} pRowset 
     * @param {Pointer} hRow 
     * @param {Pointer} cColumns 
     * @param {Pointer<Pointer>} rgColumns 
     * @param {Integer} eReason 
     * @param {Integer} ePhase 
     * @param {BOOL} fCantDeny 
     * @returns {HRESULT} 
     */
    OnFieldChange(pRowset, hRow, cColumns, rgColumns, eReason, ePhase, fCantDeny) {
        rgColumnsMarshal := rgColumns is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pRowset, IntPtr, hRow, IntPtr, cColumns, rgColumnsMarshal, rgColumns, UInt32, eReason, UInt32, ePhase, BOOL, fCantDeny, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRowset} pRowset 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rghRows 
     * @param {Integer} eReason 
     * @param {Integer} ePhase 
     * @param {BOOL} fCantDeny 
     * @returns {HRESULT} 
     */
    OnRowChange(pRowset, cRows, rghRows, eReason, ePhase, fCantDeny) {
        rghRowsMarshal := rghRows is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pRowset, IntPtr, cRows, rghRowsMarshal, rghRows, UInt32, eReason, UInt32, ePhase, BOOL, fCantDeny, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRowset} pRowset 
     * @param {Integer} eReason 
     * @param {Integer} ePhase 
     * @param {BOOL} fCantDeny 
     * @returns {HRESULT} 
     */
    OnRowsetChange(pRowset, eReason, ePhase, fCantDeny) {
        result := ComCall(5, this, "ptr", pRowset, UInt32, eReason, UInt32, ePhase, BOOL, fCantDeny, "HRESULT")
        return result
    }

    _Query(iid) {
        if (IRowsetNotify.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnFieldChange := CallbackCreate(GetMethod(implObj, "OnFieldChange"), flags, 8)
        this.vtbl.OnRowChange := CallbackCreate(GetMethod(implObj, "OnRowChange"), flags, 7)
        this.vtbl.OnRowsetChange := CallbackCreate(GetMethod(implObj, "OnRowsetChange"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnFieldChange)
        CallbackFree(this.vtbl.OnRowChange)
        CallbackFree(this.vtbl.OnRowsetChange)
    }
}
