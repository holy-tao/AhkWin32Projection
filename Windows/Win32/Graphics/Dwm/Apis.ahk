#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class Dwm {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static DWM_BB_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DWM_BB_BLURREGION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DWM_BB_TRANSITIONONMAXIMIZED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DWMWA_COLOR_DEFAULT => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static DWMWA_COLOR_NONE => 4294967294

    /**
     * @type {Integer (UInt32)}
     */
    static DWM_CLOAKED_APP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DWM_CLOAKED_SHELL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DWM_CLOAKED_INHERITED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DWM_TNP_RECTDESTINATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DWM_TNP_RECTSOURCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DWM_TNP_OPACITY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DWM_TNP_VISIBLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DWM_TNP_SOURCECLIENTAREAONLY => 16

    /**
     * @type {Integer (Int32)}
     */
    static DWM_FRAME_DURATION_DEFAULT => -1

    /**
     * @type {Integer (UInt32)}
     */
    static DWM_EC_DISABLECOMPOSITION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DWM_EC_ENABLECOMPOSITION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DWM_SIT_DISPLAYFRAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static c_DwmMaxQueuedBuffers => 8

    /**
     * @type {Integer (UInt32)}
     */
    static c_DwmMaxMonitors => 16

    /**
     * @type {Integer (UInt32)}
     */
    static c_DwmMaxAdapters => 16
;@endregion Constants

