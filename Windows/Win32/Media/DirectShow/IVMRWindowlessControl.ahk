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
 * The IVMRWindowlessControl interface controls how the Video Mixing Renderer Filter 7 (VMR-7) renders a video stream within a container window.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ivmrwindowlesscontrol
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRWindowlessControl extends IUnknown {
    /**
     * The interface identifier for IVMRWindowlessControl
     * @type {Guid}
     */
    static IID := Guid("{0eb1088c-4dcd-46f0-878f-39dae86a51b7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRWindowlessControl interfaces
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
        SetColorKey            : IntPtr
        GetColorKey            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRWindowlessControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetNativeVideoSize method retrieves the un-stretched video size and aspect ratio of the video.
     * @remarks
     * If the VMR is not connected to an upstream filter, this method will succeed but all parameters will be set to zero.
     * 
     * If <i>lpWidth</i> is 640 and <i>lpHeight</i> is 480, then <i>lpARWidth</i> will be 4 and <i>lpARHeight</i> will be 3.
     * @param {Pointer<Integer>} lpWidth Pointer that receives the width of the native video rectangle.
     * @param {Pointer<Integer>} lpHeight Pointer that receives the height of the native video rectangle.
     * @param {Pointer<Integer>} lpARWidth Pointer that receives the aspect ratio width of the native video rectangle.
     * @param {Pointer<Integer>} lpARHeight Pointer that receives the aspect ratio height of the native video rectangle.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Returns E_POINTER if all four input parameters are <b>NULL</b>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * The GetMinIdealVideoSize method retrieves the minimum video size that the VMR can display without incurring significant performance or image quality degradation.
     * @param {Pointer<Integer>} lpWidth Pointer to a LONG value that receives the minimum ideal width.
     * @param {Pointer<Integer>} lpHeight Pointer to a LONG value that receives the minimum ideal height.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-getminidealvideosize
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
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-getmaxidealvideosize
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
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-setvideoposition
     */
    SetVideoPosition(lpSRCRect, lpDSTRect) {
        result := ComCall(6, this, RECT.Ptr, lpSRCRect, RECT.Ptr, lpDSTRect, "HRESULT")
        return result
    }

    /**
     * The GetVideoPosition method retrieves the current source and destination rectangles used to display the video.
     * @param {Pointer<RECT>} lpSRCRect Pointer that receives the current source rectangle.
     * @param {Pointer<RECT>} lpDSTRect Pointer that receives the current destination rectangle.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-getvideoposition
     */
    GetVideoPosition(lpSRCRect, lpDSTRect) {
        result := ComCall(7, this, RECT.Ptr, lpSRCRect, RECT.Ptr, lpDSTRect, "HRESULT")
        return result
    }

    /**
     * The GetAspectRatioMode method queries whether the VMR will preserve the aspect ratio of the source video. (IVMRWindowlessControl.GetAspectRatioMode)
     * @returns {Integer} Pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmr_aspect_ratio_mode">VMR_ASPECT_RATIO_MODE</a> value indicating the aspect ratio mode.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-getaspectratiomode
     */
    GetAspectRatioMode() {
        result := ComCall(8, this, "uint*", &lpAspectRatioMode := 0, "HRESULT")
        return lpAspectRatioMode
    }

    /**
     * The SetAspectRatioMode method specifies whether the VMR will preserve the aspect ratio of the source video. (IVMRWindowlessControl.SetAspectRatioMode)
     * @param {Integer} AspectRatioMode Specifies a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmr_aspect_ratio_mode">VMR_ASPECT_RATIO_MODE</a> enumeration type.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
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
     * Invalid argument
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
     * Success
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-setaspectratiomode
     */
    SetAspectRatioMode(AspectRatioMode) {
        result := ComCall(9, this, "uint", AspectRatioMode, "HRESULT")
        return result
    }

    /**
     * The SetVideoClippingWindow method specifies the container window that video should be clipped to.
     * @param {HWND} _hwnd Specifies the window to which the video should be clipped.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-setvideoclippingwindow
     */
    SetVideoClippingWindow(_hwnd) {
        result := ComCall(10, this, HWND, _hwnd, "HRESULT")
        return result
    }

    /**
     * The RepaintVideo method repaints the current video frame.
     * @param {HWND} _hwnd Specifies the handle of the window in which the repainting should occur.
     * @param {HDC} _hdc Specifies the handle to the device context for the window.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-repaintvideo
     */
    RepaintVideo(_hwnd, _hdc) {
        result := ComCall(11, this, HWND, _hwnd, HDC, _hdc, "HRESULT")
        return result
    }

    /**
     * The DisplayModeChanged method informs the VMR that a WM_DISPLAYCHANGE message has been received by the application.
     * @remarks
     * An application must call this method whenever it receives a WM_DISPLAYCHANGE window message, but only if the VMR is currently in windowless mode.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-displaymodechanged
     */
    DisplayModeChanged() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * The GetCurrentImage method retrieves a copy of the current image being displayed by the VMR.
     * @remarks
     * This method returns the current image being displayed. The image is returned in the form of packed Windows DIB. The image starts with a <b>BITMAPINFOHEADER</b> structure, possibly including palette entries and/or color masks, followed by the image data.
     * 
     * The VMR allocates the memory for the image and returns a pointer to it in the <i>lpDib</i> variable. The caller must free the memory by calling <b>CoTaskMemFree</b>.
     * 
     * This method can be called at any time, no matter what state the filter is in, whether running, stopped or paused. However, frequent calls to this method will degrade video playback performance.
     * @returns {Pointer<Integer>} Address of a pointer to a BYTE array.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-getcurrentimage
     */
    GetCurrentImage() {
        result := ComCall(13, this, "ptr*", &lpDib := 0, "HRESULT")
        return lpDib
    }

    /**
     * The SetBorderColor method sets the border color to be used by the VMR.
     * @remarks
     * The border color is color used to fill any area of the destination rectangle that does not contain video. It is typically used in two instances: (1) when the video straddles two monitors and (2) when the VMR is trying to maintain the aspect ratio of the movie by letter boxing the video to fit within the specified destination rectangle. See the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrwindowlesscontrol-setaspectratiomode">IVMRWindowlessControl::SetAspectRatioMode</a> method.
     * @param {COLORREF} Clr Specifies the border color.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-setbordercolor
     */
    SetBorderColor(Clr) {
        result := ComCall(14, this, COLORREF, Clr, "HRESULT")
        return result
    }

    /**
     * The GetBorderColor method retrieves the current border color used by the VMR.
     * @returns {COLORREF} Pointer to a <b>COLORREF</b> variable that receives the current border color.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-getbordercolor
     */
    GetBorderColor() {
        result := ComCall(15, this, COLORREF.Ptr, &lpClr := 0, "HRESULT")
        return lpClr
    }

    /**
     * The SetColorKey method sets the source color key value that the VMR should use.
     * @remarks
     * Color key control is only meaningful when the VMR is using an overlay surface.
     * @param {COLORREF} Clr Specifies the source color key.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-setcolorkey
     */
    SetColorKey(Clr) {
        result := ComCall(16, this, COLORREF, Clr, "HRESULT")
        return result
    }

    /**
     * The GetColorKey method retrieves the current source color key value used by the VMR.
     * @returns {COLORREF} Pointer to a <b>COLORREF</b> variable that receives the current color key value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrwindowlesscontrol-getcolorkey
     */
    GetColorKey() {
        result := ComCall(17, this, COLORREF.Ptr, &lpClr := 0, "HRESULT")
        return lpClr
    }

    Query(iid) {
        if (IVMRWindowlessControl.IID.Equals(iid)) {
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
        this.vtbl.SetColorKey := CallbackCreate(GetMethod(implObj, "SetColorKey"), flags, 2)
        this.vtbl.GetColorKey := CallbackCreate(GetMethod(implObj, "GetColorKey"), flags, 2)
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
        CallbackFree(this.vtbl.SetColorKey)
        CallbackFree(this.vtbl.GetColorKey)
    }
}
