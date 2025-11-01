#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRWindowlessControl9 interface controls how the Video Mixing Renderer Filter 9 (VMR-9) renders a video stream within a container window.
 * @remarks
 * 
  * The VMR-9 supports this interface in windowless and renderless modes only. In windowed mode, <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> returns <b>E_NOINTERFACE</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/vmr-modes-of-operation">VMR Modes of Operation</a>.
  * 
  * Include DShow.h and D3d9.h before Vmr9.h.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/nn-vmr9-ivmrwindowlesscontrol9
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRWindowlessControl9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRWindowlessControl9
     * @type {Guid}
     */
    static IID => Guid("{8f537d09-f85e-4414-b23b-502e54c79927}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNativeVideoSize", "GetMinIdealVideoSize", "GetMaxIdealVideoSize", "SetVideoPosition", "GetVideoPosition", "GetAspectRatioMode", "SetAspectRatioMode", "SetVideoClippingWindow", "RepaintVideo", "DisplayModeChanged", "GetCurrentImage", "SetBorderColor", "GetBorderColor"]

    /**
     * 
     * @param {Pointer<Integer>} lpWidth 
     * @param {Pointer<Integer>} lpHeight 
     * @param {Pointer<Integer>} lpARWidth 
     * @param {Pointer<Integer>} lpARHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-getnativevideosize
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-getminidealvideosize
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-getmaxidealvideosize
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-setvideoposition
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-getvideoposition
     */
    GetVideoPosition(lpSRCRect, lpDSTRect) {
        result := ComCall(7, this, "ptr", lpSRCRect, "ptr", lpDSTRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpAspectRatioMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-getaspectratiomode
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-setaspectratiomode
     */
    SetAspectRatioMode(AspectRatioMode) {
        result := ComCall(9, this, "uint", AspectRatioMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-setvideoclippingwindow
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-repaintvideo
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-displaymodechanged
     */
    DisplayModeChanged() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} lpDib 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-getcurrentimage
     */
    GetCurrentImage(lpDib) {
        result := ComCall(13, this, "ptr*", lpDib, "HRESULT")
        return result
    }

    /**
     * 
     * @param {COLORREF} Clr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-setbordercolor
     */
    SetBorderColor(Clr) {
        result := ComCall(14, this, "uint", Clr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COLORREF>} lpClr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-getbordercolor
     */
    GetBorderColor(lpClr) {
        result := ComCall(15, this, "ptr", lpClr, "HRESULT")
        return result
    }
}
