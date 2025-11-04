#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRWindowlessControl interface controls how the Video Mixing Renderer Filter 7 (VMR-7) renders a video stream within a container window.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmrwindowlesscontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRWindowlessControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRWindowlessControl
     * @type {Guid}
     */
    static IID => Guid("{0eb1088c-4dcd-46f0-878f-39dae86a51b7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNativeVideoSize", "GetMinIdealVideoSize", "GetMaxIdealVideoSize", "SetVideoPosition", "GetVideoPosition", "GetAspectRatioMode", "SetAspectRatioMode", "SetVideoClippingWindow", "RepaintVideo", "DisplayModeChanged", "GetCurrentImage", "SetBorderColor", "GetBorderColor", "SetColorKey", "GetColorKey"]

    /**
     * 
     * @param {Pointer<Integer>} lpWidth 
     * @param {Pointer<Integer>} lpHeight 
     * @param {Pointer<Integer>} lpARWidth 
     * @param {Pointer<Integer>} lpARHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-getnativevideosize
     */
    GetNativeVideoSize(lpWidth, lpHeight, lpARWidth, lpARHeight) {
        lpWidthMarshal := lpWidth is VarRef ? "int*" : "ptr"
        lpHeightMarshal := lpHeight is VarRef ? "int*" : "ptr"
        lpARWidthMarshal := lpARWidth is VarRef ? "int*" : "ptr"
        lpARHeightMarshal := lpARHeight is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, lpWidthMarshal, lpWidth, lpHeightMarshal, lpHeight, lpARWidthMarshal, lpARWidth, lpARHeightMarshal, lpARHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpWidth 
     * @param {Pointer<Integer>} lpHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-getminidealvideosize
     */
    GetMinIdealVideoSize(lpWidth, lpHeight) {
        lpWidthMarshal := lpWidth is VarRef ? "int*" : "ptr"
        lpHeightMarshal := lpHeight is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, lpWidthMarshal, lpWidth, lpHeightMarshal, lpHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpWidth 
     * @param {Pointer<Integer>} lpHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-getmaxidealvideosize
     */
    GetMaxIdealVideoSize(lpWidth, lpHeight) {
        lpWidthMarshal := lpWidth is VarRef ? "int*" : "ptr"
        lpHeightMarshal := lpHeight is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, lpWidthMarshal, lpWidth, lpHeightMarshal, lpHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} lpSRCRect 
     * @param {Pointer<RECT>} lpDSTRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-setvideoposition
     */
    SetVideoPosition(lpSRCRect, lpDSTRect) {
        result := ComCall(6, this, "ptr", lpSRCRect, "ptr", lpDSTRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} lpSRCRect 
     * @param {Pointer<RECT>} lpDSTRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-getvideoposition
     */
    GetVideoPosition(lpSRCRect, lpDSTRect) {
        result := ComCall(7, this, "ptr", lpSRCRect, "ptr", lpDSTRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpAspectRatioMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-getaspectratiomode
     */
    GetAspectRatioMode(lpAspectRatioMode) {
        lpAspectRatioModeMarshal := lpAspectRatioMode is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, lpAspectRatioModeMarshal, lpAspectRatioMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} AspectRatioMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-setaspectratiomode
     */
    SetAspectRatioMode(AspectRatioMode) {
        result := ComCall(9, this, "uint", AspectRatioMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-setvideoclippingwindow
     */
    SetVideoClippingWindow(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(10, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {HDC} hdc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-repaintvideo
     */
    RepaintVideo(hwnd, hdc) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(11, this, "ptr", hwnd, "ptr", hdc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-displaymodechanged
     */
    DisplayModeChanged() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} lpDib 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-getcurrentimage
     */
    GetCurrentImage(lpDib) {
        lpDibMarshal := lpDib is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, lpDibMarshal, lpDib, "HRESULT")
        return result
    }

    /**
     * 
     * @param {COLORREF} Clr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-setbordercolor
     */
    SetBorderColor(Clr) {
        result := ComCall(14, this, "uint", Clr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COLORREF>} lpClr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-getbordercolor
     */
    GetBorderColor(lpClr) {
        result := ComCall(15, this, "ptr", lpClr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {COLORREF} Clr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-setcolorkey
     */
    SetColorKey(Clr) {
        result := ComCall(16, this, "uint", Clr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COLORREF>} lpClr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-getcolorkey
     */
    GetColorKey(lpClr) {
        result := ComCall(17, this, "ptr", lpClr, "HRESULT")
        return result
    }
}
