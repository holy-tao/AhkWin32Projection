#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls how the Enhanced Video Renderer (EVR) displays video.
 * @see https://learn.microsoft.com/windows/win32/api//content/evr/nn-evr-imfvideodisplaycontrol
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
     * @remarks
     * If no media types have been set on any video streams, the method succeeds but all parameters are set to zero.
     * 
     * You can set <i>pszVideo</i> or <i>pszARVideo</i> to <b>NULL</b>, but not both.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/evr/nf-evr-imfvideodisplaycontrol-getnativevideosize
     */
    GetNativeVideoSize(pszVideo, pszARVideo) {
        result := ComCall(3, this, "ptr", pszVideo, "ptr", pszARVideo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the range of sizes that the enhanced video renderer (EVR) can display without significantly degrading performance or image quality.
     * @remarks
     * You can set <i>pszMin</i> or <i>pszMax</i> to <b>NULL</b>, but not both.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/evr/nf-evr-imfvideodisplaycontrol-getidealvideosize
     */
    GetIdealVideoSize(pszMin, pszMax) {
        result := ComCall(4, this, "ptr", pszMin, "ptr", pszMax, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the source and destination rectangles for the video.
     * @remarks
     * The source rectangle defines which portion of the video is displayed. It is specified in <i>normalized</i> coordinates. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/evr/ns-evr-mfvideonormalizedrect">MFVideoNormalizedRect</a> structure. To display the entire video image, set the source rectangle to {0, 0, 1, 1}. The default source rectangle is {0, 0, 1, 1}.
     * 
     * The destination rectangle defines a rectangle within the clipping window where the video appears. It is specified in pixels, relative to the client area of the window. To fill the entire window, set the destination rectangle to {0, 0, <i>width</i>, <i>height</i>}, where <i>width</i> and <i>height</i> are dimensions of the window client area. The default destination rectangle is {0, 0, 0, 0}.
     * 
     * To update just one of these rectangles, set the other parameter to <b>NULL</b>. You can set <i>pnrcSource</i> or <i>prcDest</i> to <b>NULL</b>, but not both.
     * 
     * Before setting the destination rectangle (<i>prcDest</i>), you must set the video window by calling <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imfvideodisplaycontrol-setvideowindow">IMFVideoDisplayControl::SetVideoWindow</a>. (For the Media Foundation version of the EVR, you can also provide the video window in the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatevideorendereractivate">MFCreateVideoRendererActivate</a> function.) If no video window was provided, <b>SetVideoPosition</b> returns E_POINTER.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/evr/nf-evr-imfvideodisplaycontrol-setvideoposition
     */
    SetVideoPosition(pnrcSource, prcDest) {
        result := ComCall(5, this, "ptr", pnrcSource, "ptr", prcDest, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/evr/nf-evr-imfvideodisplaycontrol-getvideoposition
     */
    GetVideoPosition(pnrcSource, prcDest) {
        result := ComCall(6, this, "ptr", pnrcSource, "ptr", prcDest, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/evr/nf-evr-imfvideodisplaycontrol-setaspectratiomode
     */
    SetAspectRatioMode(dwAspectRatioMode) {
        result := ComCall(7, this, "uint", dwAspectRatioMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Queries how the enhanced video renderer (EVR) handles the aspect ratio of the source video.
     * @returns {Integer} Receives a bitwise <b>OR</b> of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/evr/ne-evr-mfvideoaspectratiomode">MFVideoAspectRatioMode</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api//content/evr/nf-evr-imfvideodisplaycontrol-getaspectratiomode
     */
    GetAspectRatioMode() {
        result := ComCall(8, this, "uint*", &pdwAspectRatioMode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwAspectRatioMode
    }

    /**
     * Sets the clipping window for the video.
     * @remarks
     * The EVR will not display any video unless the application calls this method with a valid window handle.
     * 
     * For protected content, this method might disable Desktop Window Manager (DWM) thumbnail previews for the window. If thumbnail previews cannot be disabled, the method returns S_FALSE.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/evr/nf-evr-imfvideodisplaycontrol-setvideowindow
     */
    SetVideoWindow(hwndVideo) {
        hwndVideo := hwndVideo is Win32Handle ? NumGet(hwndVideo, "ptr") : hwndVideo

        result := ComCall(9, this, "ptr", hwndVideo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the clipping window for the video.
     * @remarks
     * There is no default clipping window. The application must set the clipping window.
     * @returns {HWND} Receives a handle to the window where the enhanced video renderer (EVR) will draw the video.
     * @see https://learn.microsoft.com/windows/win32/api//content/evr/nf-evr-imfvideodisplaycontrol-getvideowindow
     */
    GetVideoWindow() {
        phwndVideo := HWND()
        result := ComCall(10, this, "ptr", phwndVideo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/evr/nf-evr-imfvideodisplaycontrol-repaintvideo
     */
    RepaintVideo() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets a copy of the current image being displayed by the video renderer.
     * @remarks
     * This method can be called at any time. However, calling the method too frequently degrades the video playback performance.
     * 
     * This method retrieves a copy of the final composited image, which includes any substreams, alpha-blended bitmap, aspect ratio correction, background color, and so forth.
     * 
     * In windowed mode, the bitmap is the size of the destination rectangle specified in <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imfvideodisplaycontrol-setvideoposition">IMFVideoDisplayControl::SetVideoPosition</a>. In full-screen mode, the bitmap is the size of the display.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/evr/nf-evr-imfvideodisplaycontrol-getcurrentimage
     */
    GetCurrentImage(pBih, pDib, pcbDib, pTimeStamp) {
        pDibMarshal := pDib is VarRef ? "ptr*" : "ptr"
        pcbDibMarshal := pcbDib is VarRef ? "uint*" : "ptr"
        pTimeStampMarshal := pTimeStamp is VarRef ? "int64*" : "ptr"

        result := ComCall(12, this, "ptr", pBih, pDibMarshal, pDib, pcbDibMarshal, pcbDib, pTimeStampMarshal, pTimeStamp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the border color for the video.
     * @remarks
     * By default, if the video window straddles two monitors, the enhanced video renderer (EVR) clips the video to one monitor and draws the border color on the remaining portion of the window. (To change the clipping behavior, call <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imfvideodisplaycontrol-setrenderingprefs">IMFVideoDisplayControl::SetRenderingPrefs</a>.)
     * 
     * The border color is not used for letterboxing. To change the letterbox color, call <a href="https://docs.microsoft.com/windows/desktop/api/evr9/nf-evr9-imfvideoprocessor-setbackgroundcolor">IMFVideoProcessor::SetBackgroundColor</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/evr/nf-evr-imfvideodisplaycontrol-setbordercolor
     */
    SetBorderColor(Clr) {
        result := ComCall(13, this, "uint", Clr, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the border color for the video.
     * @remarks
     * The border color is used for areas where the enhanced video renderer (EVR) does not draw any video.
     * 
     * The border color is not used for letterboxing. To get the letterbox color, call <a href="https://docs.microsoft.com/windows/desktop/api/evr9/nf-evr9-imfvideoprocessor-getbackgroundcolor">IMFVideoProcessor::GetBackgroundColor</a>.
     * @returns {COLORREF} Receives the border color, as a <b>COLORREF</b> value.
     * @see https://learn.microsoft.com/windows/win32/api//content/evr/nf-evr-imfvideodisplaycontrol-getbordercolor
     */
    GetBorderColor() {
        result := ComCall(14, this, "uint*", &pClr := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/evr/nf-evr-imfvideodisplaycontrol-setrenderingprefs
     */
    SetRenderingPrefs(dwRenderFlags) {
        result := ComCall(15, this, "uint", dwRenderFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets various video rendering settings.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/evr/ne-evr-mfvideorenderprefs">MFVideoRenderPrefs</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api//content/evr/nf-evr-imfvideodisplaycontrol-getrenderingprefs
     */
    GetRenderingPrefs() {
        result := ComCall(16, this, "uint*", &pdwRenderFlags := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwRenderFlags
    }

    /**
     * Sets or unsets full-screen rendering mode.
     * @remarks
     * The default EVR presenter implements full-screen mode using Direct3D exclusive mode.
     *       
     * 
     * If you use this  method  to switch to full-screen mode, set the application window to be a topmost window and resize the window to cover the entire monitor. This ensures that the application window receives all mouse-click messages. Also set the keyboard focus to the application window. When you switch out of full-screen mode, restore the window's original size and position.
     *       
     * 
     * By default, the cursor is still visible in full-screen mode. To hide the cursor, call <b>ShowCursor</b>.
     *       
     * 
     * The transition to and from full-screen mode occurs asynchronously. To get the current mode, call <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imfvideodisplaycontrol-getfullscreen">IMFVideoDisplayControl::GetFullscreen</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/evr/nf-evr-imfvideodisplaycontrol-setfullscreen
     */
    SetFullscreen(fFullscreen) {
        result := ComCall(17, this, "int", fFullscreen, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Queries whether the enhanced video renderer (EVR) is currently in full-screen mode.
     * @returns {BOOL} Receives a Boolean value. If <b>TRUE</b>, the EVR is in full-screen mode. If <b>FALSE</b>, the EVR will display the video inside the application-provided clipping window.
     * @see https://learn.microsoft.com/windows/win32/api//content/evr/nf-evr-imfvideodisplaycontrol-getfullscreen
     */
    GetFullscreen() {
        result := ComCall(18, this, "int*", &pfFullscreen := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfFullscreen
    }
}
