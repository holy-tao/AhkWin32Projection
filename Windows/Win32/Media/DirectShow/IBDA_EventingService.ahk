#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to a device's Eventing Service.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_EventingService)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_eventingservice
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_EventingService extends IUnknown {
    /**
     * The interface identifier for IBDA_EventingService
     * @type {Guid}
     */
    static IID := Guid("{207c413f-00dc-4c61-bad6-6fee1ff07064}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_EventingService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CompleteEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_EventingService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the media transform device (MTD) when the media sink device (MSD) completes an event.
     * @param {Integer} ulEventID The identifier of the event.
     * @param {Integer} ulEventResult The result code of the event.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_eventingservice-completeevent
     */
    CompleteEvent(ulEventID, ulEventResult) {
        result := ComCall(3, this, "uint", ulEventID, "uint", ulEventResult, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_EventingService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CompleteEvent := CallbackCreate(GetMethod(implObj, "CompleteEvent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CompleteEvent)
    }
}
