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
     * 
     * @param {Pointer} dwUserID 
     * @param {Pointer<VMR9AllocationInfo>} lpAllocInfo 
     * @param {Pointer<Integer>} lpNumBuffers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurfaceallocator9-initializedevice
     */
    InitializeDevice(dwUserID, lpAllocInfo, lpNumBuffers) {
        lpNumBuffersMarshal := lpNumBuffers is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", dwUserID, "ptr", lpAllocInfo, lpNumBuffersMarshal, lpNumBuffers, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} dwID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurfaceallocator9-terminatedevice
     */
    TerminateDevice(dwID) {
        result := ComCall(4, this, "ptr", dwID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} dwUserID 
     * @param {Integer} SurfaceIndex 
     * @param {Integer} SurfaceFlags 
     * @returns {IDirect3DSurface9} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurfaceallocator9-getsurface
     */
    GetSurface(dwUserID, SurfaceIndex, SurfaceFlags) {
        result := ComCall(5, this, "ptr", dwUserID, "uint", SurfaceIndex, "uint", SurfaceFlags, "ptr*", &lplpSurface := 0, "HRESULT")
        return IDirect3DSurface9(lplpSurface)
    }

    /**
     * 
     * @param {IVMRSurfaceAllocatorNotify9} lpIVMRSurfAllocNotify 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurfaceallocator9-advisenotify
     */
    AdviseNotify(lpIVMRSurfAllocNotify) {
        result := ComCall(6, this, "ptr", lpIVMRSurfAllocNotify, "HRESULT")
        return result
    }
}
