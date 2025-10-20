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
     * 
     * @param {Pointer<Int32>} lpWidth 
     * @param {Pointer<Int32>} lpHeight 
     * @param {Pointer<Int32>} lpARWidth 
     * @param {Pointer<Int32>} lpARHeight 
     * @returns {HRESULT} 
     */
    GetNativeVideoSize(lpWidth, lpHeight, lpARWidth, lpARHeight) {
        result := ComCall(3, this, "int*", lpWidth, "int*", lpHeight, "int*", lpARWidth, "int*", lpARHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lpWidth 
     * @param {Pointer<Int32>} lpHeight 
     * @returns {HRESULT} 
     */
    GetMinIdealVideoSize(lpWidth, lpHeight) {
        result := ComCall(4, this, "int*", lpWidth, "int*", lpHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lpWidth 
     * @param {Pointer<Int32>} lpHeight 
     * @returns {HRESULT} 
     */
    GetMaxIdealVideoSize(lpWidth, lpHeight) {
        result := ComCall(5, this, "int*", lpWidth, "int*", lpHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} lpSRCRect 
     * @param {Pointer<RECT>} lpDSTRect 
     * @returns {HRESULT} 
     */
    SetVideoPosition(lpSRCRect, lpDSTRect) {
        result := ComCall(6, this, "ptr", lpSRCRect, "ptr", lpDSTRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} lpSRCRect 
     * @param {Pointer<RECT>} lpDSTRect 
     * @returns {HRESULT} 
     */
    GetVideoPosition(lpSRCRect, lpDSTRect) {
        result := ComCall(7, this, "ptr", lpSRCRect, "ptr", lpDSTRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpAspectRatioMode 
     * @returns {HRESULT} 
     */
    GetAspectRatioMode(lpAspectRatioMode) {
        result := ComCall(8, this, "uint*", lpAspectRatioMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AspectRatioMode 
     * @returns {HRESULT} 
     */
    SetAspectRatioMode(AspectRatioMode) {
        result := ComCall(9, this, "uint", AspectRatioMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     */
    SetVideoClippingWindow(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(10, this, "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {HDC} hdc 
     * @returns {HRESULT} 
     */
    RepaintVideo(hwnd, hdc) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(11, this, "ptr", hwnd, "ptr", hdc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisplayModeChanged() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} lpDib 
     * @returns {HRESULT} 
     */
    GetCurrentImage(lpDib) {
        result := ComCall(13, this, "char*", lpDib, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {COLORREF} Clr 
     * @returns {HRESULT} 
     */
    SetBorderColor(Clr) {
        result := ComCall(14, this, "uint", Clr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COLORREF>} lpClr 
     * @returns {HRESULT} 
     */
    GetBorderColor(lpClr) {
        result := ComCall(15, this, "ptr", lpClr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
