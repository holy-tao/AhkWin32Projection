#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ACDQUEUE_EVENT.ahk" { ACDQUEUE_EVENT }
#Import ".\ITQueue.ahk" { ITQueue }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITQueueEvent interface (tapi3cc.h) contains methods that retrieve the description of Automatic Call Distribution (ACD) queue events.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nn-tapi3cc-itqueueevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITQueueEvent extends IDispatch {
    /**
     * The interface identifier for ITQueueEvent
     * @type {Guid}
     */
    static IID := Guid("{297f3033-bd11-11d1-a0a7-00805fc147d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITQueueEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Queue : IntPtr
        get_Event : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITQueueEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ITQueue} 
     */
    Queue {
        get => this.get_Queue()
    }

    /**
     * @type {ACDQUEUE_EVENT} 
     */
    Event {
        get => this.get_Event()
    }

    /**
     * The ITQueueEvent::get_Queue method (tapi3cc.h) gets a pointer to the queue on which the event occurred.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3cc/nn-tapi3cc-itqueue">ITQueue</a> interface returned by <b>ITQueueEvent::get_Queue</b>. The application must call <b>Release</b> on the 
     * <b>ITQueue</b> interface to free resources associated with it.
     * @returns {ITQueue} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3cc/nn-tapi3cc-itqueue">ITQueue</a> interface on which event occurred.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueueevent-get_queue
     */
    get_Queue() {
        result := ComCall(7, this, "ptr*", &ppQueue := 0, "HRESULT")
        return ITQueue(ppQueue)
    }

    /**
     * The ITQueueEvent::get_Event method (tapi3cc.h) gets the descriptor of the event that occurred.
     * @returns {ACDQUEUE_EVENT} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/ne-tapi3-acdqueue_event">ACDQUEUE_EVENT</a> descriptor of event.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueueevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pEvent := 0, "HRESULT")
        return pEvent
    }

    Query(iid) {
        if (ITQueueEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Queue := CallbackCreate(GetMethod(implObj, "get_Queue"), flags, 2)
        this.vtbl.get_Event := CallbackCreate(GetMethod(implObj, "get_Event"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Queue)
        CallbackFree(this.vtbl.get_Event)
    }
}
