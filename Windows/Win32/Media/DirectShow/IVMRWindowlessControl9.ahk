#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVMRWindowlessControl9 interface controls how the Video Mixing Renderer Filter 9 (VMR-9) renders a video stream within a container window.
 * @remarks
 * The VMR-9 supports this interface in windowless and renderless modes only. In windowed mode, <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> returns <b>E_NOINTERFACE</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/vmr-modes-of-operation">VMR Modes of Operation</a>.
 * 
 * Include DShow.h and D3d9.h before Vmr9.h.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/nn-vmr9-ivmrwindowlesscontrol9
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRWindowlessControl9 extends IUnknown {
    /**
     * The interface identifier for IVMRWindowlessControl9
     * @type {Guid}
     */
    static IID := Guid("{8f537d09-f85e-4414-b23b-502e54c79927}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRWindowlessControl9 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetNativeVideoSize     : IntPtr
        GetMinIdealVideoSize   : IntPtr
        GetMaxIdealVideoSize   : IntPtr
        SetVideoPosition       : IntPtr
        GetVideoPosition       : IntPtr
        GetAspectRatioMode     : IntPtr
        SetAspectRatioMode     : IntPtr
        SetVideoClippingWindow : IntPtr
        RepaintVideo           : IntPtr
        DisplayModeChanged     : IntPtr
        GetCurrentImage        : IntPtr
        SetBorderColor         : IntPtr
        GetBorderColor         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRWindowlessControl9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetNativeVideoSize method retrieves the un-stretched video size and aspect ratio of the video.
     * @remarks
     * If the VMR is not connected to an upstream filter, this method will succeed but all parameters will be set to zero.
     * 
     * If <i>lpWidth</i> is 640 and <i>lpHeight</i> is 480, then <i>lpARWidth</i> will be 4 and <i>lpARHeight</i> will be 3.
     * 
     * Include DShow.h and D3d9.h before Vmr9.h.
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
     * The GetMinIdealVideoSize method retrieves the minimum video size that the VMR can display without incurring significant performance or image quality degradation.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-getminidealvideosize
     */
    GetMinIdealVideoSize(lpWidth, lpHeight) {
        lpWidthMarshal := lpWidth is VarRef ? "int*" : "ptr"
        lpHeightMarshal := lpHeight is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, lpWidthMarshal, lpWidth, lpHeightMarshal, lpHeight, "HRESULT")
        return result
    }

    /**
     * The GetMaxIdealVideoSize method retrieves the maximum video size that the VMR can display without incurring significant performance or image quality degradation.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-getmaxidealvideosize
     */
    GetMaxIdealVideoSize(lpWidth, lpHeight) {
        lpWidthMarshal := lpWidth is VarRef ? "int*" : "ptr"
        lpHeightMarshal := lpHeight is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, lpWidthMarshal, lpWidth, lpHeightMarshal, lpHeight, "HRESULT")
        return result
    }

    /**
     * The SetVideoPosition method sets the source and destination rectangles for the video.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-setvideoposition
     */
    SetVideoPosition(lpSRCRect, lpDSTRect) {
        result := ComCall(6, this, RECT.Ptr, lpSRCRect, RECT.Ptr, lpDSTRect, "HRESULT")
        return result
    }

    /**
     * The GetVideoPosition method retrieves the current source and destination rectangles used to display the video.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-getvideoposition
     */
    GetVideoPosition(lpSRCRect, lpDSTRect) {
        result := ComCall(7, this, RECT.Ptr, lpSRCRect, RECT.Ptr, lpDSTRect, "HRESULT")
        return result
    }

    /**
     * The GetAspectRatioMode method retrieves the current aspect ratio display mode.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @returns {Integer} Pointer to a DWORD that receives a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9aspectratiomode">VMR9AspectRatioMode</a> value that indicates the current aspect ratio mode.
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-getaspectratiomode
     */
    GetAspectRatioMode() {
        result := ComCall(8, this, "uint*", &lpAspectRatioMode := 0, "HRESULT")
        return lpAspectRatioMode
    }

    /**
     * The SetAspectRatioMode method sets the current aspect ratio display mode.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-setaspectratiomode
     */
    SetAspectRatioMode(AspectRatioMode) {
        result := ComCall(9, this, "uint", AspectRatioMode, "HRESULT")
        return result
    }

    /**
     * The SetVideoClippingWindow method specifies the container window that video should be clipped to.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {HWND} _hwnd Specifies the window to which the video should be clipped.
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-setvideoclippingwindow
     */
    SetVideoClippingWindow(_hwnd) {
        result := ComCall(10, this, HWND, _hwnd, "HRESULT")
        return result
    }

    /**
     * The RepaintVideo method repaints the current video frame.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {HWND} _hwnd Specifies the handle of the window in which the repainting should occur.
     * @param {HDC} _hdc Specifies the handle to the device context for the window.
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-repaintvideo
     */
    RepaintVideo(_hwnd, _hdc) {
        result := ComCall(11, this, HWND, _hwnd, HDC, _hdc, "HRESULT")
        return result
    }

    /**
     * The DisplayModeChanged method informs the VMR that a WM_DISPLAYCHANGE message has been received by the application.
     * @remarks
     * An application must call this method whenever it receives a WM_DISPLAYCHANGE window message, but only if the VMR is currently in windowless mode.
     * 
     * Include DShow.h and D3d9.h before Vmr9.h.
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-displaymodechanged
     */
    DisplayModeChanged() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * The GetCurrentImage method retrieves a copy of the current image being displayed by the VMR.
     * @remarks
     * This method returns the current image being displayed. The image is returned in the form of packed Windows DIB. The image starts with a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure, possibly including palette entries and/or color masks, followed by the image data.
     * 
     * The VMR allocates the memory for the image and returns a pointer to it in the <i>lpDib</i> variable. The caller must free the memory by calling <b>CoTaskMemFree</b>.
     * 
     * This method can be called at any time, no matter what state the filter is in, whether running, stopped or paused. However, frequent calls to this method will degrade video playback performance.
     * 
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @returns {Pointer<Integer>} Address of a pointer to a BYTE that will receive the DIB.
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-getcurrentimage
     */
    GetCurrentImage() {
        result := ComCall(13, this, "ptr*", &lpDib := 0, "HRESULT")
        return lpDib
    }

    /**
     * The SetBorderColor method sets the border color to be used by the VMR.
     * @remarks
     * The border color is used to fill any area of the destination rectangle that does not contain video. It is typically used in two situations:
     * 
     * <ul>
     * <li>When the video straddles two monitors</li>
     * <li>When the VMR is trying to maintain the aspect ratio of the movies by letter-boxing the video to fit within the specified destination rectangle. See <b>SetAspectRatioMode</b>.</li>
     * </ul>
     * Include DShow.h and D3d9.h before Vmr9.h.
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-setbordercolor
     */
    SetBorderColor(Clr) {
        result := ComCall(14, this, COLORREF, Clr, "HRESULT")
        return result
    }

    /**
     * The GetBorderColor method retrieves the current border color used by the VMR.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @returns {COLORREF} Pointer to a <b>COLORREF</b> variable that receives the current border color.
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrwindowlesscontrol9-getbordercolor
     */
    GetBorderColor() {
        result := ComCall(15, this, COLORREF.Ptr, &lpClr := 0, "HRESULT")
        return lpClr
    }

    Query(iid) {
        if (IVMRWindowlessControl9.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNativeVideoSize := CallbackCreate(GetMethod(implObj, "GetNativeVideoSize"), flags, 5)
        this.vtbl.GetMinIdealVideoSize := CallbackCreate(GetMethod(implObj, "GetMinIdealVideoSize"), flags, 3)
        this.vtbl.GetMaxIdealVideoSize := CallbackCreate(GetMethod(implObj, "GetMaxIdealVideoSize"), flags, 3)
        this.vtbl.SetVideoPosition := CallbackCreate(GetMethod(implObj, "SetVideoPosition"), flags, 3)
        this.vtbl.GetVideoPosition := CallbackCreate(GetMethod(implObj, "GetVideoPosition"), flags, 3)
        this.vtbl.GetAspectRatioMode := CallbackCreate(GetMethod(implObj, "GetAspectRatioMode"), flags, 2)
        this.vtbl.SetAspectRatioMode := CallbackCreate(GetMethod(implObj, "SetAspectRatioMode"), flags, 2)
        this.vtbl.SetVideoClippingWindow := CallbackCreate(GetMethod(implObj, "SetVideoClippingWindow"), flags, 2)
        this.vtbl.RepaintVideo := CallbackCreate(GetMethod(implObj, "RepaintVideo"), flags, 3)
        this.vtbl.DisplayModeChanged := CallbackCreate(GetMethod(implObj, "DisplayModeChanged"), flags, 1)
        this.vtbl.GetCurrentImage := CallbackCreate(GetMethod(implObj, "GetCurrentImage"), flags, 2)
        this.vtbl.SetBorderColor := CallbackCreate(GetMethod(implObj, "SetBorderColor"), flags, 2)
        this.vtbl.GetBorderColor := CallbackCreate(GetMethod(implObj, "GetBorderColor"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNativeVideoSize)
        CallbackFree(this.vtbl.GetMinIdealVideoSize)
        CallbackFree(this.vtbl.GetMaxIdealVideoSize)
        CallbackFree(this.vtbl.SetVideoPosition)
        CallbackFree(this.vtbl.GetVideoPosition)
        CallbackFree(this.vtbl.GetAspectRatioMode)
        CallbackFree(this.vtbl.SetAspectRatioMode)
        CallbackFree(this.vtbl.SetVideoClippingWindow)
        CallbackFree(this.vtbl.RepaintVideo)
        CallbackFree(this.vtbl.DisplayModeChanged)
        CallbackFree(this.vtbl.GetCurrentImage)
        CallbackFree(this.vtbl.SetBorderColor)
        CallbackFree(this.vtbl.GetBorderColor)
    }
}
