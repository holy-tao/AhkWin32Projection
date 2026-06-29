#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }

/**
 * @namespace Windows.Win32.System.Performance
 */
export default struct DISystemMonitor extends IDispatch {
    /**
     * The interface identifier for DISystemMonitor
     * @type {Guid}
     */
    static IID := Guid("{13d73d81-c32e-11cf-9398-00aa00a3ddea}")

    /**
     * The class identifier for DISystemMonitor
     * @type {Guid}
     */
    static CLSID := Guid("{13d73d81-c32e-11cf-9398-00aa00a3ddea}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for DISystemMonitor interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := DISystemMonitor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (DISystemMonitor.IID.Equals(iid)) {
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
