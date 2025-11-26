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
     * The GetNativeVideoSize method retrieves the un-stretched video size and aspect ratio of the video.
     * @param {Pointer<Integer>} lpWidth Pointer that receives the width of the native video rectangle.
     * @param {Pointer<Integer>} lpHeight Pointer that receives the height of the native video rectangle.
     * @param {Pointer<Integer>} lpARWidth Pointer that receives the aspect ratio width of the native video rectangle.
     * @param {Pointer<Integer>} lpARHeight Pointer that receives the aspect ratio height of the native video rectangle.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The VMR is not in windowless mode.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrwindowlesscontrol9-getnativevideosize
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
     * The GetMinIdealVideoSize method retrieves the minimum video size that the VMR can display without incurring significant performance or image quality degradation.
     * @param {Pointer<Integer>} lpWidth Pointer that receives the minimum ideal width.
     * @param {Pointer<Integer>} lpHeight Pointer that receives the minimum ideal height.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The VMR is not in windowless mode.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrwindowlesscontrol9-getminidealvideosize
     */
    GetMinIdealVideoSize(lpWidth, lpHeight) {
        lpWidthMarshal := lpWidth is VarRef ? "int*" : "ptr"
        lpHeightMarshal := lpHeight is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, lpWidthMarshal, lpWidth, lpHeightMarshal, lpHeight, "HRESULT")
        return result
    }

    /**
     * The GetMaxIdealVideoSize method retrieves the maximum video size that the VMR can display without incurring significant performance or image quality degradation.
     * @param {Pointer<Integer>} lpWidth Pointer that receives the maximum ideal width.
     * @param {Pointer<Integer>} lpHeight Pointer that receives the maximum ideal height.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The VMR is not in windowless mode.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrwindowlesscontrol9-getmaxidealvideosize
     */
    GetMaxIdealVideoSize(lpWidth, lpHeight) {
        lpWidthMarshal := lpWidth is VarRef ? "int*" : "ptr"
        lpHeightMarshal := lpHeight is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, lpWidthMarshal, lpWidth, lpHeightMarshal, lpHeight, "HRESULT")
        return result
    }

    /**
     * The SetVideoPosition method sets the source and destination rectangles for the video.
     * @param {Pointer<RECT>} lpSRCRect Pointer to a <b>RECT</b> structure that specifies the source rectangle. If <b>NULL</b>, the source rectangle does not change. The default source rectangle is the entire video image.
     * @param {Pointer<RECT>} lpDSTRect Pointer to a <b>RECT</b> structure that specifies the destination rectangle. If <b>NULL</b>, the destination rectangle does not change. The default destination rectangle is {0, 0, 0, 0}.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The VMR is not in windowless mode.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrwindowlesscontrol9-setvideoposition
     */
    SetVideoPosition(lpSRCRect, lpDSTRect) {
        result := ComCall(6, this, "ptr", lpSRCRect, "ptr", lpDSTRect, "HRESULT")
        return result
    }

    /**
     * The GetVideoPosition method retrieves the current source and destination rectangles used to display the video.
     * @param {Pointer<RECT>} lpSRCRect Pointer that receives the current source rectangle.
     * @param {Pointer<RECT>} lpDSTRect Pointer that receives the current destination rectangle.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The VMR is not in windowless mode.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrwindowlesscontrol9-getvideoposition
     */
    GetVideoPosition(lpSRCRect, lpDSTRect) {
        result := ComCall(7, this, "ptr", lpSRCRect, "ptr", lpDSTRect, "HRESULT")
        return result
    }

    /**
     * The GetAspectRatioMode method retrieves the current aspect ratio display mode.
     * @returns {Integer} Pointer to a DWORD that receives a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9aspectratiomode">VMR9AspectRatioMode</a> value that indicates the current aspect ratio mode.
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrwindowlesscontrol9-getaspectratiomode
     */
    GetAspectRatioMode() {
        result := ComCall(8, this, "uint*", &lpAspectRatioMode := 0, "HRESULT")
        return lpAspectRatioMode
    }

    /**
     * The SetAspectRatioMode method sets the current aspect ratio display mode.
     * @param {Integer} AspectRatioMode A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9aspectratiomode">VMR9AspectRatioMode</a> value that specifies the aspect ratio mode.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The VMR is not in windowless mode.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrwindowlesscontrol9-setaspectratiomode
     */
    SetAspectRatioMode(AspectRatioMode) {
        result := ComCall(9, this, "uint", AspectRatioMode, "HRESULT")
        return result
    }

    /**
     * The SetVideoClippingWindow method specifies the container window that video should be clipped to.
     * @param {HWND} hwnd Specifies the window to which the video should be clipped.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hwnd</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The VMR is not in windowless mode.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrwindowlesscontrol9-setvideoclippingwindow
     */
    SetVideoClippingWindow(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(10, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * The RepaintVideo method repaints the current video frame.
     * @param {HWND} hwnd Specifies the handle of the window in which the repainting should occur.
     * @param {HDC} hdc Specifies the handle to the device context for the window.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The VMR is not in windowless mode.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrwindowlesscontrol9-repaintvideo
     */
    RepaintVideo(hwnd, hdc) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(11, this, "ptr", hwnd, "ptr", hdc, "HRESULT")
        return result
    }

    /**
     * The DisplayModeChanged method informs the VMR that a WM_DISPLAYCHANGE message has been received by the application.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrwindowlesscontrol9-displaymodechanged
     */
    DisplayModeChanged() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * The GetCurrentImage method retrieves a copy of the current image being displayed by the VMR.
     * @returns {Pointer<Integer>} Address of a pointer to a BYTE that will receive the DIB.
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrwindowlesscontrol9-getcurrentimage
     */
    GetCurrentImage() {
        result := ComCall(13, this, "ptr*", &lpDib := 0, "HRESULT")
        return lpDib
    }

    /**
     * The SetBorderColor method sets the border color to be used by the VMR.
     * @param {COLORREF} Clr Specifies the color as a <b>COLORREF</b> value.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrwindowlesscontrol9-setbordercolor
     */
    SetBorderColor(Clr) {
        result := ComCall(14, this, "uint", Clr, "HRESULT")
        return result
    }

    /**
     * The GetBorderColor method retrieves the current border color used by the VMR.
     * @returns {COLORREF} Pointer to a <b>COLORREF</b> variable that receives the current border color.
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrwindowlesscontrol9-getbordercolor
     */
    GetBorderColor() {
        result := ComCall(15, this, "uint*", &lpClr := 0, "HRESULT")
        return lpClr
    }
}
