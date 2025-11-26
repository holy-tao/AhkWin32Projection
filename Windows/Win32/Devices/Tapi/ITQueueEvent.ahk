#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITQueue.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITQueueEvent interface contains methods that retrieve the description of Automatic Call Distribution (ACD) queue events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nn-tapi3cc-itqueueevent
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
     * 
     * @returns {ITQueue} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueueevent-get_queue
     */
    get_Queue() {
        result := ComCall(7, this, "ptr*", &ppQueue := 0, "HRESULT")
        return ITQueue(ppQueue)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itqueueevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pEvent := 0, "HRESULT")
        return pEvent
    }
}
