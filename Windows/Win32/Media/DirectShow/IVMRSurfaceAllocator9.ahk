#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Direct3D9\IDirect3DSurface9.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRSurfaceAllocator9 interface is implemented by the default allocator-presenter for the Video Mixing Renderer Filter 9 (VMR-9).
 * @remarks
 * 
 * Include DShow.h and D3d9.h before Vmr9.h.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/nn-vmr9-ivmrsurfaceallocator9
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRSurfaceAllocator9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRSurfaceAllocator9
     * @type {Guid}
     */
    static IID => Guid("{8d5148ea-3f5d-46cf-9df1-d1b896eedb1f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeDevice", "TerminateDevice", "GetSurface", "AdviseNotify"]

    /**
     * The InitializeDevice method is called by the Video Mixing Renderer 9 (VMR-9) when it needs the allocator-presenter to allocate surfaces.
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
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrsurfaceallocator9-initializedevice
     */
    InitializeDevice(dwUserID, lpAllocInfo, lpNumBuffers) {
        lpNumBuffersMarshal := lpNumBuffers is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", dwUserID, "ptr", lpAllocInfo, lpNumBuffersMarshal, lpNumBuffers, "HRESULT")
        return result
    }

    /**
     * The TerminateDevice method releases the Direct3D device.
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
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrsurfaceallocator9-terminatedevice
     */
    TerminateDevice(dwID) {
        result := ComCall(4, this, "ptr", dwID, "HRESULT")
        return result
    }

    /**
     * The GetSurface method gets a Direct3D surface from the allocator-presenter.
     * @param {Pointer} dwUserID Application-defined identifier. This value is the same value that the application passed to the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrsurfaceallocatornotify9-advisesurfaceallocator">IVMRSurfaceAllocatorNotify9::AdviseSurfaceAllocator</a> method in the <i>dwUserID</i> parameter.
     * @param {Integer} SurfaceIndex Specifies the index of the surface to retrieve.
     * @param {Integer} SurfaceFlags Reserved.
     * @returns {IDirect3DSurface9} Receives a pointer to the <b>IDirect3DSurface9</b> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrsurfaceallocator9-getsurface
     */
    GetSurface(dwUserID, SurfaceIndex, SurfaceFlags) {
        result := ComCall(5, this, "ptr", dwUserID, "uint", SurfaceIndex, "uint", SurfaceFlags, "ptr*", &lplpSurface := 0, "HRESULT")
        return IDirect3DSurface9(lplpSurface)
    }

    /**
     * The AdviseNotify method provides the allocator-presenter with the VMR-9 filter's interface for notification callbacks.
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
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrsurfaceallocator9-advisenotify
     */
    AdviseNotify(lpIVMRSurfAllocNotify) {
        result := ComCall(6, this, "ptr", lpIVMRSurfAllocNotify, "HRESULT")
        return result
    }
}
