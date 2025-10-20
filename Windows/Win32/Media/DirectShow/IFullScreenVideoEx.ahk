#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFullScreenVideo.ahk

/**
 * The IFullScreenVideoEx interface is implemented on the Full Screen Renderer filter, which provides full-screen video rendering on older hardware.
 * @see https://docs.microsoft.com/windows/win32/api//amvideo/nn-amvideo-ifullscreenvideoex
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IFullScreenVideoEx extends IFullScreenVideo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFullScreenVideoEx
     * @type {Guid}
     */
    static IID => Guid("{53479470-f1dd-11cf-bc42-00aa00ac74f6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAcceleratorTable", "GetAcceleratorTable", "KeepPixelAspectRatio", "IsKeepPixelAspectRatio"]

    /**
     * 
     * @param {HWND} hwnd 
     * @param {HACCEL} hAccel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-ifullscreenvideoex-setacceleratortable
     */
    SetAcceleratorTable(hwnd, hAccel) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        hAccel := hAccel is Win32Handle ? NumGet(hAccel, "ptr") : hAccel

        result := ComCall(20, this, "ptr", hwnd, "ptr", hAccel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} phwnd 
     * @param {Pointer<HACCEL>} phAccel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-ifullscreenvideoex-getacceleratortable
     */
    GetAcceleratorTable(phwnd, phAccel) {
        result := ComCall(21, this, "ptr", phwnd, "ptr", phAccel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} KeepAspect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-ifullscreenvideoex-keeppixelaspectratio
     */
    KeepPixelAspectRatio(KeepAspect) {
        result := ComCall(22, this, "int", KeepAspect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pKeepAspect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-ifullscreenvideoex-iskeeppixelaspectratio
     */
    IsKeepPixelAspectRatio(pKeepAspect) {
        result := ComCall(23, this, "int*", pKeepAspect, "HRESULT")
        return result
    }
}
