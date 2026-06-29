#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VMRALLOCATIONINFO.ahk" { VMRALLOCATIONINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\DirectDraw\IDirectDrawSurface7.ahk" { IDirectDrawSurface7 }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IVMRSurfaceAllocatorNotify.ahk" { IVMRSurfaceAllocatorNotify }

/**
 * The IVMRSurfaceAllocator interface is implemented by the default allocator-presenter for the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ivmrsurfaceallocator
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRSurfaceAllocator extends IUnknown {
    /**
     * The interface identifier for IVMRSurfaceAllocator
     * @type {Guid}
     */
    static IID := Guid("{31ce832e-4484-458b-8cca-f4d7e3db0b52}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRSurfaceAllocator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AllocateSurface : IntPtr
        FreeSurface     : IntPtr
        PrepareSurface  : IntPtr
        AdviseNotify    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRSurfaceAllocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The AllocateSurface method allocates a DirectDraw surface.
     * @remarks
     * Before calling <b>AllocateSurface</b> explicitly, a client application should call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrsurfaceallocator-freesurface">IVMRSurfaceAllocator::FreeSurface</a> to be sure that the DirectDraw decoding surface front buffer is <b>NULL</b>. If it is not <b>NULL</b> at the time an application calls <b>AllocateSurface</b>, the debug version of quartz.dll will cause an assertion.
     * 
     * When implementing this method in a custom allocator-presenter, you must examine the value of <i>lpAllocInfo</i>-&gt;lpHdr-&gt;biBitCount. If biBitCount is zero, then you must set it to the pixel depth for the current display. If BiBitCount is left at zero, the surface allocation will fail and a new (default) VMR will be created.
     * @param {Pointer} dwUserID An application-defined DWORD_PTR cookie that uniquely identifies this instance of the VMR for use in scenarios when one instance of the allocator-presenter is used with multiple VMR instances.
     * @param {Pointer<VMRALLOCATIONINFO>} lpAllocInfo Specifies the [VMRALLOCATIONINFO](/windows/desktop/api/strmif/ns-strmif-vmrallocationinfo) structure. See Remarks.
     * @param {Pointer<Integer>} lpdwActualBuffers [out] On input this parameter is used to request the number of buffers desired. On output it receives the actual number of buffers created.
     * @returns {IDirectDrawSurface7} Address of a pointer that receives the Direct3D surface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurfaceallocator-allocatesurface
     */
    AllocateSurface(dwUserID, lpAllocInfo, lpdwActualBuffers) {
        lpdwActualBuffersMarshal := lpdwActualBuffers is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", dwUserID, VMRALLOCATIONINFO.Ptr, lpAllocInfo, lpdwActualBuffersMarshal, lpdwActualBuffers, "ptr*", &lplpSurface := 0, "HRESULT")
        return IDirectDrawSurface7(lplpSurface)
    }

    /**
     * The FreeSurface method frees the allocated DirectDraw surface.
     * @param {Pointer} dwID An application-defined DWORD_PTR cookie that uniquely identifies this instance of the VMR for use in scenarios when one instance of the allocator-presenter is used with multiple VMR instances.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurfaceallocator-freesurface
     */
    FreeSurface(dwID) {
        result := ComCall(4, this, "ptr", dwID, "HRESULT")
        return result
    }

    /**
     * The PrepareSurface method prepares the DirectDraw surface to have the next video frame decoded into it.
     * @remarks
     * The only flag that the VMR currently checks here is AM_GBF_NOTASYNCPOINT (0x00000002), which indicates that you are not going to fill this buffer with a sync point (keyframe).
     * @param {Pointer} dwUserID An application-defined DWORD_PTR cookie that uniquely identifies this instance of the VMR for use in scenarios when one instance of the allocator-presenter is used with multiple VMR instances.
     * @param {IDirectDrawSurface7} lpSurface Specifies the DirectDraw surface
     * @param {Integer} dwSurfaceFlags Double word containing the surface flags. See Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurfaceallocator-preparesurface
     */
    PrepareSurface(dwUserID, lpSurface, dwSurfaceFlags) {
        result := ComCall(5, this, "ptr", dwUserID, "ptr", lpSurface, "uint", dwSurfaceFlags, "HRESULT")
        return result
    }

    /**
     * The AdviseNotify method provides the allocator-presenter with the VMR-7 filter's interface for notification callbacks.
     * @param {IVMRSurfaceAllocatorNotify} lpIVMRSurfAllocNotify Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ivmrsurfaceallocatornotify">IVMRSurfaceAllocatorNotify</a> interface pointer that the allocator-presenter will use to pass notifications back to the VMR.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurfaceallocator-advisenotify
     */
    AdviseNotify(lpIVMRSurfAllocNotify) {
        result := ComCall(6, this, "ptr", lpIVMRSurfAllocNotify, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVMRSurfaceAllocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AllocateSurface := CallbackCreate(GetMethod(implObj, "AllocateSurface"), flags, 5)
        this.vtbl.FreeSurface := CallbackCreate(GetMethod(implObj, "FreeSurface"), flags, 2)
        this.vtbl.PrepareSurface := CallbackCreate(GetMethod(implObj, "PrepareSurface"), flags, 4)
        this.vtbl.AdviseNotify := CallbackCreate(GetMethod(implObj, "AdviseNotify"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AllocateSurface)
        CallbackFree(this.vtbl.FreeSurface)
        CallbackFree(this.vtbl.PrepareSurface)
        CallbackFree(this.vtbl.AdviseNotify)
    }
}
