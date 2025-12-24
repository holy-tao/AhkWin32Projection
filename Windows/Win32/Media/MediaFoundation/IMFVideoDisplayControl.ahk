#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls how the Enhanced Video Renderer (EVR) displays video.
 * @see https://docs.microsoft.com/windows/win32/api//evr/nn-evr-imfvideodisplaycontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoDisplayControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFVideoDisplayControl
     * @type {Guid}
     */
    static IID => Guid("{a490b1e4-ab84-4d31-a1b2-181e03b1077a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNativeVideoSize", "GetIdealVideoSize", "SetVideoPosition", "GetVideoPosition", "SetAspectRatioMode", "GetAspectRatioMode", "SetVideoWindow", "GetVideoWindow", "RepaintVideo", "GetCurrentImage", "SetBorderColor", "GetBorderColor", "SetRenderingPrefs", "GetRenderingPrefs", "SetFullscreen", "GetFullscreen"]

    /**
     * Gets the size and aspect ratio of the video, prior to any stretching by the video renderer.
     * @param {Pointer<SIZE>} pszVideo Receives the size of the native video rectangle. This parameter can be <b>NULL</b>.
     * @param {Pointer<SIZE>} pszARVideo Receives the aspect ratio of the video. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the parameters must be non-<b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer has been shut down.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideodisplaycontrol-getnativevideosize
     */
    GetNativeVideoSize(pszVideo, pszARVideo) {
        result := ComCall(3, this, "ptr", pszVideo, "ptr", pszARVideo, "HRESULT")
        return result
    }

    /**
     * Gets the range of sizes that the enhanced video renderer (EVR) can display without significantly degrading performance or image quality.
     * @param {Pointer<SIZE>} pszMin Receives the minimum ideal size. This parameter can be <b>NULL</b>.
     * @param {Pointer<SIZE>} pszMax Receives the maximum ideal size. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter must be non-<b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer has been shut down.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideodisplaycontrol-getidealvideosize
     */
    GetIdealVideoSize(pszMin, pszMax) {
        result := ComCall(4, this, "ptr", pszMin, "ptr", pszMax, "HRESULT")
        return result
    }

    /**
     * Sets the source and destination rectangles for the video.
     * @param {Pointer<MFVideoNormalizedRect>} pnrcSource Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/evr/ns-evr-mfvideonormalizedrect">MFVideoNormalizedRect</a> structure that specifies the source rectangle. This parameter can be <b>NULL</b>. If this parameter is <b>NULL</b>, the source rectangle does not change.
     * @param {Pointer<RECT>} prcDest Specifies the destination rectangle. This parameter can be <b>NULL</b>. If this parameter is <b>NULL</b>, the destination rectangle does not change.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one parameter must be non-<b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer has been shut down.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideodisplaycontrol-setvideoposition
     */
    SetVideoPosition(pnrcSource, prcDest) {
        result := ComCall(5, this, "ptr", pnrcSource, "ptr", prcDest, "HRESULT")
        return result
    }

    /**
     * Gets the source and destination rectangles for the video.
     * @param {Pointer<MFVideoNormalizedRect>} pnrcSource Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/evr/ns-evr-mfvideonormalizedrect">MFVideoNormalizedRect</a> structure that receives the source rectangle.
     * @param {Pointer<RECT>} prcDest Receives the current destination rectangle.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more required parameters are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer has been shut down.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideodisplaycontrol-getvideoposition
     */
    GetVideoPosition(pnrcSource, prcDest) {
        result := ComCall(6, this, "ptr", pnrcSource, "ptr", prcDest, "HRESULT")
        return result
    }

    /**
     * Specifies how the enhanced video renderer (EVR) handles the aspect ratio of the source video.
     * @param {Integer} dwAspectRatioMode Bitwise <b>OR</b> of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/evr/ne-evr-mfvideoaspectratiomode">MFVideoAspectRatioMode</a> enumeration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid flags.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer has been shut down.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideodisplaycontrol-setaspectratiomode
     */
    SetAspectRatioMode(dwAspectRatioMode) {
        result := ComCall(7, this, "uint", dwAspectRatioMode, "HRESULT")
        return result
    }

    /**
     * Queries how the enhanced video renderer (EVR) handles the aspect ratio of the source video.
     * @returns {Integer} Receives a bitwise <b>OR</b> of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/evr/ne-evr-mfvideoaspectratiomode">MFVideoAspectRatioMode</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideodisplaycontrol-getaspectratiomode
     */
    GetAspectRatioMode() {
        result := ComCall(8, this, "uint*", &pdwAspectRatioMode := 0, "HRESULT")
        return pdwAspectRatioMode
    }

    /**
     * Sets the clipping window for the video.
     * @param {HWND} hwndVideo Handle to the window where the enhanced video renderer (EVR) will draw the video.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hwndVideo</i> does not specify a valid window.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DWM thumbnails were not enabled/disabled.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideodisplaycontrol-setvideowindow
     */
    SetVideoWindow(hwndVideo) {
        hwndVideo := hwndVideo is Win32Handle ? NumGet(hwndVideo, "ptr") : hwndVideo

        result := ComCall(9, this, "ptr", hwndVideo, "HRESULT")
        return result
    }

    /**
     * Gets the clipping window for the video.
     * @returns {HWND} Receives a handle to the window where the enhanced video renderer (EVR) will draw the video.
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideodisplaycontrol-getvideowindow
     */
    GetVideoWindow() {
        phwndVideo := HWND()
        result := ComCall(10, this, "ptr", phwndVideo, "HRESULT")
        return phwndVideo
    }

    /**
     * Repaints the current video frame. Call this method whenever the application receives a WM_PAINT message.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The EVR cannot repaint the frame at this time. This error can occur while the EVR is switching between full-screen and windowed mode. The caller can safely ignore this error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer has been shut down.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideodisplaycontrol-repaintvideo
     */
    RepaintVideo() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Gets a copy of the current image being displayed by the video renderer.
     * @param {Pointer<BITMAPINFOHEADER>} pBih Pointer to a <b>BITMAPINFOHEADER</b> structure that receives a description of the bitmap. Set the <b>biSize</b> member of the structure to <c>sizeof(BITMAPINFOHEADER)</c> before calling the method.
     * @param {Pointer<Pointer<Integer>>} pDib Receives a pointer to a buffer that contains a packed Windows device-independent bitmap (DIB). The caller must free the memory for the bitmap by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<Integer>} pcbDib Receives the size of the buffer returned in <i>pDib</i>, in bytes.
     * @param {Pointer<Integer>} pTimeStamp Receives the time stamp of the captured image.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>MF_E_LICENSE_INCORRECT_RIGHTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The content is protected and the license does not permit capturing the image.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer has been shut down.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideodisplaycontrol-getcurrentimage
     */
    GetCurrentImage(pBih, pDib, pcbDib, pTimeStamp) {
        pDibMarshal := pDib is VarRef ? "ptr*" : "ptr"
        pcbDibMarshal := pcbDib is VarRef ? "uint*" : "ptr"
        pTimeStampMarshal := pTimeStamp is VarRef ? "int64*" : "ptr"

        result := ComCall(12, this, "ptr", pBih, pDibMarshal, pDib, pcbDibMarshal, pcbDib, pTimeStampMarshal, pTimeStamp, "HRESULT")
        return result
    }

    /**
     * Sets the border color for the video.
     * @param {COLORREF} Clr Specifies the border color as a <b>COLORREF</b> value.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer has been shut down.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideodisplaycontrol-setbordercolor
     */
    SetBorderColor(Clr) {
        result := ComCall(13, this, "uint", Clr, "HRESULT")
        return result
    }

    /**
     * Gets the border color for the video.
     * @returns {COLORREF} Receives the border color, as a <b>COLORREF</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideodisplaycontrol-getbordercolor
     */
    GetBorderColor() {
        result := ComCall(14, this, "uint*", &pClr := 0, "HRESULT")
        return pClr
    }

    /**
     * Sets various preferences related to video rendering.
     * @param {Integer} dwRenderFlags Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/evr/ne-evr-mfvideorenderprefs">MFVideoRenderPrefs</a> enumeration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid flags.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer has been shut down.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideodisplaycontrol-setrenderingprefs
     */
    SetRenderingPrefs(dwRenderFlags) {
        result := ComCall(15, this, "uint", dwRenderFlags, "HRESULT")
        return result
    }

    /**
     * Gets various video rendering settings.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/evr/ne-evr-mfvideorenderprefs">MFVideoRenderPrefs</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideodisplaycontrol-getrenderingprefs
     */
    GetRenderingPrefs() {
        result := ComCall(16, this, "uint*", &pdwRenderFlags := 0, "HRESULT")
        return pdwRenderFlags
    }

    /**
     * Sets or unsets full-screen rendering mode.
     * @param {BOOL} fFullscreen If <b>TRUE</b>, the enhanced video renderer (EVR) uses full-screen mode. If <b>FALSE</b>, the EVR draws the video in the application-provided clipping window.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer has been shut down.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideodisplaycontrol-setfullscreen
     */
    SetFullscreen(fFullscreen) {
        result := ComCall(17, this, "int", fFullscreen, "HRESULT")
        return result
    }

    /**
     * Queries whether the enhanced video renderer (EVR) is currently in full-screen mode.
     * @returns {BOOL} Receives a Boolean value. If <b>TRUE</b>, the EVR is in full-screen mode. If <b>FALSE</b>, the EVR will display the video inside the application-provided clipping window.
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideodisplaycontrol-getfullscreen
     */
    GetFullscreen() {
        result := ComCall(18, this, "int*", &pfFullscreen := 0, "HRESULT")
        return pfFullscreen
    }
}
