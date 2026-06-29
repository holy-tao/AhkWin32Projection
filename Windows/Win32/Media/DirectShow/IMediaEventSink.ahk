#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the Filter Graph Manager of events that occur within the filter graph.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-imediaeventsink
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IMediaEventSink extends IUnknown {
    /**
     * The interface identifier for IMediaEventSink
     * @type {Guid}
     */
    static IID := Guid("{56a868a2-0ad4-11ce-b03a-0020af0ba770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMediaEventSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Notify : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMediaEventSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Notify method notifies the Filter Graph Manager of an event.
     * @remarks
     * The event is queued but not delivered to the application on this thread. For a list of notification codes and event parameter values, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/event-notification-codes">Event Notification Codes</a>.
     * @param {Integer} EventCode Identifier of the event.
     * @param {Pointer} EventParam1 First event parameter.
     * @param {Pointer} EventParam2 Second event parameter.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaeventsink-notify
     */
    Notify(EventCode, EventParam1, EventParam2) {
        result := ComCall(3, this, "int", EventCode, "ptr", EventParam1, "ptr", EventParam2, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMediaEventSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Notify := CallbackCreate(GetMethod(implObj, "Notify"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Notify)
    }
}
