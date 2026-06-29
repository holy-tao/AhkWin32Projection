#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Graphics\Direct3D9\IDirect3DDevice9.ahk" { IDirect3DDevice9 }
#Import "..\..\Graphics\Direct3D9\IDirect3DSurface9.ahk" { IDirect3DSurface9 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\VMR9AllocationInfo.ahk" { VMR9AllocationInfo }
#Import ".\IVMRSurfaceAllocator9.ahk" { IVMRSurfaceAllocator9 }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Graphics\Gdi\HMONITOR.ahk" { HMONITOR }

/**
 * The IVMRSurfaceAllocatorNotify9 interface is implemented by the Video Mixing Renderer Filter 9 (VMR-9).
 * @remarks
 * The VMR-9 supports this interface in renderless mode only. Otherwise, <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> returns <b>E_NOINTERFACE</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/vmr-modes-of-operation">VMR Modes of Operation</a>.
 * 
 * Include DShow.h and D3d9.h before Vmr9.h.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/nn-vmr9-ivmrsurfaceallocatornotify9
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRSurfaceAllocatorNotify9 extends IUnknown {
    /**
     * The interface identifier for IVMRSurfaceAllocatorNotify9
     * @type {Guid}
     */
    static IID := Guid("{dca3f5df-bb3a-4d03-bd81-84614bfbfa0c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRSurfaceAllocatorNotify9 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AdviseSurfaceAllocator : IntPtr
        SetD3DDevice           : IntPtr
        ChangeD3DDevice        : IntPtr
        AllocateSurfaceHelper  : IntPtr
        NotifyEvent            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRSurfaceAllocatorNotify9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The AdviseSurfaceAllocator method is called by an application to instruct the VMR-9 to use a custom allocator-presenter.
     * @remarks
     * This method can be called only once in the lifetime of the VMR. The VMR continues to use the allocator-presenter until the VMR is itself deleted. When the VMR is finally released, it releases its reference count on the custom allocator-presenter object, which allows that object to be freed.
     * 
     * The custom allocator-presenter must also support the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/nn-vmr9-ivmrimagepresenter9">IVMRImagePresenter9</a> interface.
     * 
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Pointer} dwUserID Application-defined value that identifies this instance of the VMR-9.
     * @param {IVMRSurfaceAllocator9} lpIVRMSurfaceAllocator Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/nn-vmr9-ivmrsurfaceallocator9">IVMRSurfaceAllocator9</a> interface on the custom surface allocator object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurfaceallocatornotify9-advisesurfaceallocator
     */
    AdviseSurfaceAllocator(dwUserID, lpIVRMSurfaceAllocator) {
        result := ComCall(3, this, "ptr", dwUserID, "ptr", lpIVRMSurfaceAllocator, "HRESULT")
        return result
    }

    /**
     * The SetD3DDevice method sets the Direct3D device.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {IDirect3DDevice9} lpD3DDevice Pointer to the <b>IDirect3DDevice9</b> interface of the device.
     * @param {HMONITOR} _hMonitor Handle to a monitor.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurfaceallocatornotify9-setd3ddevice
     */
    SetD3DDevice(lpD3DDevice, _hMonitor) {
        result := ComCall(4, this, "ptr", lpD3DDevice, HMONITOR, _hMonitor, "HRESULT")
        return result
    }

    /**
     * The ChangeD3DDevice method notifies the VMR that the Direct3D device has changed.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {IDirect3DDevice9} lpD3DDevice Pointer to the <b>IDirect3DDevice9</b> interface of the new device.
     * @param {HMONITOR} _hMonitor Handle to the monitor associated with the new device.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurfaceallocatornotify9-changed3ddevice
     */
    ChangeD3DDevice(lpD3DDevice, _hMonitor) {
        result := ComCall(5, this, "ptr", lpD3DDevice, HMONITOR, _hMonitor, "HRESULT")
        return result
    }

    /**
     * The AllocateSurfaceHelper method allocates a Direct3D surface based on application-specified parameters.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Pointer<VMR9AllocationInfo>} lpAllocInfo Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9allocationinfo">VMR9AllocationInfo</a> structure that describes the surfaces to create.
     * @param {Pointer<Integer>} lpNumBuffers On input, this parameter specifies the number of surfaces to create. On output, this parameter contains the number of surfaces that the method created.
     * @returns {IDirect3DSurface9} Address of an array of <b>IDirect3DSurface9</b> interface pointers. The size of the array must equal the value in <i>lpNumBuffers</i>. The method fills the array with valid <b>IDirect3DSurface9</b> pointers for each Direct3D surface that it creates. The caller must release the interface pointers. (Do not put any valid pointers into the array before you call this method, because the method will overwrite them, causing a memory leak.)
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurfaceallocatornotify9-allocatesurfacehelper
     */
    AllocateSurfaceHelper(lpAllocInfo, lpNumBuffers) {
        lpNumBuffersMarshal := lpNumBuffers is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, VMR9AllocationInfo.Ptr, lpAllocInfo, lpNumBuffersMarshal, lpNumBuffers, "ptr*", &lplpSurface := 0, "HRESULT")
        return IDirect3DSurface9(lplpSurface)
    }

    /**
     * The NotifyEvent method is called by the allocator-presenter to inform the VMR of any significant DirectShow events that it (the allocator presenter) generates during the allocation or presentation processes.
     * @remarks
     * The VMR provides the allocator-presenter with a pointer to this interface in a call to <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrsurfaceallocator9-advisenotify">IVMRSurfaceAllocator9::AdviseNotify</a>. When the allocator-presenter calls this method and specifies some regular DirectShow event, such as EC_ERRORABORT or EC_VMR_RENDERDEVICE_SET, the VMR will pass the event to the filter graph manager.
     * 
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Integer} EventCode Specifies the DirectShow event code.
     * @param {Pointer} Param1 Specifies the first event parameter. The meaning depends on the event code. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/event-notification-codes">Event Notification Codes</a>.
     * @param {Pointer} Param2 Specifies the second event parameter. The meaning depends on the event code.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurfaceallocatornotify9-notifyevent
     */
    NotifyEvent(EventCode, Param1, Param2) {
        result := ComCall(7, this, "int", EventCode, "ptr", Param1, "ptr", Param2, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVMRSurfaceAllocatorNotify9.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AdviseSurfaceAllocator := CallbackCreate(GetMethod(implObj, "AdviseSurfaceAllocator"), flags, 3)
        this.vtbl.SetD3DDevice := CallbackCreate(GetMethod(implObj, "SetD3DDevice"), flags, 3)
        this.vtbl.ChangeD3DDevice := CallbackCreate(GetMethod(implObj, "ChangeD3DDevice"), flags, 3)
        this.vtbl.AllocateSurfaceHelper := CallbackCreate(GetMethod(implObj, "AllocateSurfaceHelper"), flags, 4)
        this.vtbl.NotifyEvent := CallbackCreate(GetMethod(implObj, "NotifyEvent"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AdviseSurfaceAllocator)
        CallbackFree(this.vtbl.SetD3DDevice)
        CallbackFree(this.vtbl.ChangeD3DDevice)
        CallbackFree(this.vtbl.AllocateSurfaceHelper)
        CallbackFree(this.vtbl.NotifyEvent)
    }
}
