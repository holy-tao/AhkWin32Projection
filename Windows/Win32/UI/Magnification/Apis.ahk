#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.UI.Magnification
 * @version v4.0.30319
 */
class Magnification {

;@region Constants

    /**
     * @type {String}
     */
    static WC_MAGNIFIERA => "Magnifier"

    /**
     * @type {String}
     */
    static WC_MAGNIFIERW => "Magnifier"

    /**
     * @type {String}
     */
    static WC_MAGNIFIER => "Magnifier"

    /**
     * @type {Integer (Int32)}
     */
    static MS_SHOWMAGNIFIEDCURSOR => 1

    /**
     * @type {Integer (Int32)}
     */
    static MS_CLIPAROUNDCURSOR => 2

    /**
     * @type {Integer (Int32)}
     */
    static MS_INVERTCOLORS => 4
;@endregion Constants

;@region Methods
    /**
     * Creates and initializes the magnifier run-time objects.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Returns <b>TRUE</b> if initialization was successful; otherwise <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/magnification/nf-magnification-maginitialize
     * @since windows6.0.6000
     */
    static MagInitialize() {
        result := DllCall("MAGNIFICATION.dll\MagInitialize", "int")
        return result
    }

    /**
     * Destroys the magnifier run-time objects.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/magnification/nf-magnification-maguninitialize
     * @since windows6.0.6000
     */
    static MagUninitialize() {
        result := DllCall("MAGNIFICATION.dll\MagUninitialize", "int")
        return result
    }

