#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\IESEvent.ahk" { IESEvent }

/**
 * Implements an event service that includes methods that raise events derived from the IESEvent interface.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESEventService)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ieseventservice
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IESEventService extends IUnknown {
    /**
     * The interface identifier for IESEventService
     * @type {Guid}
     */
    static IID := Guid("{ed89a619-4c06-4b2f-99eb-c7669b13047c}")

    /**
     * The class identifier for ESEventService
     * @type {Guid}
     */
    static CLSID := Guid("{c20447fc-ec60-475e-813f-d2b0a6decefe}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IESEventService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FireESEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IESEventService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Raises an event derived from the IESEvent interface.
     * @param {IESEvent} pESEvent Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-iesevent">IESEvent</a> interface for the event being raised.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ieseventservice-fireesevent
     */
    FireESEvent(pESEvent) {
        result := ComCall(3, this, "ptr", pESEvent, "HRESULT")
        return result
    }

    Query(iid) {
        if (IESEventService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FireESEvent := CallbackCreate(GetMethod(implObj, "FireESEvent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FireESEvent)
    }
}
