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
     * 
     * @param {Pointer} dwUserID 
     * @param {Pointer<IVMRSurfaceAllocator>} lpIVRMSurfaceAllocator 
     * @returns {HRESULT} 
     */
    AdviseSurfaceAllocator(dwUserID, lpIVRMSurfaceAllocator) {
        result := ComCall(3, this, "ptr", dwUserID, "ptr", lpIVRMSurfaceAllocator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectDraw7>} lpDDrawDevice 
     * @param {HMONITOR} hMonitor 
     * @returns {HRESULT} 
     */
    SetDDrawDevice(lpDDrawDevice, hMonitor) {
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := ComCall(4, this, "ptr", lpDDrawDevice, "ptr", hMonitor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectDraw7>} lpDDrawDevice 
     * @param {HMONITOR} hMonitor 
     * @returns {HRESULT} 
     */
    ChangeDDrawDevice(lpDDrawDevice, hMonitor) {
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := ComCall(5, this, "ptr", lpDDrawDevice, "ptr", hMonitor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RestoreDDrawSurfaces() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} EventCode 
     * @param {Pointer} Param1 
     * @param {Pointer} Param2 
     * @returns {HRESULT} 
     */
    NotifyEvent(EventCode, Param1, Param2) {
        result := ComCall(7, this, "int", EventCode, "ptr", Param1, "ptr", Param2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {COLORREF} clrBorder 
     * @returns {HRESULT} 
     */
    SetBorderColor(clrBorder) {
        result := ComCall(8, this, "uint", clrBorder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