    /**
     * Sets the source rectangle for the magnification window.
     * @param {HWND} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The magnification window.
     * @param {RECT} rect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The rectangle to be magnified, in desktop coordinates.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/magnification/nf-magnification-magsetwindowsource
     * @since windows6.0.6000
     */
    static MagSetWindowSource(hwnd, rect) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("MAGNIFICATION.dll\MagSetWindowSource", "ptr", hwnd, "ptr", rect, "int")
        return result
    }

    /**
     * Gets the rectangle of the area that is being magnified.
     * @param {HWND} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The magnification window.
     * @param {Pointer<RECT>} pRect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * The rectangle that is being magnified, in desktop coordinates.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/magnification/nf-magnification-maggetwindowsource
     * @since windows6.0.6000
     */
    static MagGetWindowSource(hwnd, pRect) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("MAGNIFICATION.dll\MagGetWindowSource", "ptr", hwnd, "ptr", pRect, "int")
        return result
    }

    /**
     * Sets the transformation matrix for a magnifier control.
     * @remarks
     * The transformation matrix specifies the magnification factor that the magnifier control applies to the contents of the source rectangle.
     * @param {HWND} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The magnification window.
     * @param {Pointer<MAGTRANSFORM>} pTransform Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/magnification/ns-magnification-magtransform">PMAGTRANSFORM</a></b>
     * 
     * A transformation matrix.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/magnification/nf-magnification-magsetwindowtransform
     * @since windows6.0.6000
     */
    static MagSetWindowTransform(hwnd, pTransform) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("MAGNIFICATION.dll\MagSetWindowTransform", "ptr", hwnd, "ptr", pTransform, "int")
        return result
    }

    /**
     * Retrieves the transformation matrix associated with a magnifier control.
     * @remarks
     * The transformation matrix specifies the magnification factor that the magnifier control applies to the contents of the source rectangle.
     * @param {HWND} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The magnification window.
     * @param {Pointer<MAGTRANSFORM>} pTransform Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/magnification/ns-magnification-magtransform">PMAGTRANSFORM</a></b>
     * 
     * The transformation matrix.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/magnification/nf-magnification-maggetwindowtransform
     * @since windows6.0.6000
     */
    static MagGetWindowTransform(hwnd, pTransform) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("MAGNIFICATION.dll\MagGetWindowTransform", "ptr", hwnd, "ptr", pTransform, "int")
        return result
    }

    /**
     * Sets the list of windows to be magnified or the list of windows to be excluded from magnification.
     * @remarks
     * This function requires Windows Display Driver Model (WDDM)-capable video cards.
     * 
     * Only one window list is used. You can specify either MW_FILTERMODE_INCLUDE or MW_FILTERMODE_EXCLUDE, 
     * 		depending on whether it is more convenient to list included windows or excluded windows.
     * 
     * The magnification window itself is automatically excluded.
     * @param {HWND} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The handle of the magnification window.
     * @param {Integer} dwFilterMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @param {Integer} count Type: <b>int</b>
     * 
     * The number of window handles in the list.
     * @param {Pointer<HWND>} pHWND Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a>*</b>
     * 
     * The list of window handles.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/magnification/nf-magnification-magsetwindowfilterlist
     * @since windows6.0.6000
     */
    static MagSetWindowFilterList(hwnd, dwFilterMode, count, pHWND) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("MAGNIFICATION.dll\MagSetWindowFilterList", "ptr", hwnd, "uint", dwFilterMode, "int", count, "ptr", pHWND, "int")
        return result
    }

    /**
     * Retrieves the list of windows that are magnified or excluded from magnification.
     * @remarks
     * First call the method with a <i>count</i> of 0 to retrieve the count of windows in the filter list. Use the retrieved count to allocate
     * 			sufficient memory for the retrieved list of window handles.
     * 
     * This function requires Windows Display Driver Model (WDDM)-capable video cards.
     * @param {HWND} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The magnification window.
     * @param {Pointer<Integer>} pdwFilterMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * The filter mode, as set by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/magnification/nf-magnification-magsetwindowfilterlist">MagSetWindowFilterList</a>.
     * @param {Integer} count Type: <b>int</b>
     * 
     * The number of windows to retrieve, or 0 to retrieve a count of windows in the filter list.
     * @param {Pointer<HWND>} pHWND Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a>*</b>
     * 
     * The list of window handles.
     * @returns {Integer} Type: <b>int</b>
     * 
     * Returns the count of window handles in the filter list, or -1 if the <i>hwnd</i> parameter is not valid.
     * @see https://learn.microsoft.com/windows/win32/api/magnification/nf-magnification-maggetwindowfilterlist
     * @since windows6.0.6000
     */
    static MagGetWindowFilterList(hwnd, pdwFilterMode, count, pHWND) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        pdwFilterModeMarshal := pdwFilterMode is VarRef ? "uint*" : "ptr"

        result := DllCall("MAGNIFICATION.dll\MagGetWindowFilterList", "ptr", hwnd, pdwFilterModeMarshal, pdwFilterMode, "int", count, "ptr", pHWND, "int")
        return result
    }

    /**
     * Sets the callback function for external image filtering and scaling.
     * @remarks
     * This function requires Windows Display Driver Model (WDDM)-capable video cards.
     * 
     * This function works only when <a href="https://docs.microsoft.com/windows/desktop/dwm/dwm-overview">Desktop Window Manager</a> (DWM) is off.
     * 
     * This callback mechanism enables custom image filtering and scaling mechanisms. Filtering might include bilinear, trilinear, bicubic, and flat. The mechanism also enables edge detection and enhancement.
     * 
     * The only transform that can be performed within the callback is scaling. Rotations and skews that may compose the arbitrary transform passed to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/magnification/nf-magnification-magsetwindowtransform">MagSetWindowTransform</a> function are performed after the callback function returns.
     * 
     * The specified function is called by the magnification engine for all rasterized Windows Graphics Device Interface (GDI) bitmaps before they are composited.
     * 
     * 	
     * After the callback function returns, the bitmap in video memory can have one of the following size states:
     * 
     * 
     * <ul>
     * <li>Unscaled. The returned bitmap is the same size as the bitmap passed by the caller. The magnification engine does the scaling 
     * by the transform specified in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/magnification/nf-magnification-magsetwindowtransform">MagSetWindowTransform</a> function.
     * </li>
     * <li>Scaled. The returned bitmap is scaled by the transform specified in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/magnification/nf-magnification-magsetwindowtransform">MagSetWindowTransform</a>.
     * </li>
     * </ul>
     * If no callback is registered, the magnification engine scales bitmaps by the transform specified in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/magnification/nf-magnification-magsetwindowtransform">MagSetWindowTransform</a>.
     * 
     * 
     * Windows Presentation Foundation (WPF) bitmaps can be scaled automatically using flat, bilinear, bicubic filtering and 
     * consequently do not use this callback mechanism.
     * @param {HWND} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The handle of the magnification window.
     * @param {Pointer<MagImageScalingCallback>} callback Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/magnification/nc-magnification-magimagescalingcallback">MagImageScalingCallback</a></b>
     * 
     * The callback function, or <b>NULL</b> to remove a callback that was previously set.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/magnification/nf-magnification-magsetimagescalingcallback
     * @since windows6.0.6000
     */
    static MagSetImageScalingCallback(hwnd, callback) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("MAGNIFICATION.dll\MagSetImageScalingCallback", "ptr", hwnd, "ptr", callback, "int")
        return result
    }

    /**
     * Retrieves the registered callback function that implements a custom transform for image scaling.
     * @remarks
     * This function returns <b>NULL</b> if Windows Display Driver Model (WDDM) is not supported.
     * 
     * This function works only when <a href="https://docs.microsoft.com/windows/desktop/dwm/dwm-overview">Desktop Window Manager</a> (DWM) is off.
     * @param {HWND} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The magnification window.
     * @returns {Pointer<MagImageScalingCallback>} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/magnification/nc-magnification-magimagescalingcallback">MagImageScalingCallback</a></b>
     * 
     * Returns the registered <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/magnification/nc-magnification-magimagescalingcallback">MagImageScalingCallback</a> callback function, or <b>NULL</b> if no callback is registered.
     * @see https://learn.microsoft.com/windows/win32/api/magnification/nf-magnification-maggetimagescalingcallback
     * @since windows6.0.6000
     */
    static MagGetImageScalingCallback(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("MAGNIFICATION.dll\MagGetImageScalingCallback", "ptr", hwnd, "ptr")
        return result
    }

    /**
     * Sets the color transformation matrix for a magnifier control.
     * @remarks
     * The magnifier control uses the color transformation matrix to apply a color effect to the entire magnifier window. If the function is called multiple times, the most recent color transform is used.
     * 
     * This function requires Windows Display Driver Model (WDDM)-capable video cards.
     * @param {HWND} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The magnification window.
     * @param {Pointer<MAGCOLOREFFECT>} pEffect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/magnification/ns-magnification-magcoloreffect">PMAGCOLOREFFECT</a></b>
     * 
     * The color transformation matrix, or <b>NULL</b> to remove the current color effect, if any.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/magnification/nf-magnification-magsetcoloreffect
     * @since windows6.0.6000
     */
    static MagSetColorEffect(hwnd, pEffect) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("MAGNIFICATION.dll\MagSetColorEffect", "ptr", hwnd, "ptr", pEffect, "int")
        return result
    }

    /**
     * Gets the color transformation matrix for a magnifier control.
     * @remarks
     * The magnifier control uses the color transformation matrix to apply a color effect to the entire magnifier window. 
     * 
     * This function requires Windows Display Driver Model (WDDM)-capable video cards.
     * @param {HWND} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The magnification window.
     * @param {Pointer<MAGCOLOREFFECT>} pEffect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/magnification/ns-magnification-magcoloreffect">PMAGCOLOREFFECT</a></b>
     * 
     * The color transformation matrix, or <b>NULL</b> if no color effect has been set.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/magnification/nf-magnification-maggetcoloreffect
     * @since windows6.0.6000
     */
    static MagGetColorEffect(hwnd, pEffect) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("MAGNIFICATION.dll\MagGetColorEffect", "ptr", hwnd, "ptr", pEffect, "int")
        return result
    }

    /**
     * Changes the magnification settings for the full-screen magnifier.
     * @remarks
     * The offsets are not affected by the current dots per inch (dpi) settings.
     * 
     * The magnification factor is applied to the current mouse cursor visuals, including cursor visuals affected by the mouse-related settings in the Ease of Access control panel.
     * 
     * In a multiple monitor environment, to position the upper-left corner of the magnified view to the left of the primary monitor, the offsets must be adjusted by the upper-left corner of the virtual screen and the magnification factor being applied. (The virtual screen is the bounding rectangle of all display monitors.) For an example that shows how to position the upper-left corner of the magnified view to the left of the primary monitor, see [Examples](#examples).
     * 
     * Beginning with Windows 10 Creators Update (version 1703), you must use the [MagSetInputTransform function](nf-magnification-magsetinputtransform.md) for input to route to the magnified element.
     * @param {Float} magLevel Type: **float**
     * 
     * The new magnification factor for the full-screen magnifier.  The minimum value of this parameter is 1.0, and the maximum value is 4096.0. If this value is 1.0, the screen content is not magnified and no offsets are applied.
     * @param {Integer} xOffset Type: **int**
     * 
     * The new x-coordinate offset, in pixels, for the upper-left corner of the magnified view. The offset is relative to the upper-left corner of the primary monitor, in unmagnified coordinates. The minimum value of the parameter is -262144, and the maximum value is 262144.
     * @param {Integer} yOffset Type: **int**
     * 
     * The new y-coordinate offset, in pixels, for the upper-left corner of the magnified view.  The offset is relative to the upper-left corner of the primary monitor, in unmagnified coordinates. The minimum value of the parameter is -262144, and the maximum value is 262144.
     * @returns {BOOL} Type: **BOOL**
     * 
     * Returns TRUE if successful. Otherwise, FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/magnification/nf-magnification-magsetfullscreentransform
     * @since windows8.0
     */
    static MagSetFullscreenTransform(magLevel, xOffset, yOffset) {
        result := DllCall("MAGNIFICATION.dll\MagSetFullscreenTransform", "float", magLevel, "int", xOffset, "int", yOffset, "int")
        return result
    }

    /**
     * Retrieves the magnification settings for the full-screen magnifier.
     * @remarks
     * The offsets are not affected by the current dots per inch (dpi) setting.
     * @param {Pointer<Float>} pMagLevel Type: <b>float*</b>
     * 
     * The current magnification factor for the full-screen magnifier.  A value of 1.0 indicates that the screen content is not being magnified. A value above 1.0 indicates the scale factor for magnification. A value less than 1.0 is not valid.
     * @param {Pointer<Integer>} pxOffset Type: <b>int*</b>
     * 
     * The x-coordinate offset for the upper-left corner of the unmagnified view.  The offset is relative to the upper-left corner of the primary monitor, in unmagnified coordinates.
     * @param {Pointer<Integer>} pyOffset Type: <b>int*</b>
     * 
     * The y-coordinate offset for the upper-left corner of the unmagnified view.  The offset is relative to the upper-left corner of the primary monitor, in unmagnified coordinates.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Returns TRUE if successful, or FALSE otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/magnification/nf-magnification-maggetfullscreentransform
     * @since windows8.0
     */
    static MagGetFullscreenTransform(pMagLevel, pxOffset, pyOffset) {
        pMagLevelMarshal := pMagLevel is VarRef ? "float*" : "ptr"
        pxOffsetMarshal := pxOffset is VarRef ? "int*" : "ptr"
        pyOffsetMarshal := pyOffset is VarRef ? "int*" : "ptr"

        result := DllCall("MAGNIFICATION.dll\MagGetFullscreenTransform", pMagLevelMarshal, pMagLevel, pxOffsetMarshal, pxOffset, pyOffsetMarshal, pyOffset, "int")
        return result
    }

    /**
     * Changes the color transformation matrix associated with the full-screen magnifier.
     * @remarks
     * The full-screen magnifier uses the color transformation matrix to apply a color effect to the entire desktop. If the function is called multiple times, the most recent color transform is used.
     * @param {Pointer<MAGCOLOREFFECT>} pEffect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/magnification/ns-magnification-magcoloreffect">PMAGCOLOREFFECT</a></b>
     * 
     * The new color transformation matrix. This parameter must not be NULL.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Returns TRUE if successful, or FALSE otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/magnification/nf-magnification-magsetfullscreencoloreffect
     * @since windows8.0
     */
    static MagSetFullscreenColorEffect(pEffect) {
        result := DllCall("MAGNIFICATION.dll\MagSetFullscreenColorEffect", "ptr", pEffect, "int")
        return result
    }

    /**
     * Retrieves the color transformation matrix associated with the full-screen magnifier.
     * @remarks
     * The full-screen magnifier uses the color transformation matrix to apply a color effect to the entire screen.
     * @param {Pointer<MAGCOLOREFFECT>} pEffect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/magnification/ns-magnification-magcoloreffect">PMAGCOLOREFFECT</a></b>
     * 
     * The color transformation matrix, or the identity matrix if no color effect has been set.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Returns TRUE if successful, or FALSE otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/magnification/nf-magnification-maggetfullscreencoloreffect
     * @since windows8.0
     */
    static MagGetFullscreenColorEffect(pEffect) {
        result := DllCall("MAGNIFICATION.dll\MagGetFullscreenColorEffect", "ptr", pEffect, "int")
        return result
    }

    /**
     * Sets the current active input transformation for pen and touch input, represented as a source rectangle and a destination rectangle.
     * @remarks
     * The input transformation maps the coordinate space of the magnified screen content to the actual (unmagnified) screen coordinate space. This enables the system to pass pen and touch input that is entered in magnified screen content, to the correct UI element on the screen. For example, without input transformation, input is passed to the element located at the unmagnified screen coordinates, not to the item that appears in the magnified screen content.
     * 
     * This function requires the calling process to have UIAccess privileges.  If the caller does not have UIAccess privileges, the call to **MagSetInputTransform** fails, and the [GetLastError](../errhandlingapi/nf-errhandlingapi-getlasterror.md) function returns ERROR_ACCESS_DENIED. For more information, see [UI Automation Security Considerations](/windows/win32/WinAuto/uiauto-securityoverview) and [/MANIFESTUAC (Embeds UAC information in manifest)](/cpp/build/reference/manifestuac-embeds-uac-information-in-manifest).
     * 
     * Beginning with Windows 10 Creators Update (version 1703), you must use the [MagSetInputTransform function](nf-magnification-magsetinputtransform.md) for mouse input to route to the magnified element (in addition to pen and touch input).
     * @param {BOOL} fEnabled Type: **[BOOL](/windows/win32/WinProg/windows-data-types)**
     * 
     * TRUE to enable input transformation, or FALSE to disable it.
     * @param {Pointer<RECT>} pRectSource Type: **const [LPRECT](../windef/ns-windef-rect.md)**
     * 
     *  The new source rectangle, in unmagnified screen coordinates, that defines the area of the screen to magnify. This parameter is ignored if *bEnabled* is FALSE.
     * @param {Pointer<RECT>} pRectDest Type: **const [LPRECT](../windef/ns-windef-rect.md)**
     * 
     *  The new destination rectangle, in unmagnified screen coordinates, that defines the area of the screen where the magnified screen content is displayed. Pen and touch input in this rectangle is mapped to the source rectangle. This parameter is ignored if *bEnabled* is FALSE.
     * @returns {BOOL} Type: **[BOOL](/windows/win32/WinProg/windows-data-types)**
     * 
     * Returns TRUE if successful, or FALSE otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/magnification/nf-magnification-magsetinputtransform
     * @since windows8.0
     */
    static MagSetInputTransform(fEnabled, pRectSource, pRectDest) {
        A_LastError := 0

        result := DllCall("MAGNIFICATION.dll\MagSetInputTransform", "int", fEnabled, "ptr", pRectSource, "ptr", pRectDest, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the current input transformation for pen and touch input, represented as a source rectangle and a destination rectangle.
     * @remarks
     * The input transformation maps the coordinate space of the magnified screen content to the actual (unmagnified) screen coordinate space. This enables the system to pass touch and pen input that is entered in magnified screen content, to the correct UI element on the screen. For example, without input transformation, input is passed to the element located at the unmagnified screen coordinates, not to the item that appears in the magnified screen content.
     * @param {Pointer<BOOL>} pfEnabled Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * TRUE  if input translation is enabled, or FALSE if not.
     * @param {Pointer<RECT>} pRectSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">LPRECT</a></b>
     * 
     * The source rectangle, in unmagnified screen coordinates,  that defines the area of the screen that is magnified.
     * @param {Pointer<RECT>} pRectDest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">LPRECT</a></b>
     * 
     * The destination rectangle, in screen coordinates, that defines the area of the screen where the magnified screen content is displayed. Pen and touch input in this rectangle is mapped to the source rectangle.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Returns TRUE if successful, or FALSE otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/magnification/nf-magnification-maggetinputtransform
     * @since windows8.0
     */
    static MagGetInputTransform(pfEnabled, pRectSource, pRectDest) {
        pfEnabledMarshal := pfEnabled is VarRef ? "int*" : "ptr"

        result := DllCall("MAGNIFICATION.dll\MagGetInputTransform", pfEnabledMarshal, pfEnabled, "ptr", pRectSource, "ptr", pRectDest, "int")
        return result
    }

    /**
     * Shows or hides the system cursor.
     * @remarks
     * This function does not associate a reference count with the visibility state of the system cursor. Instead, the specified visibility state takes effect immediately, regardless of any previous calls to <b>MagShowSystemCursor</b>.
     * 
     * 
     * The system cursor is always magnified when it is shown while the full-screen magnifier is active. 
     * 
     * When used with a magnifier control, calls to <b>MagShowSystemCursor</b> have no effect on the magnified system cursor. The visibility of the magnified system cursor depends on whether the magnifier control has the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/magapi/magapi-magnifier-styles">MS_SHOWMAGNIFIEDCURSOR</a> style. If it has this style, the magnifier control displays the magnified system cursor, along with the magnified screen content, whenever the system cursor enters the source rectangle.
     * @param {BOOL} fShowCursor Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * TRUE to show the system cursor, or FALSE to hide it.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Returns TRUE if successful, or FALSE otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/magnification/nf-magnification-magshowsystemcursor
     * @since windows8.0
     */
    static MagShowSystemCursor(fShowCursor) {
        result := DllCall("MAGNIFICATION.dll\MagShowSystemCursor", "int", fShowCursor, "int")
        return result
    }

;@endregion Methods
}
