#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITQueue.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITQueueEvent interface (tapi3.h) contains methods that retrieve the description of Automatic Call Distribution (ACD) queue events.
 * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nn-tapi3-itqueueevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITQueueEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITQueueEvent
     * @type {Guid}
     */
    static IID => Guid("{297f3033-bd11-11d1-a0a7-00805fc147d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Queue", "get_Event"]

    /**
     * @type {ITQueue} 
     */
    Queue {
        get => this.get_Queue()
    }

    /**
     * @type {Integer} 
     */
    Event {
        get => this.get_Event()
    }

    /**
     * The ITQueueEvent::get_Queue (tapi3.h) method gets a pointer to the queue on which the event occurred.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3cc/nn-tapi3cc-itqueue">ITQueue</a> interface returned by <b>ITQueueEvent::get_Queue</b>. The application must call <b>Release</b> on the 
     * <b>ITQueue</b> interface to free resources associated with it.
     * @returns {ITQueue} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3cc/nn-tapi3cc-itqueue">ITQueue</a> interface on which event occurred.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nf-tapi3-itqueueevent-get_queue
     */
    get_Queue() {
        result := ComCall(7, this, "ptr*", &ppQueue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITQueue(ppQueue)
    }

    /**
     * The ITQueueEvent::get_Event (tapi3.h) method gets the descriptor of the event that occurred.
     * @returns {Integer} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/ne-tapi3-acdqueue_event">ACDQUEUE_EVENT</a> descriptor of event.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nf-tapi3-itqueueevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pEvent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pEvent
    }
}
