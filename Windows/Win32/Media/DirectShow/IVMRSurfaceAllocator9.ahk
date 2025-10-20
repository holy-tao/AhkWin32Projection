#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer} dwUserID 
     * @param {Pointer<VMR9AllocationInfo>} lpAllocInfo 
     * @param {Pointer<UInt32>} lpNumBuffers 
     * @returns {HRESULT} 
     */
    InitializeDevice(dwUserID, lpAllocInfo, lpNumBuffers) {
        result := ComCall(3, this, "ptr", dwUserID, "ptr", lpAllocInfo, "uint*", lpNumBuffers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} dwID 
     * @returns {HRESULT} 
     */
    TerminateDevice(dwID) {
        result := ComCall(4, this, "ptr", dwID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} dwUserID 
     * @param {Integer} SurfaceIndex 
     * @param {Integer} SurfaceFlags 
     * @param {Pointer<IDirect3DSurface9>} lplpSurface 
     * @returns {HRESULT} 
     */
    GetSurface(dwUserID, SurfaceIndex, SurfaceFlags, lplpSurface) {
        result := ComCall(5, this, "ptr", dwUserID, "uint", SurfaceIndex, "uint", SurfaceFlags, "ptr", lplpSurface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVMRSurfaceAllocatorNotify9>} lpIVMRSurfAllocNotify 
     * @returns {HRESULT} 
     */
    AdviseNotify(lpIVMRSurfAllocNotify) {
        result := ComCall(6, this, "ptr", lpIVMRSurfAllocNotify, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
