#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFD3D12SynchronizationObjectCommands extends IUnknown{
    /**
     * The interface identifier for IMFD3D12SynchronizationObjectCommands
     * @type {Guid}
     */
    static IID => Guid("{09d0f835-92ff-4e53-8efa-40faa551f233}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ID3D12CommandQueue>} pProducerCommandQueue 
     * @returns {HRESULT} 
     */
    EnqueueResourceReady(pProducerCommandQueue) {
        result := ComCall(3, this, "ptr", pProducerCommandQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12CommandQueue>} pConsumerCommandQueue 
     * @returns {HRESULT} 
     */
    EnqueueResourceReadyWait(pConsumerCommandQueue) {
        result := ComCall(4, this, "ptr", pConsumerCommandQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hEvent 
     * @returns {HRESULT} 
     */
    SignalEventOnResourceReady(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(5, this, "ptr", hEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12CommandQueue>} pConsumerCommandQueue 
     * @returns {HRESULT} 
     */
    EnqueueResourceRelease(pConsumerCommandQueue) {
        result := ComCall(6, this, "ptr", pConsumerCommandQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
