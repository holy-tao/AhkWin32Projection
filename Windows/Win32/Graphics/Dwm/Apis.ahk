#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
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
     * @param {HWND} hWnd A handle to the window procedure that received the message.
     * @param {Integer} msg The message.
     * @param {WPARAM} wParam Specifies additional message information. The content of this parameter depends on the value of the <i>msg</i> parameter.
     * @param {LPARAM} lParam Specifies additional message information. The content of this parameter depends on the value of the <i>msg</i> parameter.
     * @param {Pointer<LRESULT>} plResult A pointer to an <b>LRESULT</b> value that, when this method returns successfully,receives the result of the hit test.
     * @returns {BOOL} <b>TRUE</b> if <b>DwmDefWindowProc</b> handled the message; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmdefwindowproc
     * @since windows6.0.6000
     */
    static DwmDefWindowProc(hWnd, msg, wParam, lParam, plResult) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("dwmapi.dll\DwmDefWindowProc", "ptr", hWnd, "uint", msg, "ptr", wParam, "ptr", lParam, "ptr", plResult, "int")
        return result
    }

    /**
     * Enables the blur effect on a specified window.
     * @param {HWND} hWnd The handle to the window on which the blur-behind data is applied.
     * @param {Pointer<DWM_BLURBEHIND>} pBlurBehind `[in]`
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwmapi/ns-dwmapi-dwm_blurbehind">DWM_BLURBEHIND</a> structure that provides blur-behind data.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmenableblurbehindwindow
     * @since windows6.0.6000
     */
    static DwmEnableBlurBehindWindow(hWnd, pBlurBehind) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("dwmapi.dll\DwmEnableBlurBehindWindow", "ptr", hWnd, "ptr", pBlurBehind, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Enables or disables Desktop Window Manager (DWM) composition.
     * @param {Integer} uCompositionAction <b>DWM_EC_ENABLECOMPOSITION</b> to enable DWM composition; <b>DWM_EC_DISABLECOMPOSITION</b> to disable composition.
     *                         
     * 
     * <div class="alert"><b>Note</b>  As of Windows 8, calling this function with <b>DWM_EC_DISABLECOMPOSITION</b> has no effect. However, the function will still return a success code.</div>
     * <div> </div>
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmenablecomposition
     * @since windows6.0.6000
     */
    static DwmEnableComposition(uCompositionAction) {
        result := DllCall("dwmapi.dll\DwmEnableComposition", "uint", uCompositionAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Notifies the Desktop Window Manager (DWM) to opt in to or out of Multimedia Class Schedule Service (MMCSS) scheduling while the calling process is alive.
     * @param {BOOL} fEnableMMCSS <b>TRUE</b> to instruct DWM to participate in MMCSS scheduling; <b>FALSE</b> to opt out or end participation in MMCSS scheduling.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmenablemmcss
     * @since windows6.0.6000
     */
    static DwmEnableMMCSS(fEnableMMCSS) {
        result := DllCall("dwmapi.dll\DwmEnableMMCSS", "int", fEnableMMCSS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extends the window frame into the client area.
     * @param {HWND} hWnd The handle to the window in which the frame will be extended into the client area.
     * @param {Pointer<MARGINS>} pMarInset A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/ns-uxtheme-margins">MARGINS</a> structure that describes the margins to use when extending the frame into the client area.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmextendframeintoclientarea
     * @since windows6.0.6000
     */
    static DwmExtendFrameIntoClientArea(hWnd, pMarInset) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("dwmapi.dll\DwmExtendFrameIntoClientArea", "ptr", hWnd, "ptr", pMarInset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the current color used for Desktop Window Manager (DWM) glass composition.
     * @param {Pointer<UInt32>} pcrColorization A pointer to a value that, when this function returns successfully, receives the current color used for glass composition. The color format of the value is 0xAARRGGBB.
     * @param {Pointer<BOOL>} pfOpaqueBlend A pointer to a value that, when this function returns successfully, indicates whether the color is an opaque blend. <b>TRUE</b> if the color is an opaque blend; otherwise, <b>FALSE</b>.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmgetcolorizationcolor
     * @since windows6.0.6000
     */
    static DwmGetColorizationColor(pcrColorization, pfOpaqueBlend) {
        result := DllCall("dwmapi.dll\DwmGetColorizationColor", "uint*", pcrColorization, "ptr", pfOpaqueBlend, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the current composition timing information for a specified window.
     * @param {HWND} hwnd The handle to the window for which the composition timing information should be retrieved.
     *         
     *                         
     * 
     * Starting with Windows 8.1, this parameter must be set to <b>NULL</b>. If this parameter is not set to <b>NULL</b>, <b>DwmGetCompositionTimingInfo</b> returns E_INVALIDARG.
     * @param {Pointer<DWM_TIMING_INFO>} pTimingInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/ns-dwmapi-dwm_timing_info">DWM_TIMING_INFO</a> structure that, when this function returns successfully, receives the current composition timing information for the window. The <b>cbSize</b> member of this structure must be set before this function is called.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmgetcompositiontiminginfo
     * @since windows6.0.6000
     */
    static DwmGetCompositionTimingInfo(hwnd, pTimingInfo) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("dwmapi.dll\DwmGetCompositionTimingInfo", "ptr", hwnd, "ptr", pTimingInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the current value of a specified Desktop Window Manager (DWM) attribute applied to a window.
     * @param {HWND} hwnd The handle to the window from which the attribute value is to be retrieved.
     * @param {Integer} dwAttribute A flag describing which value to retrieve, specified as a value of the [DWMWINDOWATTRIBUTE](/windows/desktop/api/dwmapi/ne-dwmapi-dwmwindowattribute) enumeration. This parameter specifies which attribute to retrieve, and the *pvAttribute* parameter points to an object into which the attribute value is retrieved.
     * @param {Pointer} pvAttribute A pointer to a value which, when this function returns successfully, receives the current value of the attribute. The type of the retrieved value depends on the value of the *dwAttribute* parameter. The [**DWMWINDOWATTRIBUTE**](/windows/desktop/api/Dwmapi/ne-dwmapi-dwmwindowattribute) enumeration topic indicates, in the row for each flag, what type of value you should pass a pointer to in the *pvAttribute* parameter.
     * @param {Integer} cbAttribute The size, in bytes, of the attribute value being received via the *pvAttribute* parameter. The type of the retrieved value, and therefore its size in bytes, depends on the value of the *dwAttribute* parameter.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/desktop/com/structure-of-com-error-codes) [error code](/windows/desktop/com/com-error-codes-10).
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmgetwindowattribute
     * @since windows6.0.6000
     */
    static DwmGetWindowAttribute(hwnd, dwAttribute, pvAttribute, cbAttribute) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("dwmapi.dll\DwmGetWindowAttribute", "ptr", hwnd, "uint", dwAttribute, "ptr", pvAttribute, "uint", cbAttribute, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Obtains a value that indicates whether Desktop Window Manager (DWM) composition is enabled. Applications on machines running Windows 7 or earlier can listen for composition state changes by handling the WM_DWMCOMPOSITIONCHANGED notification.
     * @param {Pointer<BOOL>} pfEnabled A pointer to a value that, when this function returns successfully, receives <b>TRUE</b> if DWM composition is enabled; otherwise, <b>FALSE</b>.
     * 
     *                         
     * 
     * <div class="alert"><b>Note</b>  As of Windows 8, DWM composition is always enabled. If an app declares Windows 8 compatibility in their manifest, this function will receive a value of <b>TRUE</b> through <i>pfEnabled</i>. If no such manifest entry is found, Windows 8 compatibility is not assumed and this function receives a value of <b>FALSE</b> through <i>pfEnabled</i>. This is done so that older programs that interpret a value of <b>TRUE</b> to imply that high contrast mode is off can continue to make the correct decisions about rendering their images. (Note that this is a bad practice—you should use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-systemparametersinfoa">SystemParametersInfo</a> function with the <b>SPI_GETHIGHCONTRAST</b> flag to determine the state of high contrast mode.)</div>
     * <div> </div>
     * For more information, see <a href="https://docs.microsoft.com/windows/win32/controls/supporting-high-contrast-themes">Supporting High Contrast Themes</a>.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmiscompositionenabled
     * @since windows6.0.6000
     */
    static DwmIsCompositionEnabled(pfEnabled) {
        result := DllCall("dwmapi.dll\DwmIsCompositionEnabled", "ptr", pfEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Changes the number of monitor refreshes through which the previous frame will be displayed. DwmModifyPreviousDxFrameDuration is no longer supported. Starting with Windows 8.1, calls to DwmModifyPreviousDxFrameDuration always return E_NOTIMPL.
     * @param {HWND} hwnd The handle to the window for which the new duration is applied to the previous frame.
     * @param {Integer} cRefreshes The number of refreshes to apply to the previous frame.
     * @param {BOOL} fRelative <b>TRUE</b> if the value given in <i>cRefreshes</i> is relative to the current value (added to or subtracted from it); <b>FALSE</b> if the value replaces the current value.
     * @returns {HRESULT} This function always returns S_OK, even when DWM is not running.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmmodifypreviousdxframeduration
     * @since windows6.0.6000
     */
    static DwmModifyPreviousDxFrameDuration(hwnd, cRefreshes, fRelative) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("dwmapi.dll\DwmModifyPreviousDxFrameDuration", "ptr", hwnd, "int", cRefreshes, "int", fRelative, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the source size of the Desktop Window Manager (DWM) thumbnail.
     * @param {Pointer} hThumbnail A handle to the thumbnail to retrieve the source window size from.
     * @param {Pointer<SIZE>} pSize A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that, when this function returns successfully, receives the size of the source thumbnail.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmquerythumbnailsourcesize
     * @since windows6.0.6000
     */
    static DwmQueryThumbnailSourceSize(hThumbnail, pSize) {
        result := DllCall("dwmapi.dll\DwmQueryThumbnailSourceSize", "ptr", hThumbnail, "ptr", pSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a Desktop Window Manager (DWM) thumbnail relationship between the destination and source windows.
     * @param {HWND} hwndDestination The handle to the window that will use the DWM thumbnail. Setting the destination window handle to anything other than a top-level window type will result in a return value of E_INVALIDARG.
     * @param {HWND} hwndSource The handle to the window to use as the thumbnail source. Setting the source window handle to anything other than a top-level window type will result in a return value of E_INVALIDARG.
     * @param {Pointer<IntPtr>} phThumbnailId A pointer to a handle that, when this function returns successfully, represents the registration of the DWM thumbnail.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmregisterthumbnail
     * @since windows6.0.6000
     */
    static DwmRegisterThumbnail(hwndDestination, hwndSource, phThumbnailId) {
        hwndDestination := hwndDestination is Win32Handle ? NumGet(hwndDestination, "ptr") : hwndDestination
        hwndSource := hwndSource is Win32Handle ? NumGet(hwndSource, "ptr") : hwndSource

        result := DllCall("dwmapi.dll\DwmRegisterThumbnail", "ptr", hwndDestination, "ptr", hwndSource, "ptr*", phThumbnailId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the number of monitor refreshes through which to display the presented frame. DwmSetDxFrameDuration is no longer supported. Starting with Windows 8.1, calls to DwmSetDxFrameDuration always return E_NOTIMPL.
     * @param {HWND} hwnd The handle to the window that displays the presented frame.
     * @param {Integer} cRefreshes The number of refreshes through which to display the presented frame.
     * @returns {HRESULT} This function always returns S_OK, even when the frame duration is not changed or DWM is not running.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmsetdxframeduration
     * @since windows6.0.6000
     */
    static DwmSetDxFrameDuration(hwnd, cRefreshes) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("dwmapi.dll\DwmSetDxFrameDuration", "ptr", hwnd, "int", cRefreshes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the present parameters for frame composition. DwmSetPresentParameters is no longer supported. Starting with Windows 8.1, calls to DwmSetPresentParameters always return E_NOTIMPL.
     * @param {HWND} hwnd The handle to the window where the present parameters are applied.
     * @param {Pointer<DWM_PRESENT_PARAMETERS>} pPresentParams A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/ns-dwmapi-dwm_present_parameters">DWM_PRESENT_PARAMETERS</a> structure that contains DWM video frame parameters for frame composition.
     * @returns {HRESULT} This function always returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmsetpresentparameters
     * @since windows6.0.6000
     */
    static DwmSetPresentParameters(hwnd, pPresentParams) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("dwmapi.dll\DwmSetPresentParameters", "ptr", hwnd, "ptr", pPresentParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the value of Desktop Window Manager (DWM) non-client rendering attributes for a window.
     * @param {HWND} hwnd The handle to the window for which the attribute value is to be set.
     * @param {Integer} dwAttribute A flag describing which value to set, specified as a value of the [DWMWINDOWATTRIBUTE](/windows/desktop/api/dwmapi/ne-dwmapi-dwmwindowattribute) enumeration. This parameter specifies which attribute to set, and the *pvAttribute* parameter points to an object containing the attribute value.
     * @param {Pointer} pvAttribute A pointer to an object containing the attribute value to set. The type of the value set depends on the value of the *dwAttribute* parameter. The [**DWMWINDOWATTRIBUTE**](/windows/desktop/api/Dwmapi/ne-dwmapi-dwmwindowattribute) enumeration topic indicates, in the row for each flag, what type of value you should pass a pointer to in the *pvAttribute* parameter.
     * @param {Integer} cbAttribute The size, in bytes, of the attribute value being set via the *pvAttribute* parameter. The type of the value set, and therefore its size in bytes, depends on the value of the *dwAttribute* parameter.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/desktop/com/structure-of-com-error-codes) [error code](/windows/desktop/com/com-error-codes-10).
     * 
     * If Desktop Composition has been disabled (Windows 7 and earlier), then this function returns **DWM_E_COMPOSITIONDISABLED**.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmsetwindowattribute
     * @since windows6.0.6000
     */
    static DwmSetWindowAttribute(hwnd, dwAttribute, pvAttribute, cbAttribute) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("dwmapi.dll\DwmSetWindowAttribute", "ptr", hwnd, "uint", dwAttribute, "ptr", pvAttribute, "uint", cbAttribute, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes a Desktop Window Manager (DWM) thumbnail relationship created by the DwmRegisterThumbnail function.
     * @param {Pointer} hThumbnailId The handle to the thumbnail relationship to be removed. Null or non-existent handles will result in a return value of E_INVALIDARG.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmunregisterthumbnail
     * @since windows6.0.6000
     */
    static DwmUnregisterThumbnail(hThumbnailId) {
        result := DllCall("dwmapi.dll\DwmUnregisterThumbnail", "ptr", hThumbnailId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Updates the properties for a Desktop Window Manager (DWM) thumbnail.
     * @param {Pointer} hThumbnailId The handle to the DWM thumbnail to be updated. Null or invalid thumbnails, as well as thumbnails owned by other processes will result in a return value of E_INVALIDARG.
     * @param {Pointer<DWM_THUMBNAIL_PROPERTIES>} ptnProperties A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/ns-dwmapi-dwm_thumbnail_properties">DWM_THUMBNAIL_PROPERTIES</a> structure that contains the new thumbnail properties.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmupdatethumbnailproperties
     * @since windows6.0.6000
     */
    static DwmUpdateThumbnailProperties(hThumbnailId, ptnProperties) {
        result := DllCall("dwmapi.dll\DwmUpdateThumbnailProperties", "ptr", hThumbnailId, "ptr", ptnProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets a static, iconic bitmap on a window or tab to use as a thumbnail representation. The taskbar can use this bitmap as a thumbnail switch target for the window or tab.
     * @param {HWND} hwnd A handle to the window or tab. This window must belong to the calling process.
     * @param {HBITMAP} hbmp A handle to the bitmap to represent the window that <i>hwnd</i> specifies.
     * @param {Integer} dwSITFlags 
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmseticonicthumbnail
     * @since windows6.1
     */
    static DwmSetIconicThumbnail(hwnd, hbmp, dwSITFlags) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        hbmp := hbmp is Win32Handle ? NumGet(hbmp, "ptr") : hbmp

        result := DllCall("dwmapi.dll\DwmSetIconicThumbnail", "ptr", hwnd, "ptr", hbmp, "uint", dwSITFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets a static, iconic bitmap to display a live preview (also known as a Peek preview) of a window or tab. The taskbar can use this bitmap to show a full-sized preview of a window or tab.
     * @param {HWND} hwnd A handle to the window. This window must belong to the calling process.
     * @param {HBITMAP} hbmp A handle to the bitmap to represent the window that <i>hwnd</i> specifies.
     * @param {Pointer<POINT>} pptClient The offset of a tab window's <i>client region</i> (the content area inside the client window frame) from the host window's frame. This offset enables the tab window's contents to be drawn correctly in a live preview  when it is drawn without its frame.
     * @param {Integer} dwSITFlags The display options for the live preview. This parameter can be 0 or the following value.
     * @returns {HRESULT} Returns <b>S_OK</b> if the function succeeds, or an error value otherwise. Note that because this bitmap is not cached, if the window is not being previewed when an application calls this function, the function returns a success code but the bitmap is discarded and not used.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmseticoniclivepreviewbitmap
     * @since windows6.1
     */
    static DwmSetIconicLivePreviewBitmap(hwnd, hbmp, pptClient, dwSITFlags) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        hbmp := hbmp is Win32Handle ? NumGet(hbmp, "ptr") : hbmp

        result := DllCall("dwmapi.dll\DwmSetIconicLivePreviewBitmap", "ptr", hwnd, "ptr", hbmp, "ptr", pptClient, "uint", dwSITFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Called by an application to indicate that all previously provided iconic bitmaps from a window, both thumbnails and peek representations, should be refreshed.
     * @param {HWND} hwnd A handle to the window or tab whose bitmaps are being invalidated through this call. This window must belong to the calling process.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwminvalidateiconicbitmaps
     * @since windows6.1
     */
    static DwmInvalidateIconicBitmaps(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("dwmapi.dll\DwmInvalidateIconicBitmaps", "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function is not implemented.
     * @param {HWND} hwnd 
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmattachmilcontent
     * @since windows6.0.6000
     */
    static DwmAttachMilContent(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("dwmapi.dll\DwmAttachMilContent", "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function is not implemented.
     * @param {HWND} hwnd 
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmdetachmilcontent
     * @since windows6.0.6000
     */
    static DwmDetachMilContent(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("dwmapi.dll\DwmDetachMilContent", "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Issues a flush call that blocks the caller until the next present, when all of the Microsoft DirectX surface updates that are currently outstanding have been made. This compensates for very complex scenes or calling processes with very low priority.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmflush
     * @since windows6.0.6000
     */
    static DwmFlush() {
        result := DllCall("dwmapi.dll\DwmFlush", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function is not implemented.
     * @param {Integer} uIndex 
     * @param {Pointer<MilMatrix3x2D>} pTransform 
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmgetgraphicsstreamtransformhint
     * @since windows6.0.6000
     */
    static DwmGetGraphicsStreamTransformHint(uIndex, pTransform) {
        result := DllCall("dwmapi.dll\DwmGetGraphicsStreamTransformHint", "uint", uIndex, "ptr", pTransform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function is not implemented.
     * @param {Integer} uIndex 
     * @param {Pointer<Guid>} pClientUuid 
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmgetgraphicsstreamclient
     * @since windows6.0.6000
     */
    static DwmGetGraphicsStreamClient(uIndex, pClientUuid) {
        result := DllCall("dwmapi.dll\DwmGetGraphicsStreamClient", "uint", uIndex, "ptr", pClientUuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves transport attributes.
     * @param {Pointer<BOOL>} pfIsRemoting A pointer to a <b>BOOL</b> value that indicates whether the transport supports remoting. <b>TRUE</b> if the transport supports remoting; otherwise, <b>FALSE</b>.
     * @param {Pointer<BOOL>} pfIsConnected A pointer to a <b>BOOL</b> value that indicates whether the transport is connected. <b>TRUE</b> if the transport is connected; otherwise, <b>FALSE</b>.
     * @param {Pointer<UInt32>} pDwGeneration A pointer to a <b>DWORD</b> that receives a generation value for the transport.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmgettransportattributes
     * @since windows6.0.6000
     */
    static DwmGetTransportAttributes(pfIsRemoting, pfIsConnected, pDwGeneration) {
        result := DllCall("dwmapi.dll\DwmGetTransportAttributes", "ptr", pfIsRemoting, "ptr", pfIsConnected, "uint*", pDwGeneration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Coordinates the animations of tool windows with the Desktop Window Manager (DWM).
     * @param {HWND} hwnd Handle to the window.
     * @param {Integer} target 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmtransitionownedwindow
     * @since windows8.0
     */
    static DwmTransitionOwnedWindow(hwnd, target) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("dwmapi.dll\DwmTransitionOwnedWindow", "ptr", hwnd, "int", target, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Notifies Desktop Window Manager (DWM) that a touch contact has been recognized as a gesture, and that DWM should draw feedback for that gesture.
     * @param {Integer} gt 
     * @param {Integer} cContacts The number of contact points.
     * @param {Pointer<UInt32>} pdwPointerID The pointer ID.
     * @param {Pointer<POINT>} pPoints The points.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmrendergesture
     * @since windows8.0
     */
    static DwmRenderGesture(gt, cContacts, pdwPointerID, pPoints) {
        result := DllCall("dwmapi.dll\DwmRenderGesture", "int", gt, "uint", cContacts, "uint*", pdwPointerID, "ptr", pPoints, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Enables the graphical feedback of touch and drag interactions to the user.
     * @param {Integer} dwPointerID The pointer ID.
     * @param {BOOL} fEnable Indicates whether the contact is enabled.
     * @param {POINT} ptTether The tether.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmtethercontact
     * @since windows8.0
     */
    static DwmTetherContact(dwPointerID, fEnable, ptTether) {
        result := DllCall("dwmapi.dll\DwmTetherContact", "uint", dwPointerID, "int", fEnable, "ptr", ptTether, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Called by an app or framework to specify the visual feedback type to draw in response to a particular touch or pen contact.
     * @param {Integer} dwPointerID The pointer ID of the contact. Each touch or pen contact is given a unique ID when it is detected.
     * @param {Integer} eShowContact 
     * @returns {HRESULT} If <i>dwPointerID</i> does not match that of a contact currently present on the screen, this function returns E_INVALIDARG; otherwise, it returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmshowcontact
     * @since windows8.0
     */
    static DwmShowContact(dwPointerID, eShowContact) {
        result := DllCall("dwmapi.dll\DwmShowContact", "uint", dwPointerID, "uint", eShowContact, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Note  This function is publically available, but nonfunctional, for Windows 10, version 1803.Checks the requirements needed to get tabs in the application title bar for the specified window.
     * @param {HWND} appWindow The handle of the window to check.
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//dwmapi/nf-dwmapi-dwmgetunmettabrequirements
     * @since windows10.0.17134
     */
    static DwmGetUnmetTabRequirements(appWindow, value) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := DllCall("dwmapi.dll\DwmGetUnmetTabRequirements", "ptr", appWindow, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
