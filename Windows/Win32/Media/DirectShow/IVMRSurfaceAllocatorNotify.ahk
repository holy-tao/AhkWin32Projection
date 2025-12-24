#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRSurfaceAllocatorNotify interface is implemented by the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmrsurfaceallocatornotify
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRSurfaceAllocatorNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRSurfaceAllocatorNotify
     * @type {Guid}
     */
    static IID => Guid("{aada05a8-5a4e-4729-af0b-cea27aed51e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AdviseSurfaceAllocator", "SetDDrawDevice", "ChangeDDrawDevice", "RestoreDDrawSurfaces", "NotifyEvent", "SetBorderColor"]

    /**
     * The AdviseSurfaceAllocator method is called by an application to instruct the VMR to use a custom allocator-presenter.
     * @param {Pointer} dwUserID An application-defined DWORD_PTR that uniquely identifies this instance of the VMR in scenarios when multiple instances of the VMR are being used with a single instance of an allocator-presenter.
     * @param {IVMRSurfaceAllocator} lpIVRMSurfaceAllocator Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ivmrsurfaceallocator">IVMRSurfaceAllocator</a> interface on the new allocator-presenter. If this value is <b>NULL</b>, then the VMR will release the client allocator-presenter and restore its default allocator-presenter.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrsurfaceallocatornotify-advisesurfaceallocator
     */
    AdviseSurfaceAllocator(dwUserID, lpIVRMSurfaceAllocator) {
        result := ComCall(3, this, "ptr", dwUserID, "ptr", lpIVRMSurfaceAllocator, "HRESULT")
        return result
    }

    /**
     * The SetDDrawDevice method sets the initial DirectDraw device and monitor to be used for video playback.
     * @param {IDirectDraw7} lpDDrawDevice Specifies the DirectDraw device.
     * @param {HMONITOR} hMonitor Handle to the monitor associated with the DirectDraw device.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrsurfaceallocatornotify-setddrawdevice
     */
    SetDDrawDevice(lpDDrawDevice, hMonitor) {
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := ComCall(4, this, "ptr", lpDDrawDevice, "ptr", hMonitor, "HRESULT")
        return result
    }

    /**
     * The ChangeDDrawDevice method notifies the VMR that the DirectDraw playback device has changed. For example, on a multi-monitor system, the user has moved the video rectangle from one monitor to another.
     * @param {IDirectDraw7} lpDDrawDevice Specifies the DirectDraw device.
     * @param {HMONITOR} hMonitor Specifies the handle to the monitor associated with the DirectDraw device.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrsurfaceallocatornotify-changeddrawdevice
     */
    ChangeDDrawDevice(lpDDrawDevice, hMonitor) {
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := ComCall(5, this, "ptr", lpDDrawDevice, "ptr", hMonitor, "HRESULT")
        return result
    }

    /**
     * The RestoreDDrawSurfaces method notifies the VMR that a DirectDraw surface &quot;loss&quot; has been detected.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrsurfaceallocatornotify-restoreddrawsurfaces
     */
    RestoreDDrawSurfaces() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * The NotifyEvent method is called by the allocator-presenter to inform the VMR of any significant DirectShow events during the allocation or presentation processes.
     * @param {Integer} EventCode Specifies the event code.
     * @param {Pointer} Param1 Specifies Param1 of the event code.
     * @param {Pointer} Param2 Specifies Param2 of the event code.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrsurfaceallocatornotify-notifyevent
     */
    NotifyEvent(EventCode, Param1, Param2) {
        result := ComCall(7, this, "int", EventCode, "ptr", Param1, "ptr", Param2, "HRESULT")
        return result
    }

    /**
     * The SetBorderColor method specifies to the VMR which color to use in areas of the display rectangle which are not being used for video, for example when the video is letterboxed.
     * @param {COLORREF} clrBorder Specifies the border color.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrsurfaceallocatornotify-setbordercolor
     */
    SetBorderColor(clrBorder) {
        result := ComCall(8, this, "uint", clrBorder, "HRESULT")
        return result
    }
}
