#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITQueueEvent interface contains methods that retrieve the description of Automatic Call Distribution (ACD) queue events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nn-tapi3cc-itqueueevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITQueueEvent extends IDispatch{
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
     * 
     * @param {Pointer<ITQueue>} ppQueue 
     * @returns {HRESULT} 
     */
    get_Queue(ppQueue) {
        result := ComCall(7, this, "ptr", ppQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pEvent 
     * @returns {HRESULT} 
     */
    get_Event(pEvent) {
        result := ComCall(8, this, "int*", pEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
