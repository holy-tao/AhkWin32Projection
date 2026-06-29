#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }

/**
 * @namespace Windows.Win32.System.Performance
 */
export default struct DISystemMonitorEvents extends IDispatch {
    /**
     * The interface identifier for DISystemMonitorEvents
     * @type {Guid}
     */
    static IID := Guid("{84979930-4ab3-11cf-943a-008029004347}")

    /**
     * The class identifier for DISystemMonitorEvents
     * @type {Guid}
     */
    static CLSID := Guid("{84979930-4ab3-11cf-943a-008029004347}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for DISystemMonitorEvents interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := DISystemMonitorEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (DISystemMonitorEvents.IID.Equals(iid)) {
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
