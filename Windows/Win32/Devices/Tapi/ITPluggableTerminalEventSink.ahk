#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MSP_EVENT_INFO.ahk" { MSP_EVENT_INFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITPluggableTerminalEventSink (msp.h) interface provides a method that fires a message to notify client applications about a change in a pluggable terminal.
 * @see https://learn.microsoft.com/windows/win32/api/msp/nn-msp-itpluggableterminaleventsink
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITPluggableTerminalEventSink extends IUnknown {
    /**
     * The interface identifier for ITPluggableTerminalEventSink
     * @type {Guid}
     */
    static IID := Guid("{6e0887be-ba1a-492e-bd10-4020ec5e33e0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITPluggableTerminalEventSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FireEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITPluggableTerminalEventSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ITPluggableTerminalEventSink::FireEvent (msp.h) method results in a message that notifies the client application of a change in the pluggable terminal.
     * @param {Pointer<MSP_EVENT_INFO>} pMspEventInfo Pointer to a const cast of the 
     * <a href="https://docs.microsoft.com/windows/win32/api/msp/ns-msp-msp_event_info">MSP_EVENT_INFO</a> structure.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msp/nf-msp-itpluggableterminaleventsink-fireevent
     */
    FireEvent(pMspEventInfo) {
        result := ComCall(3, this, MSP_EVENT_INFO.Ptr, pMspEventInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITPluggableTerminalEventSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FireEvent := CallbackCreate(GetMethod(implObj, "FireEvent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FireEvent)
    }
}
