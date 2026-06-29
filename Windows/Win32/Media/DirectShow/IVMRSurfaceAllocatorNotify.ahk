#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Graphics\DirectDraw\IDirectDraw7.ahk" { IDirectDraw7 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IVMRSurfaceAllocator.ahk" { IVMRSurfaceAllocator }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Graphics\Gdi\HMONITOR.ahk" { HMONITOR }

/**
 * The IVMRSurfaceAllocatorNotify interface is implemented by the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ivmrsurfaceallocatornotify
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRSurfaceAllocatorNotify extends IUnknown {
    /**
     * The interface identifier for IVMRSurfaceAllocatorNotify
     * @type {Guid}
     */
    static IID := Guid("{aada05a8-5a4e-4729-af0b-cea27aed51e2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRSurfaceAllocatorNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AdviseSurfaceAllocator : IntPtr
        SetDDrawDevice         : IntPtr
        ChangeDDrawDevice      : IntPtr
        RestoreDDrawSurfaces   : IntPtr
        NotifyEvent            : IntPtr
        SetBorderColor         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRSurfaceAllocatorNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The AdviseSurfaceAllocator method is called by an application to instruct the VMR to use a custom allocator-presenter.
     * @remarks
     * The method will cause the default allocator-presenter to be uninstalled and destroyed, and replaced with the specified new component. The new component must also support the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ivmrimagepresenter">IVMRImagePresenter</a> interface.
     * 
     * This method can be called only once in the lifetime of the VMR. The VMR continues to use the allocator-presenter until the VMR is itself deleted. When the VMR is finally released, it releases its reference count on the custom allocator-presenter object, which allows that object to be freed.
     * @param {Pointer} dwUserID An application-defined DWORD_PTR that uniquely identifies this instance of the VMR in scenarios when multiple instances of the VMR are being used with a single instance of an allocator-presenter.
     * @param {IVMRSurfaceAllocator} lpIVRMSurfaceAllocator Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ivmrsurfaceallocator">IVMRSurfaceAllocator</a> interface on the new allocator-presenter. If this value is <b>NULL</b>, then the VMR will release the client allocator-presenter and restore its default allocator-presenter.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurfaceallocatornotify-advisesurfaceallocator
     */
    AdviseSurfaceAllocator(dwUserID, lpIVRMSurfaceAllocator) {
        result := ComCall(3, this, "ptr", dwUserID, "ptr", lpIVRMSurfaceAllocator, "HRESULT")
        return result
    }

    /**
     * The SetDDrawDevice method sets the initial DirectDraw device and monitor to be used for video playback.
     * @remarks
     * The VMR needs to know which DirectDraw device is being used at any given time in order to associate the Direct3D surfaces being created in the mixer component with that device.
     * @param {IDirectDraw7} lpDDrawDevice Specifies the DirectDraw device.
     * @param {HMONITOR} _hMonitor Handle to the monitor associated with the DirectDraw device.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurfaceallocatornotify-setddrawdevice
     */
    SetDDrawDevice(lpDDrawDevice, _hMonitor) {
        result := ComCall(4, this, "ptr", lpDDrawDevice, HMONITOR, _hMonitor, "HRESULT")
        return result
    }

    /**
     * The ChangeDDrawDevice method notifies the VMR that the DirectDraw playback device has changed. For example, on a multi-monitor system, the user has moved the video rectangle from one monitor to another.
     * @remarks
     * The VMR needs to know which DirectDraw device is being used at any given time in order to associate the Direct3D surfaces being created in the mixer component with that device.
     * @param {IDirectDraw7} lpDDrawDevice Specifies the DirectDraw device.
     * @param {HMONITOR} _hMonitor Specifies the handle to the monitor associated with the DirectDraw device.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurfaceallocatornotify-changeddrawdevice
     */
    ChangeDDrawDevice(lpDDrawDevice, _hMonitor) {
        result := ComCall(5, this, "ptr", lpDDrawDevice, HMONITOR, _hMonitor, "HRESULT")
        return result
    }

    /**
     * The RestoreDDrawSurfaces method notifies the VMR that a DirectDraw surface &quot;loss&quot; has been detected.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurfaceallocatornotify-restoreddrawsurfaces
     */
    RestoreDDrawSurfaces() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * The NotifyEvent method is called by the allocator-presenter to inform the VMR of any significant DirectShow events during the allocation or presentation processes.
     * @remarks
     * The VMR provides the allocator-presenter with a pointer to this interface in a call to <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrsurfaceallocator-advisenotify">IVMRSurfaceAllocator::AdviseNotify</a>. When the allocator-presenter calls this method and specifies some regular DirectShow event, such as EC_ERRORABORT or EC_VMR_RENDERDEVICE_SET, the VMR will pass the event to the filter graph manager.
     * @param {Integer} EventCode Specifies the event code.
     * @param {Pointer} Param1 Specifies Param1 of the event code.
     * @param {Pointer} Param2 Specifies Param2 of the event code.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurfaceallocatornotify-notifyevent
     */
    NotifyEvent(EventCode, Param1, Param2) {
        result := ComCall(7, this, "int", EventCode, "ptr", Param1, "ptr", Param2, "HRESULT")
        return result
    }

    /**
     * The SetBorderColor method specifies to the VMR which color to use in areas of the display rectangle which are not being used for video, for example when the video is letterboxed.
     * @param {COLORREF} clrBorder Specifies the border color.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurfaceallocatornotify-setbordercolor
     */
    SetBorderColor(clrBorder) {
        result := ComCall(8, this, COLORREF, clrBorder, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVMRSurfaceAllocatorNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AdviseSurfaceAllocator := CallbackCreate(GetMethod(implObj, "AdviseSurfaceAllocator"), flags, 3)
        this.vtbl.SetDDrawDevice := CallbackCreate(GetMethod(implObj, "SetDDrawDevice"), flags, 3)
        this.vtbl.ChangeDDrawDevice := CallbackCreate(GetMethod(implObj, "ChangeDDrawDevice"), flags, 3)
        this.vtbl.RestoreDDrawSurfaces := CallbackCreate(GetMethod(implObj, "RestoreDDrawSurfaces"), flags, 1)
        this.vtbl.NotifyEvent := CallbackCreate(GetMethod(implObj, "NotifyEvent"), flags, 4)
        this.vtbl.SetBorderColor := CallbackCreate(GetMethod(implObj, "SetBorderColor"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AdviseSurfaceAllocator)
        CallbackFree(this.vtbl.SetDDrawDevice)
        CallbackFree(this.vtbl.ChangeDDrawDevice)
        CallbackFree(this.vtbl.RestoreDDrawSurfaces)
        CallbackFree(this.vtbl.NotifyEvent)
        CallbackFree(this.vtbl.SetBorderColor)
    }
}
