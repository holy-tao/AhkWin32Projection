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
     * 
     * @param {Pointer} dwUserID 
     * @param {IVMRSurfaceAllocator} lpIVRMSurfaceAllocator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurfaceallocatornotify-advisesurfaceallocator
     */
    AdviseSurfaceAllocator(dwUserID, lpIVRMSurfaceAllocator) {
        result := ComCall(3, this, "ptr", dwUserID, "ptr", lpIVRMSurfaceAllocator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectDraw7} lpDDrawDevice 
     * @param {HMONITOR} hMonitor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurfaceallocatornotify-setddrawdevice
     */
    SetDDrawDevice(lpDDrawDevice, hMonitor) {
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := ComCall(4, this, "ptr", lpDDrawDevice, "ptr", hMonitor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectDraw7} lpDDrawDevice 
     * @param {HMONITOR} hMonitor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurfaceallocatornotify-changeddrawdevice
     */
    ChangeDDrawDevice(lpDDrawDevice, hMonitor) {
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := ComCall(5, this, "ptr", lpDDrawDevice, "ptr", hMonitor, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurfaceallocatornotify-restoreddrawsurfaces
     */
    RestoreDDrawSurfaces() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} EventCode 
     * @param {Pointer} Param1 
     * @param {Pointer} Param2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurfaceallocatornotify-notifyevent
     */
    NotifyEvent(EventCode, Param1, Param2) {
        result := ComCall(7, this, "int", EventCode, "ptr", Param1, "ptr", Param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {COLORREF} clrBorder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurfaceallocatornotify-setbordercolor
     */
    SetBorderColor(clrBorder) {
        result := ComCall(8, this, "uint", clrBorder, "HRESULT")
        return result
    }
}
