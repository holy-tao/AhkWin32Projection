#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Allows a D3D12 resource allocator to manage the lifetime of a D3D12 resource.
 * @see https://learn.microsoft.com/windows/win32/api/mfd3d12/nn-mfd3d12-imfd3d12synchronizationobject
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFD3D12SynchronizationObject extends IUnknown {
    /**
     * The interface identifier for IMFD3D12SynchronizationObject
     * @type {Guid}
     */
    static IID := Guid("{802302b0-82de-45e1-b421-f19ee5bdaf23}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFD3D12SynchronizationObject interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SignalEventOnFinalResourceRelease : IntPtr
        Reset                             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFD3D12SynchronizationObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/mfd3d12/nf-mfd3d12-imfd3d12synchronizationobject-signaleventonfinalresourcerelease
     */
    SignalEventOnFinalResourceRelease(hEvent) {
        result := ComCall(3, this, HANDLE, hEvent, "HRESULT")
        return result
    }

    /**
     * The IMFD3D12SynchronizationObject::Reset function resets the synchronization object state, allowing the allocator to reuse the synchronization object and the associated D3D12 resource.
     * @returns {HRESULT} The handle is signaled when there are no longer any pending resource release or resource ready signals for the current resource.  If the event handle has restricted access rights, the handle must have at least the [EVENT_MODIFY_STATE](/windows/win32/sync/synchronization-object-security-and-access-rights) right.
     * @see https://learn.microsoft.com/windows/win32/api/mfd3d12/nf-mfd3d12-imfd3d12synchronizationobject-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFD3D12SynchronizationObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SignalEventOnFinalResourceRelease := CallbackCreate(GetMethod(implObj, "SignalEventOnFinalResourceRelease"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SignalEventOnFinalResourceRelease)
        CallbackFree(this.vtbl.Reset)
    }
}
