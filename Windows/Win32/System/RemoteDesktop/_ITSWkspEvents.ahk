#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct _ITSWkspEvents extends IDispatch {
    /**
     * The interface identifier for _ITSWkspEvents
     * @type {Guid}
     */
    static IID := Guid("{b922bbb8-4c55-4fea-8496-beb0b44285e9}")

    /**
     * The class identifier for _ITSWkspEvents
     * @type {Guid}
     */
    static CLSID := Guid("{b922bbb8-4c55-4fea-8496-beb0b44285e9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for _ITSWkspEvents interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := _ITSWkspEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (_ITSWkspEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
