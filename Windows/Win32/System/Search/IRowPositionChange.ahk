#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowPositionChange extends IUnknown {
    /**
     * The interface identifier for IRowPositionChange
     * @type {Guid}
     */
    static IID := Guid("{0997a571-126e-11d0-9f8a-00a0c9a0631e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowPositionChange interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnRowPositionChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowPositionChange.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} eReason 
     * @param {Integer} ePhase 
     * @param {BOOL} fCantDeny 
     * @returns {HRESULT} 
     */
    OnRowPositionChange(eReason, ePhase, fCantDeny) {
        result := ComCall(3, this, "uint", eReason, "uint", ePhase, BOOL, fCantDeny, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRowPositionChange.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnRowPositionChange := CallbackCreate(GetMethod(implObj, "OnRowPositionChange"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnRowPositionChange)
    }
}
