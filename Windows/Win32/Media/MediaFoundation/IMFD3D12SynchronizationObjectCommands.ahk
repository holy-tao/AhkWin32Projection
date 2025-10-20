#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mfd3d12/nn-mfd3d12-imfd3d12synchronizationobjectcommands
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFD3D12SynchronizationObjectCommands extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnqueueResourceReady", "EnqueueResourceReadyWait", "SignalEventOnResourceReady", "EnqueueResourceRelease"]

    /**
     * 
     * @param {ID3D12CommandQueue} pProducerCommandQueue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfd3d12/nf-mfd3d12-imfd3d12synchronizationobjectcommands-enqueueresourceready
     */
    EnqueueResourceReady(pProducerCommandQueue) {
        result := ComCall(3, this, "ptr", pProducerCommandQueue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12CommandQueue} pConsumerCommandQueue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfd3d12/nf-mfd3d12-imfd3d12synchronizationobjectcommands-enqueueresourcereadywait
     */
    EnqueueResourceReadyWait(pConsumerCommandQueue) {
        result := ComCall(4, this, "ptr", pConsumerCommandQueue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfd3d12/nf-mfd3d12-imfd3d12synchronizationobjectcommands-signaleventonresourceready
     */
    SignalEventOnResourceReady(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(5, this, "ptr", hEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12CommandQueue} pConsumerCommandQueue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfd3d12/nf-mfd3d12-imfd3d12synchronizationobjectcommands-enqueueresourcerelease
     */
    EnqueueResourceRelease(pConsumerCommandQueue) {
        result := ComCall(6, this, "ptr", pConsumerCommandQueue, "HRESULT")
        return result
    }
}
