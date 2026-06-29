#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }

/**
 * Implement this interface to receive notifications when events occur.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-_irdpsessionevents
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct _IRDPSessionEvents extends IDispatch {
    /**
     * The interface identifier for _IRDPSessionEvents
     * @type {Guid}
     */
    static IID := Guid("{98a97042-6698-40e9-8efd-b3200990004b}")

    /**
     * The class identifier for _IRDPSessionEvents
     * @type {Guid}
     */
    static CLSID := Guid("{98a97042-6698-40e9-8efd-b3200990004b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for _IRDPSessionEvents interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := _IRDPSessionEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (_IRDPSessionEvents.IID.Equals(iid)) {
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
