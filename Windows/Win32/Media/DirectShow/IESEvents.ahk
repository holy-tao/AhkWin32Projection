#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IESEvent.ahk" { IESEvent }

/**
 * Implements event handling for devices that have registered to receive specific events derived from the IESEvent interface. In a Protected Broadcast Driver Architecture graph, Media Sink Devices implement this interface to register for events.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESEvents)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-iesevents
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IESEvents extends IUnknown {
    /**
     * The interface identifier for IESEvents
     * @type {Guid}
     */
    static IID := Guid("{abd414bf-cfe5-4e5e-af5b-4b4e49c5bfeb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IESEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnESEventReceived : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IESEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Defines a handler for an event that is derived from the IESEvent interface.
     * @param {Guid} guidEventType GUID for the type of event being handled.
     * @param {IESEvent} pESEvent Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-iesevent">IESEvent</a> object that contains data from the event being handled.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesevents-oneseventreceived
     */
    OnESEventReceived(guidEventType, pESEvent) {
        result := ComCall(3, this, Guid, guidEventType, "ptr", pESEvent, "HRESULT")
        return result
    }

    Query(iid) {
        if (IESEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnESEventReceived := CallbackCreate(GetMethod(implObj, "OnESEventReceived"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnESEventReceived)
    }
}
