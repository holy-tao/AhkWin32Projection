#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\DirectDraw\IDirectDrawSurface7.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRSurfaceAllocator interface is implemented by the default allocator-presenter for the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmrsurfaceallocator
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRSurfaceAllocator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRSurfaceAllocator
     * @type {Guid}
     */
    static IID => Guid("{31ce832e-4484-458b-8cca-f4d7e3db0b52}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AllocateSurface", "FreeSurface", "PrepareSurface", "AdviseNotify"]

    /**
     * 
     * @param {Pointer} dwUserID 
     * @param {Pointer<VMRALLOCATIONINFO>} lpAllocInfo 
     * @param {Pointer<Integer>} lpdwActualBuffers 
     * @returns {IDirectDrawSurface7} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurfaceallocator-allocatesurface
     */
    AllocateSurface(dwUserID, lpAllocInfo, lpdwActualBuffers) {
        lpdwActualBuffersMarshal := lpdwActualBuffers is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", dwUserID, "ptr", lpAllocInfo, lpdwActualBuffersMarshal, lpdwActualBuffers, "ptr*", &lplpSurface := 0, "HRESULT")
        return IDirectDrawSurface7(lplpSurface)
    }

    /**
     * 
     * @param {Pointer} dwID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurfaceallocator-freesurface
     */
    FreeSurface(dwID) {
        result := ComCall(4, this, "ptr", dwID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} dwUserID 
     * @param {IDirectDrawSurface7} lpSurface 
     * @param {Integer} dwSurfaceFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurfaceallocator-preparesurface
     */
    PrepareSurface(dwUserID, lpSurface, dwSurfaceFlags) {
        result := ComCall(5, this, "ptr", dwUserID, "ptr", lpSurface, "uint", dwSurfaceFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IVMRSurfaceAllocatorNotify} lpIVMRSurfAllocNotify 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurfaceallocator-advisenotify
     */
    AdviseNotify(lpIVMRSurfAllocNotify) {
        result := ComCall(6, this, "ptr", lpIVMRSurfAllocNotify, "HRESULT")
        return result
    }
}
