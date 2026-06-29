#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSVidOutputDeviceEvent.ahk" { IMSVidOutputDeviceEvent }

/**
 * This topic applies to Windows Vista or later.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidEVREvent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidevrevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidEVREvent extends IMSVidOutputDeviceEvent {
    /**
     * The interface identifier for IMSVidEVREvent
     * @type {Guid}
     */
    static IID := Guid("{349abb10-883c-4f22-8714-cecaeee45d62}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidEVREvent interfaces
    */
    struct Vtbl extends IMSVidOutputDeviceEvent.Vtbl {
        OnUserEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidEVREvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This topic applies to Windows Vista or later.
     * @remarks
     * The purpose of this method is to forward custom events from an EVR presenter to the application through the Video Control.
     * 
     * <ol>
     * <li>The presenter calls <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaeventsink-notify">IMediaEventSink::Notify</a> on the EVR with an event code of EC_USER or higher. (This range of values is reserved for custom graph events.)</li>
     * <li>The EVR forwards the event to the Filter Graph Manager.</li>
     * <li>The Filter Graph Manager forwards the event to the Video Control.</li>
     * <li>The Video Control forwards the event to the application by calling <b>OnUserEvent</b>.</li>
     * </ol>
     * The dispatch identifier (dispid) of this method is <b>dispidUserEvent</b>.
     * @param {Integer} lEventCode Event code.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidevrevent-onuserevent
     */
    OnUserEvent(lEventCode) {
        result := ComCall(8, this, "int", lEventCode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidEVREvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnUserEvent := CallbackCreate(GetMethod(implObj, "OnUserEvent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnUserEvent)
    }
}
