#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVMRSurfaceAllocator9.ahk

/**
 * The IVMRSurfaceAllocatorEx9 interface provides a way for custom allocator-presenters to control where the Video Mixing Renderer Filter 9 (VMR-9) draws the composited image.
 * @remarks
 * 
 * Include DShow.h and D3d9.h before Vmr9.h.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/nn-vmr9-ivmrsurfaceallocatorex9
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRSurfaceAllocatorEx9 extends IVMRSurfaceAllocator9{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRSurfaceAllocatorEx9
     * @type {Guid}
     */
    static IID => Guid("{6de9a68a-a928-4522-bf57-655ae3866456}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSurfaceEx"]

    /**
     * 
     * @param {Pointer} dwUserID 
     * @param {Integer} SurfaceIndex 
     * @param {Integer} SurfaceFlags 
     * @param {Pointer<IDirect3DSurface9>} lplpSurface 
     * @param {Pointer<RECT>} lprcDst 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrsurfaceallocatorex9-getsurfaceex
     */
    GetSurfaceEx(dwUserID, SurfaceIndex, SurfaceFlags, lplpSurface, lprcDst) {
        result := ComCall(7, this, "ptr", dwUserID, "uint", SurfaceIndex, "uint", SurfaceFlags, "ptr*", lplpSurface, "ptr", lprcDst, "HRESULT")
        return result
    }
}
