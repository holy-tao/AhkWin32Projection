#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Allows a D3D12 resource allocator to manage the lifetime of a D3D12 resource.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/mfd3d12/nn-mfd3d12-imfd3d12synchronizationobject
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFD3D12SynchronizationObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFD3D12SynchronizationObject
     * @type {Guid}
     */
    static IID => Guid("{802302b0-82de-45e1-b421-f19ee5bdaf23}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SignalEventOnFinalResourceRelease", "Reset"]

    /**
     * Stores an event handle that will be set when the associated D3D12 resource is free and can be recycled, reused, or destroyed.
     * @remarks
     * The handle is signaled when there are no longer any pending resource release or resource ready signals for the current resource.  If the event handle has restricted access rights, the handle must have at least the [EVENT_MODIFY_STATE](/windows/win32/sync/synchronization-object-security-and-access-rights) right.
     * @param {HANDLE} hEvent Handle to the event that will be set when the resource is freed.
     * @returns {HRESULT} An HRESULT including but not limited to the following values:
     * 
     * | Value | Description |
     * |-------|-------------|
     * | S_OK  | Success     |
     * | MF_E_OPERATION_UNSUPPORTED_AT_D3D_FEATURE_LEVEL | The attempted call or command is not supported with the DirectX version used by the component. |
     * | o	MF_E_UNSUPPORTED_MEDIATYPE_AT_D3D_FEATURE_LEVEL | The specified media type is not supported with the DirectX version used by the component. |
     * @see https://learn.microsoft.com/windows/win32/api//content/mfd3d12/nf-mfd3d12-imfd3d12synchronizationobject-signaleventonfinalresourcerelease
     */
    SignalEventOnFinalResourceRelease(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(3, this, "ptr", hEvent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IMFD3D12SynchronizationObject::Reset function resets the synchronization object state, allowing the allocator to reuse the synchronization object and the associated D3D12 resource.
     * @returns {HRESULT} The handle is signaled when there are no longer any pending resource release or resource ready signals for the current resource.  If the event handle has restricted access rights, the handle must have at least the [EVENT_MODIFY_STATE](/windows/win32/sync/synchronization-object-security-and-access-rights) right.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfd3d12/nf-mfd3d12-imfd3d12synchronizationobject-reset
     */
    Reset() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
