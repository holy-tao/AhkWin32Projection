#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides commands that allow a producer or a consumer of D3D12 resource to signal down-stream components when the resource is ready for use or can be released.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/mfd3d12/nn-mfd3d12-imfd3d12synchronizationobjectcommands
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
     * Queues a fence on the specified producer command queue that will signal to a downstream consumer when the associated D3D12 resource is ready to be used.
     * @remarks
     * This method will be used by a producer to signal to a down-stream consumer when all the GPU commands that the producer scheduled for the resource have been processed. The signal indicates that the resource is ready for consumption by the consumer.
     * @param {ID3D12CommandQueue} pProducerCommandQueue A pointer to an [ID3D12CommandQueue](../d3d12/nn-d3d12-id3d12commandqueue.md) representing the producer command queue into which the fence should be inserted.
     * @returns {HRESULT} An HRESULT including but not limited to the following values:
     * 
     * | Value | Description |
     * |-------|-------------|
     * | S_OK  | Success     |
     * | MF_E_OPERATION_UNSUPPORTED_AT_D3D_FEATURE_LEVEL | The attempted call or command is not supported with the DirectX version used by the component. |
     * | o	MF_E_UNSUPPORTED_MEDIATYPE_AT_D3D_FEATURE_LEVEL | The specified media type is not supported with the DirectX version used by the component. |
     * @see https://learn.microsoft.com/windows/win32/api//content/mfd3d12/nf-mfd3d12-imfd3d12synchronizationobjectcommands-enqueueresourceready
     */
    EnqueueResourceReady(pProducerCommandQueue) {
        result := ComCall(3, this, "ptr", pProducerCommandQueue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Queues a wait command on the specified consumer command queue, starting a wait for the resource ready signal from the producer command queue.
     * @remarks
     * This function allows the consumer to immediately start scheduling commands for its GPU engine.  The wait will ensure that the commands scheduled after the wait are not executed until the corresponding ready signal is fired by the producer GPU engine.
     * @param {ID3D12CommandQueue} pConsumerCommandQueue A pointer to an [ID3D12CommandQueue](../d3d12/nn-d3d12-id3d12commandqueue.md) representing the consumer command queue into which the wait should be queued.
     * @returns {HRESULT} An HRESULT including but not limited to the following values:
     * 
     * | Value | Description |
     * |-------|-------------|
     * | S_OK  | Success     |
     * | MF_E_OPERATION_UNSUPPORTED_AT_D3D_FEATURE_LEVEL | The attempted call or command is not supported with the DirectX version used by the component. |
     * | o	MF_E_UNSUPPORTED_MEDIATYPE_AT_D3D_FEATURE_LEVEL | The specified media type is not supported with the DirectX version used by the component. |
     * @see https://learn.microsoft.com/windows/win32/api//content/mfd3d12/nf-mfd3d12-imfd3d12synchronizationobjectcommands-enqueueresourcereadywait
     */
    EnqueueResourceReadyWait(pConsumerCommandQueue) {
        result := ComCall(4, this, "ptr", pConsumerCommandQueue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Stores an event handle that will be set when the D3D12 resource is ready.
     * @remarks
     * If the event handle has restricted access rights, the handle must have at least the [EVENT_MODIFY_STATE](/windows/win32/sync/synchronization-object-security-and-access-rights) right. It is the caller's responsibility to close the handle.
     * @param {HANDLE} hEvent A handle to the event that will be set when the resource is ready.
     * @returns {HRESULT} | Value | Description |
     * |-------|-------------|
     * | S_OK  | Success     |
     * | MF_E_OPERATION_UNSUPPORTED_AT_D3D_FEATURE_LEVEL | The attempted call or command is not supported with the DirectX version used by the component. |
     * | o	MF_E_UNSUPPORTED_MEDIATYPE_AT_D3D_FEATURE_LEVEL | The specified media type is not supported with the DirectX version used by the component. |
     * @see https://learn.microsoft.com/windows/win32/api//content/mfd3d12/nf-mfd3d12-imfd3d12synchronizationobjectcommands-signaleventonresourceready
     */
    SignalEventOnResourceReady(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(5, this, "ptr", hEvent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Queues a fence into the specified command queue that will signal to the synchronization object when GPU is finished processing the consumer commands.
     * @param {ID3D12CommandQueue} pConsumerCommandQueue A pointer to an [ID3D12CommandQueue](../d3d12/nn-d3d12-id3d12commandqueue.md) representing the consumer command queue onto which the fence should be queued.
     * @returns {HRESULT} | Value | Description |
     * |-------|-------------|
     * | S_OK  | Success     |
     * | MF_E_OPERATION_UNSUPPORTED_AT_D3D_FEATURE_LEVEL | The attempted call or command is not supported with the DirectX version used by the component. |
     * | o	MF_E_UNSUPPORTED_MEDIATYPE_AT_D3D_FEATURE_LEVEL | The specified media type is not supported with the DirectX version used by the component. |
     * @see https://learn.microsoft.com/windows/win32/api//content/mfd3d12/nf-mfd3d12-imfd3d12synchronizationobjectcommands-enqueueresourcerelease
     */
    EnqueueResourceRelease(pConsumerCommandQueue) {
        result := ComCall(6, this, "ptr", pConsumerCommandQueue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
