#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IVPBaseNotify.ahk" { IVPBaseNotify }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVPVBINotify extends IVPBaseNotify {
    /**
     * The interface identifier for IVPVBINotify
     * @type {Guid}
     */
    static IID := Guid("{ec529b01-1a1f-11d1-bad9-00609744111a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVPVBINotify interfaces
    */
    struct Vtbl extends IVPBaseNotify.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVPVBINotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IVPVBINotify.IID.Equals(iid)) {
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
