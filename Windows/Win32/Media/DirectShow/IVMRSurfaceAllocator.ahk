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
     * The AllocateSurface method allocates a DirectDraw surface.
     * @param {Pointer} dwUserID An application-defined DWORD_PTR cookie that uniquely identifies this instance of the VMR for use in scenarios when one instance of the allocator-presenter is used with multiple VMR instances.
     * @param {Pointer<VMRALLOCATIONINFO>} lpAllocInfo Specifies the [VMRALLOCATIONINFO](/windows/desktop/api/strmif/ns-strmif-vmrallocationinfo) structure. See Remarks.
     * @param {Pointer<Integer>} lpdwActualBuffers [out] On input this parameter is used to request the number of buffers desired. On output it receives the actual number of buffers created.
     * @returns {IDirectDrawSurface7} Address of a pointer that receives the Direct3D surface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrsurfaceallocator-allocatesurface
     */
    AllocateSurface(dwUserID, lpAllocInfo, lpdwActualBuffers) {
        lpdwActualBuffersMarshal := lpdwActualBuffers is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", dwUserID, "ptr", lpAllocInfo, lpdwActualBuffersMarshal, lpdwActualBuffers, "ptr*", &lplpSurface := 0, "HRESULT")
        return IDirectDrawSurface7(lplpSurface)
    }

    /**
     * The FreeSurface method frees the allocated DirectDraw surface.
     * @param {Pointer} dwID An application-defined DWORD_PTR cookie that uniquely identifies this instance of the VMR for use in scenarios when one instance of the allocator-presenter is used with multiple VMR instances.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrsurfaceallocator-freesurface
     */
    FreeSurface(dwID) {
        result := ComCall(4, this, "ptr", dwID, "HRESULT")
        return result
    }

    /**
     * The PrepareSurface method prepares the DirectDraw surface to have the next video frame decoded into it.
     * @param {Pointer} dwUserID An application-defined DWORD_PTR cookie that uniquely identifies this instance of the VMR for use in scenarios when one instance of the allocator-presenter is used with multiple VMR instances.
     * @param {IDirectDrawSurface7} lpSurface Specifies the DirectDraw surface
     * @param {Integer} dwSurfaceFlags Double word containing the surface flags. See Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrsurfaceallocator-preparesurface
     */
    PrepareSurface(dwUserID, lpSurface, dwSurfaceFlags) {
        result := ComCall(5, this, "ptr", dwUserID, "ptr", lpSurface, "uint", dwSurfaceFlags, "HRESULT")
        return result
    }

    /**
     * The AdviseNotify method provides the allocator-presenter with the VMR-7 filter's interface for notification callbacks.
     * @param {IVMRSurfaceAllocatorNotify} lpIVMRSurfAllocNotify Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ivmrsurfaceallocatornotify">IVMRSurfaceAllocatorNotify</a> interface pointer that the allocator-presenter will use to pass notifications back to the VMR.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrsurfaceallocator-advisenotify
     */
    AdviseNotify(lpIVMRSurfAllocNotify) {
        result := ComCall(6, this, "ptr", lpIVMRSurfAllocNotify, "HRESULT")
        return result
    }
}