;@region Methods
    /**
     * Default window procedure for Desktop Window Manager (DWM) hit testing within the non-client area.
     * @remarks
     * When creating custom frames that include the standard caption buttons, <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-nchittest">WM_NCHITTEST</a> and other non-client hit test messages should first be passed to the <b>DwmDefWindowProc</b> function. This enables the DWM to provide hit testing for the captions buttons. If <b>DwmDefWindowProc</b> does not handle the non-client hit test messages, further processing of these messages might be necessary.
     * @param {Pointer<Void>} hWnd A handle to the window procedure that received the message.
     * @param {Integer} msg The message.
     * @param {Pointer} wParam Specifies additional message information. The content of this parameter depends on the value of the <i>msg</i> parameter.
     * @param {Pointer} lParam Specifies additional message information. The content of this parameter depends on the value of the <i>msg</i> parameter.
     * @param {Pointer<IntPtr>} plResult A pointer to an <b>LRESULT</b> value that, when this method returns successfully,receives the result of the hit test.
     * @returns {Integer} <b>TRUE</b> if <b>DwmDefWindowProc</b> handled the message; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmdefwindowproc
     * @since windows6.0.6000
     */
    static DwmDefWindowProc(hWnd, msg, wParam, lParam, plResult) {
        result := DllCall("dwmapi.dll\DwmDefWindowProc", "ptr", hWnd, "uint", msg, "ptr", wParam, "ptr", lParam, "ptr*", plResult, "int")
        return result
    }

    /**
     * Enables the blur effect on a specified window.
     * @remarks
     * > [!NOTE]
     * > Beginning with Windows 8, calling this function doesn't result in the blur effect, due to a style change in the way windows are rendered.
     * 
     * Enable blur by setting the <b>fEnable</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/dwmapi/ns-dwmapi-dwm_blurbehind">DWM_BLURBEHIND</a> structure to <b>TRUE</b>. This results in subsequent compositions of the window blurring the content behind it. This function should be called immediately before a <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-beginpaint">BeginPaint</a> call to ensure prompt application of the effect.
     * 
     * The alpha values in the window are honored, and the rendering atop the blur will use these alpha values. It's your application's responsibility to ensure that the alpha values of all pixels in the window are correct. Some Windows Graphics Device Interface (GDI) operations don't preserve alpha values, so you should take care when presenting child windows because the alpha values they contribute are unpredictable.
     * 
     * The region specified within the <a href="https://docs.microsoft.com/windows/win32/api/dwmapi/ns-dwmapi-dwm_blurbehind">DWM_BLURBEHIND</a> structure is owned by you as the caller. It's the caller's responsibility to free the region, and you can do so as soon as the function call is completed.
     * 
     * This function can be called only on top-level windows. An error occurs when this function is called on other window types.
     * 
     * This function must be called whenever Desktop Window Manager (DWM) composition is toggled. Handle the <a href="https://docs.microsoft.com/windows/win32/dwm/wm-dwmcompositionchanged">WM_DWMCOMPOSITIONCHANGED</a> message for composition change notification.
     * @param {Pointer<Void>} hWnd The handle to the window on which the blur-behind data is applied.
     * @param {Pointer<DWM_BLURBEHIND>} pBlurBehind `[in]`
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwmapi/ns-dwmapi-dwm_blurbehind">DWM_BLURBEHIND</a> structure that provides blur-behind data.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmenableblurbehindwindow
     * @since windows6.0.6000
     */
    static DwmEnableBlurBehindWindow(hWnd, pBlurBehind) {
        result := DllCall("dwmapi.dll\DwmEnableBlurBehindWindow", "ptr", hWnd, "ptr", pBlurBehind, "int")
        return result
    }

    /**
     * Enables or disables Desktop Window Manager (DWM) composition.
     * @remarks
     * Disabling DWM composition disables it for the entire desktop. DWM composition will be automatically enabled when all processes that have disabled composition have called <b>DwmEnableComposition</b> to enable it or have been terminated. The <a href="https://docs.microsoft.com/windows/desktop/dwm/wm-dwmcompositionchanged">WM_DWMCOMPOSITIONCHANGED</a> notification is sent whenever DWM composition is enabled or disabled.
     * @param {Integer} uCompositionAction <b>DWM_EC_ENABLECOMPOSITION</b> to enable DWM composition; <b>DWM_EC_DISABLECOMPOSITION</b> to disable composition.
     *                         
     * 
     * <div class="alert"><b>Note</b>  As of Windows 8, calling this function with <b>DWM_EC_DISABLECOMPOSITION</b> has no effect. However, the function will still return a success code.</div>
     * <div> </div>
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmenablecomposition
     * @since windows6.0.6000
     */
    static DwmEnableComposition(uCompositionAction) {
        result := DllCall("dwmapi.dll\DwmEnableComposition", "uint", uCompositionAction, "int")
        return result
    }

    /**
     * Notifies the Desktop Window Manager (DWM) to opt in to or out of Multimedia Class Schedule Service (MMCSS) scheduling while the calling process is alive.
     * @remarks
     * DWM will be scheduled by the MMCSS as long as any process that called <b>DwmEnableMMCSS</b> to enable MMCSS is active and has not previously called <b>DwmEnableMMCSS</b> to disable MMCSS.
     * @param {Integer} fEnableMMCSS <b>TRUE</b> to instruct DWM to participate in MMCSS scheduling; <b>FALSE</b> to opt out or end participation in MMCSS scheduling.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmenablemmcss
     * @since windows6.0.6000
     */
    static DwmEnableMMCSS(fEnableMMCSS) {
        result := DllCall("dwmapi.dll\DwmEnableMMCSS", "int", fEnableMMCSS, "int")
        return result
    }

    /**
     * Extends the window frame into the client area.
     * @remarks
     * This function must be called whenever Desktop Window Manager (DWM) composition is toggled. Handle the <a href="https://docs.microsoft.com/windows/desktop/dwm/wm-dwmcompositionchanged">WM_DWMCOMPOSITIONCHANGED</a> message for composition change notification. 
     * 
     * Use negative margin values to create the "sheet of glass" effect where the client area is rendered as a solid surface with no window border.
     * @param {Pointer<Void>} hWnd The handle to the window in which the frame will be extended into the client area.
     * @param {Pointer<MARGINS>} pMarInset A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/ns-uxtheme-margins">MARGINS</a> structure that describes the margins to use when extending the frame into the client area.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmextendframeintoclientarea
     * @since windows6.0.6000
     */
    static DwmExtendFrameIntoClientArea(hWnd, pMarInset) {
        result := DllCall("dwmapi.dll\DwmExtendFrameIntoClientArea", "ptr", hWnd, "ptr", pMarInset, "int")
        return result
    }

    /**
     * Retrieves the current color used for Desktop Window Manager (DWM) glass composition.
     * @remarks
     * The value pointed to by <i>pcrColorization</i> is in an 0xAARRGGBB format. Many Microsoft Win32 APIs, such as <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a>, use a 0x00BBGGRR format. Be careful to assure that the intended colors are used.
     * @param {Pointer<UInt32>} pcrColorization A pointer to a value that, when this function returns successfully, receives the current color used for glass composition. The color format of the value is 0xAARRGGBB.
     * @param {Pointer<Int32>} pfOpaqueBlend A pointer to a value that, when this function returns successfully, indicates whether the color is an opaque blend. <b>TRUE</b> if the color is an opaque blend; otherwise, <b>FALSE</b>.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmgetcolorizationcolor
     * @since windows6.0.6000
     */
    static DwmGetColorizationColor(pcrColorization, pfOpaqueBlend) {
        result := DllCall("dwmapi.dll\DwmGetColorizationColor", "uint*", pcrColorization, "int*", pfOpaqueBlend, "int")
        return result
    }

    /**
     * Retrieves the current composition timing information for a specified window.
     * @param {Pointer<Void>} hwnd The handle to the window for which the composition timing information should be retrieved.
     *         
     *                         
     * 
     * Starting with Windows 8.1, this parameter must be set to <b>NULL</b>. If this parameter is not set to <b>NULL</b>, <b>DwmGetCompositionTimingInfo</b> returns E_INVALIDARG.
     * @param {Pointer<DWM_TIMING_INFO>} pTimingInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/ns-dwmapi-dwm_timing_info">DWM_TIMING_INFO</a> structure that, when this function returns successfully, receives the current composition timing information for the window. The <b>cbSize</b> member of this structure must be set before this function is called.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmgetcompositiontiminginfo
     * @since windows6.0.6000
     */
    static DwmGetCompositionTimingInfo(hwnd, pTimingInfo) {
        result := DllCall("dwmapi.dll\DwmGetCompositionTimingInfo", "ptr", hwnd, "ptr", pTimingInfo, "int")
        return result
    }

    /**
     * Retrieves the current value of a specified Desktop Window Manager (DWM) attribute applied to a window.
     * @param {Pointer<Void>} hwnd The handle to the window from which the attribute value is to be retrieved.
     * @param {Integer} dwAttribute A flag describing which value to retrieve, specified as a value of the [DWMWINDOWATTRIBUTE](/windows/desktop/api/dwmapi/ne-dwmapi-dwmwindowattribute) enumeration. This parameter specifies which attribute to retrieve, and the *pvAttribute* parameter points to an object into which the attribute value is retrieved.
     * @param {Pointer} pvAttribute A pointer to a value which, when this function returns successfully, receives the current value of the attribute. The type of the retrieved value depends on the value of the *dwAttribute* parameter. The [**DWMWINDOWATTRIBUTE**](/windows/desktop/api/Dwmapi/ne-dwmapi-dwmwindowattribute) enumeration topic indicates, in the row for each flag, what type of value you should pass a pointer to in the *pvAttribute* parameter.
     * @param {Integer} cbAttribute The size, in bytes, of the attribute value being received via the *pvAttribute* parameter. The type of the retrieved value, and therefore its size in bytes, depends on the value of the *dwAttribute* parameter.
     * @returns {Integer} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/desktop/com/structure-of-com-error-codes) [error code](/windows/desktop/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmgetwindowattribute
     * @since windows6.0.6000
     */
    static DwmGetWindowAttribute(hwnd, dwAttribute, pvAttribute, cbAttribute) {
        result := DllCall("dwmapi.dll\DwmGetWindowAttribute", "ptr", hwnd, "uint", dwAttribute, "ptr", pvAttribute, "uint", cbAttribute, "int")
        return result
    }

    /**
     * Obtains a value that indicates whether Desktop Window Manager (DWM) composition is enabled. Applications on machines running Windows 7 or earlier can listen for composition state changes by handling the WM_DWMCOMPOSITIONCHANGED notification.
     * @param {Pointer<Int32>} pfEnabled A pointer to a value that, when this function returns successfully, receives <b>TRUE</b> if DWM composition is enabled; otherwise, <b>FALSE</b>.
     * 
     *                         
     * 
     * <div class="alert"><b>Note</b>  As of Windows 8, DWM composition is always enabled. If an app declares Windows 8 compatibility in their manifest, this function will receive a value of <b>TRUE</b> through <i>pfEnabled</i>. If no such manifest entry is found, Windows 8 compatibility is not assumed and this function receives a value of <b>FALSE</b> through <i>pfEnabled</i>. This is done so that older programs that interpret a value of <b>TRUE</b> to imply that high contrast mode is off can continue to make the correct decisions about rendering their images. (Note that this is a bad practice—you should use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-systemparametersinfoa">SystemParametersInfo</a> function with the <b>SPI_GETHIGHCONTRAST</b> flag to determine the state of high contrast mode.)</div>
     * <div> </div>
     * For more information, see <a href="https://docs.microsoft.com/windows/win32/controls/supporting-high-contrast-themes">Supporting High Contrast Themes</a>.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmiscompositionenabled
     * @since windows6.0.6000
     */
    static DwmIsCompositionEnabled(pfEnabled) {
        result := DllCall("dwmapi.dll\DwmIsCompositionEnabled", "int*", pfEnabled, "int")
        return result
    }

    /**
     * Changes the number of monitor refreshes through which the previous frame will be displayed. DwmModifyPreviousDxFrameDuration is no longer supported. Starting with Windows 8.1, calls to DwmModifyPreviousDxFrameDuration always return E_NOTIMPL.
     * @param {Pointer<Void>} hwnd The handle to the window for which the new duration is applied to the previous frame.
     * @param {Integer} cRefreshes The number of refreshes to apply to the previous frame.
     * @param {Integer} fRelative <b>TRUE</b> if the value given in <i>cRefreshes</i> is relative to the current value (added to or subtracted from it); <b>FALSE</b> if the value replaces the current value.
     * @returns {Integer} This function always returns S_OK, even when DWM is not running.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmmodifypreviousdxframeduration
     * @since windows6.0.6000
     */
    static DwmModifyPreviousDxFrameDuration(hwnd, cRefreshes, fRelative) {
        result := DllCall("dwmapi.dll\DwmModifyPreviousDxFrameDuration", "ptr", hwnd, "int", cRefreshes, "int", fRelative, "int")
        return result
    }

    /**
     * Retrieves the source size of the Desktop Window Manager (DWM) thumbnail.
     * @param {Pointer} hThumbnail A handle to the thumbnail to retrieve the source window size from.
     * @param {Pointer<SIZE>} pSize A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a> structure that, when this function returns successfully, receives the size of the source thumbnail.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmquerythumbnailsourcesize
     * @since windows6.0.6000
     */
    static DwmQueryThumbnailSourceSize(hThumbnail, pSize) {
        result := DllCall("dwmapi.dll\DwmQueryThumbnailSourceSize", "ptr", hThumbnail, "ptr", pSize, "int")
        return result
    }

    /**
     * Creates a Desktop Window Manager (DWM) thumbnail relationship between the destination and source windows.
     * @remarks
     * Registering a DWM thumbnail relationship will not modify desktop composition; for information about thumbnail positioning, see the documentation for the <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmupdatethumbnailproperties">DwmUpdateThumbnailProperties</a> function.
     * 
     * The window designated by <i>hwndDestination</i> must either be the desktop window itself or be owned by the process that is calling <b>DwmRegisterThumbnail</b>. This is required to prevent applications from affecting the content of other applications.
     * 
     * The thumbnail registration handle obtained by this function is not globally unique but is unique to the process. Call the <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmunregisterthumbnail">DwmUnregisterThumbnail</a> function to unregister the thumbnail. This must be done within the process that the relationship was registered in.
     * @param {Pointer<Void>} hwndDestination The handle to the window that will use the DWM thumbnail. Setting the destination window handle to anything other than a top-level window type will result in a return value of E_INVALIDARG.
     * @param {Pointer<Void>} hwndSource The handle to the window to use as the thumbnail source. Setting the source window handle to anything other than a top-level window type will result in a return value of E_INVALIDARG.
     * @param {Pointer<IntPtr>} phThumbnailId A pointer to a handle that, when this function returns successfully, represents the registration of the DWM thumbnail.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmregisterthumbnail
     * @since windows6.0.6000
     */
    static DwmRegisterThumbnail(hwndDestination, hwndSource, phThumbnailId) {
        result := DllCall("dwmapi.dll\DwmRegisterThumbnail", "ptr", hwndDestination, "ptr", hwndSource, "ptr*", phThumbnailId, "int")
        return result
    }

    /**
     * Sets the number of monitor refreshes through which to display the presented frame. DwmSetDxFrameDuration is no longer supported. Starting with Windows 8.1, calls to DwmSetDxFrameDuration always return E_NOTIMPL.
     * @remarks
     * The DWM will attempt to display the presented frame for at least the number of monitor refreshes specified. It might be impossible to display the frame for the precise number of refreshes due to the current composition rate. If the frame is presented late to the DWM or the DWM is late in composing, a frame could be displayed for fewer than the number of refreshes requested or even skipped completely.
     * @param {Pointer<Void>} hwnd The handle to the window that displays the presented frame.
     * @param {Integer} cRefreshes The number of refreshes through which to display the presented frame.
     * @returns {Integer} This function always returns S_OK, even when the frame duration is not changed or DWM is not running.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmsetdxframeduration
     * @since windows6.0.6000
     */
    static DwmSetDxFrameDuration(hwnd, cRefreshes) {
        result := DllCall("dwmapi.dll\DwmSetDxFrameDuration", "ptr", hwnd, "int", cRefreshes, "int")
        return result
    }

    /**
     * Sets the present parameters for frame composition. DwmSetPresentParameters is no longer supported. Starting with Windows 8.1, calls to DwmSetPresentParameters always return E_NOTIMPL.
     * @param {Pointer<Void>} hwnd The handle to the window where the present parameters are applied.
     * @param {Pointer<DWM_PRESENT_PARAMETERS>} pPresentParams A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/ns-dwmapi-dwm_present_parameters">DWM_PRESENT_PARAMETERS</a> structure that contains DWM video frame parameters for frame composition.
     * @returns {Integer} This function always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmsetpresentparameters
     * @since windows6.0.6000
     */
    static DwmSetPresentParameters(hwnd, pPresentParams) {
        result := DllCall("dwmapi.dll\DwmSetPresentParameters", "ptr", hwnd, "ptr", pPresentParams, "int")
        return result
    }

    /**
     * Sets the value of Desktop Window Manager (DWM) non-client rendering attributes for a window.
     * @remarks
     * It's not valid to call this function with the *dwAttribute* parameter set to **DWMWA_NCRENDERING_ENABLED**. To enable or disable non-client rendering, you should use the **DWMWA_NCRENDERING_POLICY** attribute, and set the desired value. For more info, and a code example, see [Controlling non-client region rendering](/windows/desktop/dwm/composition-ovw#controlling-non-client-region-rendering).
     * @param {Pointer<Void>} hwnd The handle to the window for which the attribute value is to be set.
     * @param {Integer} dwAttribute A flag describing which value to set, specified as a value of the [DWMWINDOWATTRIBUTE](/windows/desktop/api/dwmapi/ne-dwmapi-dwmwindowattribute) enumeration. This parameter specifies which attribute to set, and the *pvAttribute* parameter points to an object containing the attribute value.
     * @param {Pointer} pvAttribute A pointer to an object containing the attribute value to set. The type of the value set depends on the value of the *dwAttribute* parameter. The [**DWMWINDOWATTRIBUTE**](/windows/desktop/api/Dwmapi/ne-dwmapi-dwmwindowattribute) enumeration topic indicates, in the row for each flag, what type of value you should pass a pointer to in the *pvAttribute* parameter.
     * @param {Integer} cbAttribute The size, in bytes, of the attribute value being set via the *pvAttribute* parameter. The type of the value set, and therefore its size in bytes, depends on the value of the *dwAttribute* parameter.
     * @returns {Integer} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/desktop/com/structure-of-com-error-codes) [error code](/windows/desktop/com/com-error-codes-10).
     * 
     * If Desktop Composition has been disabled (Windows 7 and earlier), then this function returns **DWM_E_COMPOSITIONDISABLED**.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmsetwindowattribute
     * @since windows6.0.6000
     */
    static DwmSetWindowAttribute(hwnd, dwAttribute, pvAttribute, cbAttribute) {
        result := DllCall("dwmapi.dll\DwmSetWindowAttribute", "ptr", hwnd, "uint", dwAttribute, "ptr", pvAttribute, "uint", cbAttribute, "int")
        return result
    }

    /**
     * Removes a Desktop Window Manager (DWM) thumbnail relationship created by the DwmRegisterThumbnail function.
     * @remarks
     * Unregistering DWM thumbnail relationships must be done within the process that registered the relationships.
     * @param {Pointer} hThumbnailId The handle to the thumbnail relationship to be removed. Null or non-existent handles will result in a return value of E_INVALIDARG.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmunregisterthumbnail
     * @since windows6.0.6000
     */
    static DwmUnregisterThumbnail(hThumbnailId) {
        result := DllCall("dwmapi.dll\DwmUnregisterThumbnail", "ptr", hThumbnailId, "int")
        return result
    }

    /**
     * Updates the properties for a Desktop Window Manager (DWM) thumbnail.
     * @remarks
     * Thumbnail relationships created by the <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmregisterthumbnail">DwmRegisterThumbnail</a> function will not be rendered to the destination window until this function is called. Subsequent calls will update the thumbnail according to the provided properties.
     * @param {Pointer} hThumbnailId The handle to the DWM thumbnail to be updated. Null or invalid thumbnails, as well as thumbnails owned by other processes will result in a return value of E_INVALIDARG.
     * @param {Pointer<DWM_THUMBNAIL_PROPERTIES>} ptnProperties A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/ns-dwmapi-dwm_thumbnail_properties">DWM_THUMBNAIL_PROPERTIES</a> structure that contains the new thumbnail properties.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmupdatethumbnailproperties
     * @since windows6.0.6000
     */
    static DwmUpdateThumbnailProperties(hThumbnailId, ptnProperties) {
        result := DllCall("dwmapi.dll\DwmUpdateThumbnailProperties", "ptr", hThumbnailId, "ptr", ptnProperties, "int")
        return result
    }

    /**
     * Sets a static, iconic bitmap on a window or tab to use as a thumbnail representation. The taskbar can use this bitmap as a thumbnail switch target for the window or tab.
     * @remarks
     * An application typically calls the <b>DwmSetIconicThumbnail</b> function after it receives a <a href="https://docs.microsoft.com/windows/desktop/dwm/wm-dwmsendiconicthumbnail">WM_DWMSENDICONICTHUMBNAIL</a> message for its window. The thumbnail should not exceed the maximum x-coordinate and y-coordinate that are specified in that message. The thumbnail must also have a 32-bit color depth.
     * 
     * The application calls <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwminvalidateiconicbitmaps">DwmInvalidateIconicBitmaps</a> to indicate to the Desktop Window Manager (DWM) that the iconic thumbnail and live preview bitmaps are out-of-date and should be refreshed. The DWM then requests new versions from the window when they are needed. However, if the DWM bitmap cache is full, DWM will not request updated versions.
     * 
     * The DWM uses a copy of the bitmap, but the application can release this copy at any time because of memory constraints. If the copy is released, the window is not notified, but it might receive a subsequent <a href="https://docs.microsoft.com/windows/desktop/dwm/wm-dwmsendiconicthumbnail">WM_DWMSENDICONICTHUMBNAIL</a> request when its thumbnail is needed again. The caller retains ownership of the original bitmap and is responsible for freeing the resources that it uses when it is no longer needed.
     * @param {Pointer<Void>} hwnd A handle to the window or tab. This window must belong to the calling process.
     * @param {Pointer<Void>} hbmp A handle to the bitmap to represent the window that <i>hwnd</i> specifies.
     * @param {Integer} dwSITFlags 
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmseticonicthumbnail
     * @since windows6.1
     */
    static DwmSetIconicThumbnail(hwnd, hbmp, dwSITFlags) {
        result := DllCall("dwmapi.dll\DwmSetIconicThumbnail", "ptr", hwnd, "ptr", hbmp, "uint", dwSITFlags, "int")
        return result
    }

    /**
     * Sets a static, iconic bitmap to display a live preview (also known as a Peek preview) of a window or tab. The taskbar can use this bitmap to show a full-sized preview of a window or tab.
     * @remarks
     * A <i>live preview</i> (also known as a <i>Peek preview</i>) of a window appears when a user moves the mouse pointer over the window's thumbnail in the taskbar or gives the thumbnail focus in the ALT+TAB window. This view is a full-sized view of the window and can be a snapshot or an iconic representation.
     * 
     * A window typically calls the <b>DwmSetIconicLivePreviewBitmap</b> function in response to a <a href="https://docs.microsoft.com/windows/desktop/dwm/wm-dwmsendiconiclivepreviewbitmap">WM_DWMSENDICONICLIVEPREVIEWBITMAP</a> message. The returned bitmap must not be larger than the client area of the window or frame and must have 32-bit color depth.
     * 
     * The Desktop Window Manager (DWM) uses a copy of the bitmap, but the caller retains ownership of the original bitmap and is responsible for freeing the resources that it uses when it is no longer needed. The DWM does not keep its copy of the bitmap when the DWM stops displaying the live preview representation.
     * @param {Pointer<Void>} hwnd A handle to the window. This window must belong to the calling process.
     * @param {Pointer<Void>} hbmp A handle to the bitmap to represent the window that <i>hwnd</i> specifies.
     * @param {Pointer<POINT>} pptClient The offset of a tab window's <i>client region</i> (the content area inside the client window frame) from the host window's frame. This offset enables the tab window's contents to be drawn correctly in a live preview  when it is drawn without its frame.
     * @param {Integer} dwSITFlags The display options for the live preview. This parameter can be 0 or the following value.
     * @returns {Integer} Returns <b>S_OK</b> if the function succeeds, or an error value otherwise. Note that because this bitmap is not cached, if the window is not being previewed when an application calls this function, the function returns a success code but the bitmap is discarded and not used.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmseticoniclivepreviewbitmap
     * @since windows6.1
     */
    static DwmSetIconicLivePreviewBitmap(hwnd, hbmp, pptClient, dwSITFlags) {
        result := DllCall("dwmapi.dll\DwmSetIconicLivePreviewBitmap", "ptr", hwnd, "ptr", hbmp, "ptr", pptClient, "uint", dwSITFlags, "int")
        return result
    }

    /**
     * Called by an application to indicate that all previously provided iconic bitmaps from a window, both thumbnails and peek representations, should be refreshed.
     * @remarks
     * Calling this function causes the Desktop Window Manager (DWM) to invalidate its current bitmaps for the window and request new bitmaps from the window when they are next needed. <b>DwmInvalidateIconicBitmaps</b> should not be called frequently. Doing so can lead to poor performance as new bitmaps are created and retrieved.
     * @param {Pointer<Void>} hwnd A handle to the window or tab whose bitmaps are being invalidated through this call. This window must belong to the calling process.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwminvalidateiconicbitmaps
     * @since windows6.1
     */
    static DwmInvalidateIconicBitmaps(hwnd) {
        result := DllCall("dwmapi.dll\DwmInvalidateIconicBitmaps", "ptr", hwnd, "int")
        return result
    }

    /**
     * This function is not implemented. (DwmAttachMilContent)
     * @param {Pointer<Void>} hwnd 
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmattachmilcontent
     * @since windows6.0.6000
     */
    static DwmAttachMilContent(hwnd) {
        result := DllCall("dwmapi.dll\DwmAttachMilContent", "ptr", hwnd, "int")
        return result
    }

    /**
     * This function is not implemented. (DwmDetachMilContent)
     * @param {Pointer<Void>} hwnd 
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmdetachmilcontent
     * @since windows6.0.6000
     */
    static DwmDetachMilContent(hwnd) {
        result := DllCall("dwmapi.dll\DwmDetachMilContent", "ptr", hwnd, "int")
        return result
    }

    /**
     * Issues a flush call that blocks the caller until the next present, when all of the Microsoft DirectX surface updates that are currently outstanding have been made. This compensates for very complex scenes or calling processes with very low priority.
     * @remarks
     * <b>DwmFlush</b> waits for any queued DirectX changes that were queued by the calling application to be drawn to the screen before returning. It does not flush the entire session rendering batch.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmflush
     * @since windows6.0.6000
     */
    static DwmFlush() {
        result := DllCall("dwmapi.dll\DwmFlush", "int")
        return result
    }

    /**
     * This function is not implemented. (DwmGetGraphicsStreamTransformHint)
     * @param {Integer} uIndex 
     * @param {Pointer<MilMatrix3x2D>} pTransform 
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmgetgraphicsstreamtransformhint
     * @since windows6.0.6000
     */
    static DwmGetGraphicsStreamTransformHint(uIndex, pTransform) {
        result := DllCall("dwmapi.dll\DwmGetGraphicsStreamTransformHint", "uint", uIndex, "ptr", pTransform, "int")
        return result
    }

    /**
     * This function is not implemented. (DwmGetGraphicsStreamClient)
     * @param {Integer} uIndex 
     * @param {Pointer<Guid>} pClientUuid 
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmgetgraphicsstreamclient
     * @since windows6.0.6000
     */
    static DwmGetGraphicsStreamClient(uIndex, pClientUuid) {
        result := DllCall("dwmapi.dll\DwmGetGraphicsStreamClient", "uint", uIndex, "ptr", pClientUuid, "int")
        return result
    }

    /**
     * Retrieves transport attributes.
     * @param {Pointer<Int32>} pfIsRemoting A pointer to a <b>BOOL</b> value that indicates whether the transport supports remoting. <b>TRUE</b> if the transport supports remoting; otherwise, <b>FALSE</b>.
     * @param {Pointer<Int32>} pfIsConnected A pointer to a <b>BOOL</b> value that indicates whether the transport is connected. <b>TRUE</b> if the transport is connected; otherwise, <b>FALSE</b>.
     * @param {Pointer<UInt32>} pDwGeneration A pointer to a <b>DWORD</b> that receives a generation value for the transport.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmgettransportattributes
     * @since windows6.0.6000
     */
    static DwmGetTransportAttributes(pfIsRemoting, pfIsConnected, pDwGeneration) {
        result := DllCall("dwmapi.dll\DwmGetTransportAttributes", "int*", pfIsRemoting, "int*", pfIsConnected, "uint*", pDwGeneration, "int")
        return result
    }

    /**
     * Coordinates the animations of tool windows with the Desktop Window Manager (DWM).
     * @param {Pointer<Void>} hwnd Handle to the window.
     * @param {Integer} target 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmtransitionownedwindow
     * @since windows8.0
     */
    static DwmTransitionOwnedWindow(hwnd, target) {
        result := DllCall("dwmapi.dll\DwmTransitionOwnedWindow", "ptr", hwnd, "int", target, "int")
        return result
    }

    /**
     * Notifies Desktop Window Manager (DWM) that a touch contact has been recognized as a gesture, and that DWM should draw feedback for that gesture.
     * @param {Integer} gt 
     * @param {Integer} cContacts The number of contact points.
     * @param {Pointer<UInt32>} pdwPointerID The pointer ID.
     * @param {Pointer<POINT>} pPoints The points.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmrendergesture
     * @since windows8.0
     */
    static DwmRenderGesture(gt, cContacts, pdwPointerID, pPoints) {
        result := DllCall("dwmapi.dll\DwmRenderGesture", "int", gt, "uint", cContacts, "uint*", pdwPointerID, "ptr", pPoints, "int")
        return result
    }

    /**
     * Enables the graphical feedback of touch and drag interactions to the user.
     * @param {Integer} dwPointerID The pointer ID.
     * @param {Integer} fEnable Indicates whether the contact is enabled.
     * @param {Pointer} ptTether The tether.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmtethercontact
     * @since windows8.0
     */
    static DwmTetherContact(dwPointerID, fEnable, ptTether) {
        result := DllCall("dwmapi.dll\DwmTetherContact", "uint", dwPointerID, "int", fEnable, "ptr", ptTether, "int")
        return result
    }

    /**
     * Called by an app or framework to specify the visual feedback type to draw in response to a particular touch or pen contact.
     * @remarks
     * It is safe to call this function on the UI thread.
     * @param {Integer} dwPointerID The pointer ID of the contact. Each touch or pen contact is given a unique ID when it is detected.
     * @param {Integer} eShowContact 
     * @returns {Integer} If <i>dwPointerID</i> does not match that of a contact currently present on the screen, this function returns E_INVALIDARG; otherwise, it returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmshowcontact
     * @since windows8.0
     */
    static DwmShowContact(dwPointerID, eShowContact) {
        result := DllCall("dwmapi.dll\DwmShowContact", "uint", dwPointerID, "uint", eShowContact, "int")
        return result
    }

    /**
     * This function was part of an experimental feature that was never implemented in Windows. It has no effect and should not be used.
     * @param {Pointer<Void>} appWindow This parameter is not used.
     * @param {Pointer<Int32>} value 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwmapi/nf-dwmapi-dwmgetunmettabrequirements
     * @since windows10.0.17134
     */
    static DwmGetUnmetTabRequirements(appWindow, value) {
        result := DllCall("dwmapi.dll\DwmGetUnmetTabRequirements", "ptr", appWindow, "int*", value, "int")
        return result
    }

;@endregion Methods
}
