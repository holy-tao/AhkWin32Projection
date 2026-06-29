#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IVMRSurfaceAllocatorNotify9.ahk" { IVMRSurfaceAllocatorNotify9 }
#Import "..\..\Graphics\Direct3D9\IDirect3DSurface9.ahk" { IDirect3DSurface9 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\VMR9AllocationInfo.ahk" { VMR9AllocationInfo }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVMRSurfaceAllocator9 interface is implemented by the default allocator-presenter for the Video Mixing Renderer Filter 9 (VMR-9).
 * @remarks
 * Include DShow.h and D3d9.h before Vmr9.h.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/nn-vmr9-ivmrsurfaceallocator9
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRSurfaceAllocator9 extends IUnknown {
    /**
     * The interface identifier for IVMRSurfaceAllocator9
     * @type {Guid}
     */
    static IID := Guid("{8d5148ea-3f5d-46cf-9df1-d1b896eedb1f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRSurfaceAllocator9 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitializeDevice : IntPtr
        TerminateDevice  : IntPtr
        GetSurface       : IntPtr
        AdviseNotify     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRSurfaceAllocator9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The InitializeDevice method is called by the Video Mixing Renderer 9 (VMR-9) when it needs the allocator-presenter to allocate surfaces.
     * @remarks
     * Implement this method if you are providing a custom allocator-presenter for the VMR-9. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrsurfaceallocatornotify9-allocatesurfacehelper">IVMRSurfaceAllocatorNotify9::AllocateSurfaceHelper</a> method on the VMR-9 to allocate the surfaces.
     * 
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Pointer} dwUserID Application-defined identifier. This value is the same value that the application passed to the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrsurfaceallocatornotify9-advisesurfaceallocator">IVMRSurfaceAllocatorNotify9::AdviseSurfaceAllocator</a> method in the <i>dwUserID</i> parameter.
     * @param {Pointer<VMR9AllocationInfo>} lpAllocInfo Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9allocationinfo">VMR9AllocationInfo</a> structure that contains a description of the surfaces to create.
     * @param {Pointer<Integer>} lpNumBuffers On input, specifies the number of surfaces to create. When the method returns, this parameter contains the number of buffers that were actually allocated.
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurfaceallocator9-initializedevice
     */
    InitializeDevice(dwUserID, lpAllocInfo, lpNumBuffers) {
        lpNumBuffersMarshal := lpNumBuffers is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", dwUserID, VMR9AllocationInfo.Ptr, lpAllocInfo, lpNumBuffersMarshal, lpNumBuffers, "HRESULT")
        return result
    }

    /**
     * The TerminateDevice method releases the Direct3D device.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Pointer} dwID Application-defined identifier. This value is the same value that the application passed to the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrsurfaceallocatornotify9-advisesurfaceallocator">IVMRSurfaceAllocatorNotify9::AdviseSurfaceAllocator</a> method in the <i>dwUserID</i> parameter.
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurfaceallocator9-terminatedevice
     */
    TerminateDevice(dwID) {
        result := ComCall(4, this, "ptr", dwID, "HRESULT")
        return result
    }

    /**
     * The GetSurface method gets a Direct3D surface from the allocator-presenter.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Pointer} dwUserID Application-defined identifier. This value is the same value that the application passed to the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrsurfaceallocatornotify9-advisesurfaceallocator">IVMRSurfaceAllocatorNotify9::AdviseSurfaceAllocator</a> method in the <i>dwUserID</i> parameter.
     * @param {Integer} SurfaceIndex Specifies the index of the surface to retrieve.
     * @param {Integer} SurfaceFlags Reserved.
     * @returns {IDirect3DSurface9} Receives a pointer to the <b>IDirect3DSurface9</b> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurfaceallocator9-getsurface
     */
    GetSurface(dwUserID, SurfaceIndex, SurfaceFlags) {
        result := ComCall(5, this, "ptr", dwUserID, "uint", SurfaceIndex, "uint", SurfaceFlags, "ptr*", &lplpSurface := 0, "HRESULT")
        return IDirect3DSurface9(lplpSurface)
    }

    /**
     * The AdviseNotify method provides the allocator-presenter with the VMR-9 filter's interface for notification callbacks.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {IVMRSurfaceAllocatorNotify9} lpIVMRSurfAllocNotify Specifies the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/nn-vmr9-ivmrsurfaceallocatornotify9">IVMRSurfaceAllocatorNotify9</a> interface that the allocator-presenter will use to pass notifications back to the VMR.
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurfaceallocator9-advisenotify
     */
    AdviseNotify(lpIVMRSurfAllocNotify) {
        result := ComCall(6, this, "ptr", lpIVMRSurfAllocNotify, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVMRSurfaceAllocator9.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeDevice := CallbackCreate(GetMethod(implObj, "InitializeDevice"), flags, 4)
        this.vtbl.TerminateDevice := CallbackCreate(GetMethod(implObj, "TerminateDevice"), flags, 2)
        this.vtbl.GetSurface := CallbackCreate(GetMethod(implObj, "GetSurface"), flags, 5)
        this.vtbl.AdviseNotify := CallbackCreate(GetMethod(implObj, "AdviseNotify"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeDevice)
        CallbackFree(this.vtbl.TerminateDevice)
        CallbackFree(this.vtbl.GetSurface)
        CallbackFree(this.vtbl.AdviseNotify)
    }
}
