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
     * 
     * @param {HWND} hwnd 
     * @param {HACCEL} hAccel 
     * @returns {HRESULT} 
     */
    SetAcceleratorTable(hwnd, hAccel) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        hAccel := hAccel is Win32Handle ? NumGet(hAccel, "ptr") : hAccel

        result := ComCall(20, this, "ptr", hwnd, "ptr", hAccel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} phwnd 
     * @param {Pointer<HACCEL>} phAccel 
     * @returns {HRESULT} 
     */
    GetAcceleratorTable(phwnd, phAccel) {
        result := ComCall(21, this, "ptr", phwnd, "ptr", phAccel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} KeepAspect 
     * @returns {HRESULT} 
     */
    KeepPixelAspectRatio(KeepAspect) {
        result := ComCall(22, this, "int", KeepAspect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pKeepAspect 
     * @returns {HRESULT} 
     */
    IsKeepPixelAspectRatio(pKeepAspect) {
        result := ComCall(23, this, "int*", pKeepAspect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
