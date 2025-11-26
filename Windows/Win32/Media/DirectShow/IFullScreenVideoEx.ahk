#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
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
     * The SetAcceleratorTable method specifies an accelerator table that will be used to translate keyboard messages. The Full Screen Renderer filter does not support this method.
     * @param {HWND} hwnd Handle of the window that will receive the translated messages.
     * @param {HACCEL} hAccel Handle to the accelerator table.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-ifullscreenvideoex-setacceleratortable
     */
    SetAcceleratorTable(hwnd, hAccel) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        hAccel := hAccel is Win32Handle ? NumGet(hAccel, "ptr") : hAccel

        result := ComCall(20, this, "ptr", hwnd, "ptr", hAccel, "HRESULT")
        return result
    }

    /**
     * The GetAcceleratorTable method retrieves the accelerator table currently being used to translate keyboard messages. The Full Screen Renderer filter does not support this method.
     * @param {Pointer<HACCEL>} phAccel Pointer to a variable that receives a handle to the accelerator table.
     * @returns {HWND} Pointer to a variable that receives a window handle. The window receives translated messages.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-ifullscreenvideoex-getacceleratortable
     */
    GetAcceleratorTable(phAccel) {
        phwnd := HWND()
        result := ComCall(21, this, "ptr", phwnd, "ptr", phAccel, "HRESULT")
        return phwnd
    }

    /**
     * The KeepPixelAspectRatio method specifies whether to maintain the pixel aspect ratio. The Full Screen Renderer filter does not support this method; it always maintains the pixel aspect ratio.
     * @param {Integer} KeepAspect Specifies whether to maintain the aspect ratio. The value must be OATRUE or OAFALSE.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-ifullscreenvideoex-keeppixelaspectratio
     */
    KeepPixelAspectRatio(KeepAspect) {
        result := ComCall(22, this, "int", KeepAspect, "HRESULT")
        return result
    }

    /**
     * The IsKeepPixelAspectRatio method queries whether the pixel aspect ratio is maintained. The Full Screen Renderer filter does not support this method; it always maintains the pixel aspect ratio.
     * @returns {Integer} Pointer to a variable that receives the value OATRUE or OAFALSE.
     * @see https://docs.microsoft.com/windows/win32/api//amvideo/nf-amvideo-ifullscreenvideoex-iskeeppixelaspectratio
     */
    IsKeepPixelAspectRatio() {
        result := ComCall(23, this, "int*", &pKeepAspect := 0, "HRESULT")
        return pKeepAspect
    }
}
