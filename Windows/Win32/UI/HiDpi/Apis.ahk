#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.UI.HiDpi
 * @version v4.0.30319
 */
class HiDpi {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static DPI_AWARENESS_CONTEXT_UNAWARE => -1

    /**
     * @type {Integer (Int32)}
     */
    static DPI_AWARENESS_CONTEXT_SYSTEM_AWARE => -2

    /**
     * @type {Integer (Int32)}
     */
    static DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE => -3

    /**
     * @type {Integer (Int32)}
     */
    static DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2 => -4

    /**
     * @type {Integer (Int32)}
     */
    static DPI_AWARENESS_CONTEXT_UNAWARE_GDISCALED => -5
;@endregion Constants

;@region Methods
    /**
     * A variant of OpenThemeData that opens a theme handle associated with a specific DPI.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> will create theme handles associated with the DPI of a window when used with Per Monitor v2 windows. OpenThemeDataForDpi allows you to open a theme handle for a specific DPI when you do not have a window at that DPI.
     * 
     * The behavior of the returned theme handle will be undermined if the requested DPI value does not correspond to a currently connected display. The theming system only loads theme assets for the set of DPI values corresponding to the <i>currently</i> connected displays.
     * 
     * The theme handle will become invalid anytime the system reloads the theme data. Applications are required to monitor <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-themechanged">WM_THEMECHANGED</a> and close and reopen all theme handles in response. This behavior is the same regardless of whether the handles were opened via OpenThemeData or OpenThemeDataForDpi.
     * @param {Pointer<HWND>} hwnd The handle of the window for which theme data is required.
     * @param {Pointer<PWSTR>} pszClassList A pointer to a string that contains a semicolon-separated list of classes.
     * @param {Integer} dpi The specified DPI value with which to associate the theme handle. The function will return an error if this value is outside of those that correspond to the set of connected monitors.
     * @returns {Pointer} See <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-openthemedatafordpi
     * @since windows10.0.15063
     */
    static OpenThemeDataForDpi(hwnd, pszClassList, dpi) {
        result := DllCall("UxTheme.dll\OpenThemeDataForDpi", "ptr", hwnd, "ptr", pszClassList, "uint", dpi, "ptr")
        return result
    }

    /**
     * Overrides the default per-monitor DPI scaling behavior of a child window in a dialog.
     * @remarks
     * The behaviors are specified as values from the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ne-winuser-dialog_control_dpi_change_behaviors">DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS</a> enum. This function follows the typical two-parameter approach to setting flags, where a mask specifies the subset of the flags to be changed.
     * 
     * It is valid to set these behaviors on <i>any</i> window. It does not matter if the window is currently a child of a dialog at the point in time that SetDialogControlDpiChangeBehavior is called. The behaviors are retained and will take effect only when the window is an immediate child of a dialog that has per-monitor DPI scaling enabled.
     * 
     * This API influences individual controls within dialogs. The dialog-wide per-monitor DPI scaling behavior is controlled by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setdialogdpichangebehavior">SetDialogDpiChangeBehavior</a>.
     * @param {Pointer<HWND>} hWnd A handle for the window whose behavior will be modified.
     * @param {Integer} mask A mask specifying the subset of flags to be changed.
     * @param {Integer} values The desired value to be set for the specified subset of flags.
     * @returns {Integer} This function returns TRUE if the operation was successful, and FALSE otherwise. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Possible errors are <b>ERROR_INVALID_HANDLE</b> if passed an invalid HWND, and <b>ERROR_ACCESS_DENIED</b> if the windows belongs to another process.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setdialogcontroldpichangebehavior
     * @since windows10.0.15063
     */
    static SetDialogControlDpiChangeBehavior(hWnd, mask, values) {
        A_LastError := 0

        result := DllCall("USER32.dll\SetDialogControlDpiChangeBehavior", "ptr", hWnd, "int", mask, "int", values, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves and per-monitor DPI scaling behavior overrides of a child window in a dialog.
     * @param {Pointer<HWND>} hWnd The handle for the window to examine.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getdialogcontroldpichangebehavior
     * @since windows10.0.15063
     */
    static GetDialogControlDpiChangeBehavior(hWnd) {
        A_LastError := 0

        DllCall("USER32.dll\GetDialogControlDpiChangeBehavior", "ptr", hWnd)
        if(A_LastError)
            throw OSError()

    }

    /**
     * Dialogs in Per-Monitor v2 contexts are automatically DPI scaled. This method lets you customize their DPI change behavior.
     * @remarks
     * For extensibility, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ne-winuser-dialog_dpi_change_behaviors">DIALOG_DPI_CHANGE_BEHAVIORS</a> was modeled as a set of bit-flags representing separate behaviors. This function follows the typical two-parameter approach to setting flags, where a mask specifies the subset of the flags to be changed.
     * 
     * It is not an error to call this API outside of Per Monitor v2 contexts, though the flags will have no effect on the behavior of the specified dialog until the context is changed to Per Monitor v2.
     * @param {Pointer<HWND>} hDlg A handle for the dialog whose behavior will be modified.
     * @param {Integer} mask A mask specifying the subset of flags to be changed.
     * @param {Integer} values The desired value to be set for the specified subset of flags.
     * @returns {Integer} This function returns TRUE if the operation was successful, and FALSE otherwise. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Possible errors are <b>ERROR_INVALID_HANDLE</b> if passed an invalid dialog HWND, and <b>ERROR_ACCESS_DENIED</b> if the dialog belongs to another process.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setdialogdpichangebehavior
     * @since windows10.0.15063
     */
    static SetDialogDpiChangeBehavior(hDlg, mask, values) {
        A_LastError := 0

        result := DllCall("USER32.dll\SetDialogDpiChangeBehavior", "ptr", hDlg, "int", mask, "int", values, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the flags that might have been set on a given dialog by an earlier call to SetDialogDpiChangeBehavior.
     * @remarks
     * It can be difficult to distinguish between a return value of <b>DDC_DEFAULT</b> and the error case, which is zero. To determine between the two, it is recommended that you call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError()</a> to check the error.
     * @param {Pointer<HWND>} hDlg The handle for the dialog to examine.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getdialogdpichangebehavior
     * @since windows10.0.15063
     */
    static GetDialogDpiChangeBehavior(hDlg) {
        A_LastError := 0

        DllCall("USER32.dll\GetDialogDpiChangeBehavior", "ptr", hDlg)
        if(A_LastError)
            throw OSError()

    }

    /**
     * Retrieves the specified system metric or system configuration setting taking into account a provided DPI.
     * @remarks
     * This function returns the same result as <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsystemmetrics">GetSystemMetrics</a> but scales it according to an arbitrary DPI you provide if appropriate.
     * @param {Integer} nIndex The system metric or configuration setting to be retrieved. See <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsystemmetrics">GetSystemMetrics</a> for the possible values.
     * @param {Integer} dpi The DPI to use for scaling the metric.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getsystemmetricsfordpi
     * @since windows10.0.14393
     */
    static GetSystemMetricsForDpi(nIndex, dpi) {
        A_LastError := 0

        DllCall("USER32.dll\GetSystemMetricsForDpi", "int", nIndex, "uint", dpi)
        if(A_LastError)
            throw OSError()

    }

    /**
     * Calculates the required size of the window rectangle, based on the desired size of the client rectangle and the provided DPI.
     * @remarks
     * This function returns the same result as <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-adjustwindowrectex">AdjustWindowRectEx</a> but scales it according to an arbitrary DPI you provide if appropriate.
     * @param {Pointer<RECT>} lpRect A pointer to a <b>RECT</b> structure that contains the coordinates of the top-left and bottom-right corners of the desired client area. When the function returns, the structure contains the coordinates of the top-left and bottom-right corners of the window to accommodate the desired client area.
     * @param {Integer} dwStyle The <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">Window Style</a> of the window whose required size is to be calculated. Note that you cannot specify the <b>WS_OVERLAPPED</b> style.
     * @param {Integer} bMenu Indicates whether the window has a menu.
     * @param {Integer} dwExStyle The <a href="https://docs.microsoft.com/windows/desktop/winmsg/extended-window-styles">Extended Window Style</a> of the window whose required size is to be calculated.
     * @param {Integer} dpi The DPI to use for scaling.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-adjustwindowrectexfordpi
     * @since windows10.0.14393
     */
    static AdjustWindowRectExForDpi(lpRect, dwStyle, bMenu, dwExStyle, dpi) {
        A_LastError := 0

        result := DllCall("USER32.dll\AdjustWindowRectExForDpi", "ptr", lpRect, "uint", dwStyle, "int", bMenu, "uint", dwExStyle, "uint", dpi, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts a point in a window from logical coordinates into physical coordinates, regardless of the dots per inch (dpi) awareness of the caller.
     * @remarks
     * In Windows 8, system–DPI aware applications translated between physical and logical space using <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-physicaltologicalpoint">PhysicalToLogicalPoint</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-logicaltophysicalpoint">LogicalToPhysicalPoint</a>. In Windows 8.1, the additional virtualization of the system and inter-process communications means that for the majority of applications, you do not need these APIs. As a result, in Windows 8.1, these APIs no longer transform points. The system returns all points to an application in its own coordinate space. 
     * This behavior preserves functionality for the majority of applications, but there are some exceptions in which you must make changes to ensure that the application works as expected.
     * 
     * For example, an application might need to walk the entire window tree of another process and ask the system for DPI-dependent information about the window. By default, the system will return the information based on the DPI awareness of the caller. This is ideal for most applications. However, the caller might need the information based on the DPI awareness of the application associated with the window. This might be necessary because the two applications send DPI-dependent information between each other directly.  In this case, the application can use <b>LogicalToPhysicalPointForPerMonitorDPI</b> to get physical coordinates and then use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-physicaltologicalpointforpermonitordpi">PhysicalToLogicalPointForPerMonitorDPI</a> to convert the physical coordinates into logical coordinates based on the DPI-awareness of the provided <b>HWND</b>.
     * 
     * Consider two applications, one has a <a href="https://docs.microsoft.com/windows/desktop/api/shellscalingapi/ne-shellscalingapi-process_dpi_awareness">PROCESS_DPI_AWARENESS</a> value of <b>PROCESS_DPI_UNAWARE</b> and the other has a value of <b>PROCESS_PER_MONITOR_AWARE</b>. The  <b>PROCESS_DPI_UNAWARE</b> app creates a window on a single monitor where the scale factor is 200% (192 DPI). If both apps call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getwindowrect">GetWindowRect</a> on this window, they will receive different values. The <b>PROCESS_DPI_UNAWARE</b> app will receive a rect based on 96 DPI coordinates, while the <b>PROCESS_PER_MONITOR_AWARE</b> app will receive coordinates matching the actual DPI of the monitor. If the <b>PROCESS_PER_MONITOR_AWARE</b> needs the rect that the system returned to the <b>PROCESS_DPI_UNAWARE</b> app, it could call <b>LogicalToPhysicalPointForPerMonitorDPI</b> for the corners of its rect and pass in the handle to the <b>PROCESS_DPI_UNAWARE</b> app's window. This will return points based on the other app's awareness that can be used to create a rect.
     * 
     * <div class="alert"><b>Tip</b>  <p class="note">Since an application with a <a href="https://docs.microsoft.com/windows/desktop/api/shellscalingapi/ne-shellscalingapi-process_dpi_awareness">PROCESS_DPI_AWARENESS</a> value of <b>PROCESS_PER_MONITOR_AWARE</b> uses the actual DPI of the monitor, physical and logical coordinates are the same for this app.
     * 
     * </div>
     * <div> </div>
     * @param {Pointer<HWND>} hWnd A handle to the window whose transform is used for the conversion.
     * @param {Pointer<POINT>} lpPoint A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that specifies the logical coordinates to be converted. The new physical coordinates are copied into this structure if the function succeeds.
     * @returns {Integer} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-logicaltophysicalpointforpermonitordpi
     * @since windows8.1
     */
    static LogicalToPhysicalPointForPerMonitorDPI(hWnd, lpPoint) {
        result := DllCall("USER32.dll\LogicalToPhysicalPointForPerMonitorDPI", "ptr", hWnd, "ptr", lpPoint, "int")
        return result
    }

    /**
     * Converts a point in a window from physical coordinates into logical coordinates, regardless of the dots per inch (dpi) awareness of the caller.
     * @remarks
     * In Windows 8, system–DPI aware applications translate between physical and logical space using <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-physicaltologicalpoint">PhysicalToLogicalPoint</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-logicaltophysicalpoint">LogicalToPhysicalPoint</a>. In Windows 8.1, the additional virtualization of the system and inter-process communications means that for the majority of applications, you do not need these APIs. As a result, in Windows 8.1, these APIs no longer transform points. The system returns all points to an application in its own coordinate space. 
     * This behavior preserves functionality for the majority of applications, but there are some exceptions in which you must make changes to ensure that the application works as expected.
     * 
     * For example, an application might need to walk the entire window tree of another process and ask the system for DPI-dependent information about the window. By default, the system will return the information based on the DPI awareness of the caller. This is ideal for most applications. However, the caller might need the information based on the DPI awareness of the application associated with the window. This might be necessary because the two applications send DPI-dependent information between each other directly.  In this case, the application can use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-logicaltophysicalpointforpermonitordpi">LogicalToPhysicalPointForPerMonitorDPI</a> to get physical coordinates and then use <b>PhysicalToLogicalPointForPerMonitorDPI</b> to convert the physical coordinates into logical coordinates based on the DPI-awareness of the provided <b>HWND</b>.
     * 
     * Consider two applications, one has a <a href="https://docs.microsoft.com/windows/desktop/api/shellscalingapi/ne-shellscalingapi-process_dpi_awareness">PROCESS_DPI_AWARENESS</a> value of <b>PROCESS_DPI_UNAWARE</b> and the other has a value of <b>PROCESS_PER_MONITOR_AWARE</b>. The  <b>PROCESS_PER_MONITOR_AWARE</b> app creates a window on a single monitor where the scale factor is 200% (192 DPI). If both apps call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getwindowrect">GetWindowRect</a> on this window, they will receive different values. The <b>PROCESS_DPI_UNAWARE</b> app will receive a rect based on 96 DPI coordinates, while the <b>PROCESS_PER_MONITOR_AWARE</b> app will receive coordinates matching the actual DPI of the monitor. If the <b>PROCESS_DPI_UNAWARE</b> needs the rect that the system returned to the <b>PROCESS_PER_MONITOR_AWARE</b> app, it could call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-logicaltophysicalpointforpermonitordpi">LogicalToPhysicalPointForPerMonitorDPI</a> for the corners of its rect and pass in a handle to the <b>PROCESS_PER_MONITOR_AWARE</b> app's window. This will return points based on the other app's awareness that can be used to create a rect. This works because since a <b>PROCESS_PER_MONITOR_AWARE</b> uses the actual DPI of the monitor, logical and physical coordinates are identical.
     * @param {Pointer<HWND>} hWnd A handle to the window whose transform is used for the conversion.
     * @param {Pointer<POINT>} lpPoint A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that specifies the physical/screen coordinates to be converted. The new logical coordinates are copied into this structure if the function succeeds.
     * @returns {Integer} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-physicaltologicalpointforpermonitordpi
     * @since windows8.1
     */
    static PhysicalToLogicalPointForPerMonitorDPI(hWnd, lpPoint) {
        result := DllCall("USER32.dll\PhysicalToLogicalPointForPerMonitorDPI", "ptr", hWnd, "ptr", lpPoint, "int")
        return result
    }

    /**
     * Retrieves the value of one of the system-wide parameters, taking into account the provided DPI value.
     * @remarks
     * This function returns a similar result as <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-systemparametersinfoa">SystemParametersInfo</a>, but scales it according to an arbitrary DPI you provide (if appropriate). It only scales with the following possible values for <i>uiAction</i>: <b>SPI_GETICONTITLELOGFONT</b>, <b>SPI_GETICONMETRICS</b>, <b>SPI_GETNONCLIENTMETRICS</b>. Other possible <i>uiAction</i> values do not provide ForDPI behavior, and therefore this function returns 0 if called with them.
     * 
     * For <i>uiAction</i> values that contain strings within their associated structures, only Unicode (<a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONTW</a>) strings are supported in this function.
     * @param {Integer} uiAction The system-wide parameter to be retrieved. This function is only intended for use with <b>SPI_GETICONTITLELOGFONT</b>, <b>SPI_GETICONMETRICS</b>, or <b>SPI_GETNONCLIENTMETRICS</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-systemparametersinfoa">SystemParametersInfo</a> for more information on these values.
     * @param {Integer} uiParam A parameter whose usage and format depends on the system parameter being queried. For more information about system-wide parameters, see the <i>uiAction</i> parameter. If not otherwise indicated, you must specify zero for this parameter.
     * @param {Pointer<Void>} pvParam A parameter whose usage and format depends on the system parameter being queried. For more information about system-wide parameters, see the <i>uiAction</i> parameter. If not otherwise indicated, you must specify <b>NULL</b> for this parameter. For information on the <b>PVOID</b> datatype, see <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">Windows Data Types</a>.
     * @param {Integer} fWinIni Has no effect for with this API. This parameter only has an effect if you're setting parameter.
     * @param {Integer} dpi The DPI to use for scaling the metric.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-systemparametersinfofordpi
     * @since windows10.0.14393
     */
    static SystemParametersInfoForDpi(uiAction, uiParam, pvParam, fWinIni, dpi) {
        A_LastError := 0

        result := DllCall("USER32.dll\SystemParametersInfoForDpi", "uint", uiAction, "uint", uiParam, "ptr", pvParam, "uint", fWinIni, "uint", dpi, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Set the DPI awareness for the current thread to the provided value.
     * @remarks
     * Use this API to change the <a href="https://docs.microsoft.com/windows/desktop/hidpi/dpi-awareness-context">DPI_AWARENESS_CONTEXT</a> for the thread from the default value for the app.
     * @param {Pointer<DPI_AWARENESS_CONTEXT>} dpiContext The new <a href="https://docs.microsoft.com/windows/desktop/hidpi/dpi-awareness-context">DPI_AWARENESS_CONTEXT</a> for the current thread. This context includes the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ne-windef-dpi_awareness">DPI_AWARENESS</a> value.
     * @returns {Pointer<DPI_AWARENESS_CONTEXT>} The old <a href="https://docs.microsoft.com/windows/desktop/hidpi/dpi-awareness-context">DPI_AWARENESS_CONTEXT</a> for the thread. If the <i>dpiContext</i> is invalid, the thread will not be updated and the return value will be <b>NULL</b>. You can use this value to restore the old <b>DPI_AWARENESS_CONTEXT</b> after overriding it with a predefined value.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setthreaddpiawarenesscontext
     * @since windows10.0.14393
     */
    static SetThreadDpiAwarenessContext(dpiContext) {
        result := DllCall("USER32.dll\SetThreadDpiAwarenessContext", "ptr", dpiContext, "ptr")
        return result
    }

    /**
     * Gets the DPI_AWARENESS_CONTEXT for the current thread.
     * @remarks
     * This method will return the latest <a href="https://docs.microsoft.com/windows/desktop/hidpi/dpi-awareness-context">DPI_AWARENESS_CONTEXT</a> sent to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setthreaddpiawarenesscontext">SetThreadDpiAwarenessContext</a>. If <b>SetThreadDpiAwarenessContext</b> was never called for this thread, then the return value will equal the default <b>DPI_AWARENESS_CONTEXT</b> for the process.
     * @returns {Pointer<DPI_AWARENESS_CONTEXT>} The current <a href="https://docs.microsoft.com/windows/desktop/hidpi/dpi-awareness-context">DPI_AWARENESS_CONTEXT</a> for the thread.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getthreaddpiawarenesscontext
     * @since windows10.0.14393
     */
    static GetThreadDpiAwarenessContext() {
        result := DllCall("USER32.dll\GetThreadDpiAwarenessContext", "ptr")
        return result
    }

    /**
     * Returns the DPI_AWARENESS_CONTEXT associated with a window.
     * @remarks
     * <div class="alert"><b>Important</b>  <p class="note">The return value of <b>GetWindowDpiAwarenessContext</b> is not affected by the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ne-windef-dpi_awareness">DPI_AWARENESS</a> of the current thread. It only indicates the context of the window specified by the <i>hwnd</i> input parameter.
     * 
     * </div>
     * <div> </div>
     * @param {Pointer<HWND>} hwnd The window to query.
     * @returns {Pointer<DPI_AWARENESS_CONTEXT>} The <a href="https://docs.microsoft.com/windows/desktop/hidpi/dpi-awareness-context">DPI_AWARENESS_CONTEXT</a> for the provided window. If the window is not valid, the return value is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getwindowdpiawarenesscontext
     * @since windows10.0.14393
     */
    static GetWindowDpiAwarenessContext(hwnd) {
        result := DllCall("USER32.dll\GetWindowDpiAwarenessContext", "ptr", hwnd, "ptr")
        return result
    }

    /**
     * Retrieves the DPI_AWARENESS value from a DPI_AWARENESS_CONTEXT.
     * @remarks
     * A <a href="https://docs.microsoft.com/windows/desktop/hidpi/dpi-awareness-context">DPI_AWARENESS_CONTEXT</a> contains multiple pieces of information. For example, it includes both the current and the inherited <a href="https://docs.microsoft.com/windows/desktop/api/windef/ne-windef-dpi_awareness">DPI_AWARENESS</a>. This method retrieves the <b>DPI_AWARENESS</b> from the structure.
     * @param {Pointer<DPI_AWARENESS_CONTEXT>} value The <b>DPI_AWARENESS_CONTEXT</b> you want to examine.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getawarenessfromdpiawarenesscontext
     * @since windows10.0.14393
     */
    static GetAwarenessFromDpiAwarenessContext(value) {
        DllCall("USER32.dll\GetAwarenessFromDpiAwarenessContext", "ptr", value)
    }

    /**
     * Retrieves the DPI from a given DPI_AWARENESS_CONTEXT handle. This enables you to determine the DPI of a thread without needed to examine a window created within that thread.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/hidpi/dpi-awareness-context">DPI_AWARENESS_CONTEXT</a> handles associated with values of <b>DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE</b> and <b>DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2</b> will return a value of 0 for their DPI. This is because the DPI of a per-monitor-aware window can change, and the actual DPI cannot be returned without the window's HWND.
     * @param {Pointer<DPI_AWARENESS_CONTEXT>} value The <b>DPI_AWARENESS_CONTEXT</b> handle to examine.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getdpifromdpiawarenesscontext
     * @since windows10.0.17134
     */
    static GetDpiFromDpiAwarenessContext(value) {
        DllCall("USER32.dll\GetDpiFromDpiAwarenessContext", "ptr", value)
    }

    /**
     * Determines whether two DPI_AWARENESS_CONTEXT values are identical.
     * @remarks
     * A <b>DPI_AWARENESS_CONTEXT</b> contains multiple pieces of information. For example, it includes both the current and the inherited <a href="https://docs.microsoft.com/windows/desktop/api/windef/ne-windef-dpi_awareness">DPI_AWARENESS</a> values. <b>AreDpiAwarenessContextsEqual</b> ignores informational flags and determines if the values are equal. You can't use a direct bitwise comparison because of these informational flags.
     * @param {Pointer<DPI_AWARENESS_CONTEXT>} dpiContextA The first value to compare.
     * @param {Pointer<DPI_AWARENESS_CONTEXT>} dpiContextB The second value to compare.
     * @returns {Integer} Returns <b>TRUE</b> if the values are equal, otherwise <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-aredpiawarenesscontextsequal
     * @since windows10.0.14393
     */
    static AreDpiAwarenessContextsEqual(dpiContextA, dpiContextB) {
        result := DllCall("USER32.dll\AreDpiAwarenessContextsEqual", "ptr", dpiContextA, "ptr", dpiContextB, "int")
        return result
    }

    /**
     * Determines if a specified DPI_AWARENESS_CONTEXT is valid and supported by the current system.
     * @remarks
     * <b>IsValidDpiAwarenessContext</b> determines the validity of any provided <b>DPI_AWARENESS_CONTEXT</b>. You should make sure a context is valid before using <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setthreaddpiawarenesscontext">SetThreadDpiAwarenessContext</a> to that context.
     * 
     * An input <i>value</i> of <b>NULL</b> is considered to be an invalid context and will result in a return value of <b>FALSE.</b>
     * @param {Pointer<DPI_AWARENESS_CONTEXT>} value The context that you want to determine if it is supported.
     * @returns {Integer} <b>TRUE</b> if the provided context is supported, otherwise <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-isvaliddpiawarenesscontext
     * @since windows10.0.14393
     */
    static IsValidDpiAwarenessContext(value) {
        result := DllCall("USER32.dll\IsValidDpiAwarenessContext", "ptr", value, "int")
        return result
    }

    /**
     * Returns the dots per inch (dpi) value for the specified window.
     * @remarks
     * The following table indicates the return value of <b>GetDpiForWindow</b> based on the [DPI_AWARENESS](/windows/win32/api/windef/ne-windef-dpi_awareness) of the provided *hwnd*.
     * 
     * <table>
     * <tr>
     * <th>DPI_AWARENESS</th>
     * <th>Return value</th>
     * </tr>
     * <tr>
     * <td>DPI_AWARENESS_UNAWARE</td>
     * <td>96</td>
     * </tr>
     * <tr>
     * <td>DPI_AWARENESS_SYSTEM_AWARE</td>
     * <td>The system DPI.</td>
     * </tr>
     * <tr>
     * <td>DPI_AWARENESS_PER_MONITOR_AWARE</td>
     * <td>The DPI of the monitor where the window is located.</td>
     * </tr>
     * </table>
     * @param {Pointer<HWND>} hwnd The window that you want to get information about.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getdpiforwindow
     * @since windows10.0.14393
     */
    static GetDpiForWindow(hwnd) {
        DllCall("USER32.dll\GetDpiForWindow", "ptr", hwnd)
    }

    /**
     * Returns the system DPI.
     * @remarks
     * The return value will be dependent based upon the calling context. If the current thread has a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ne-windef-dpi_awareness">DPI_AWARENESS</a> value of <b>DPI_AWARENESS_UNAWARE</b>, the return value will be 96. That is because the current context always assumes a DPI of 96. For any other <b>DPI_AWARENESS</b> value, the return value will be the actual system DPI.
     * 
     * You should not cache the system DPI, but should use <b>GetDpiForSystem</b> whenever you need the system DPI value.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getdpiforsystem
     * @since windows10.0.14393
     */
    static GetDpiForSystem() {
        DllCall("USER32.dll\GetDpiForSystem")
    }

    /**
     * Retrieves the system DPI associated with a given process. This is useful for avoiding compatibility issues that arise from sharing DPI-sensitive information between multiple system-aware processes with different system DPI values.
     * @remarks
     * The return value will be dependent based upon the process passed as a parameter. If the specified process has a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ne-windef-dpi_awareness">DPI_AWARENESS</a> value of <b>DPI_AWARENESS_UNAWARE</b>, the return value will be 96. That is because the current context always assumes a DPI of 96. For any other <b>DPI_AWARENESS</b> value, the return value will be the actual system DPI of the given process.
     * @param {Pointer<HANDLE>} hProcess The handle for the process to examine. If this value is null, this API behaves identically to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getdpiforsystem">GetDpiForSystem</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getsystemdpiforprocess
     * @since windows10.0.17134
     */
    static GetSystemDpiForProcess(hProcess) {
        DllCall("USER32.dll\GetSystemDpiForProcess", "ptr", hProcess)
    }

    /**
     * In high-DPI displays, enables automatic display scaling of the non-client area portions of the specified top-level window. Must be called during the initialization of that window.
     * @remarks
     * Calling this function will enable non-client scaling for an individual top-level window with <a href="https://docs.microsoft.com/windows/desktop/hidpi/dpi-awareness-context">DPI_AWARENESS_CONTEXT</a> of <b>DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE</b>. If instead you are not using per-window awareness, and your entire process is running in <b>DPI_AWARENESS_PER_MONITOR_AWARE</b> mode, calling this function will enable non-client scaling in top-level windows in your process.
     * 
     * If neither of those are true, or if you call this method from any other window, then it will fail and return a value of zero.
     * 
     * Non-client scaling for top-level windows is not enabled by default. You must call this API to enable it for each individual top-level window for which you wish to have the non-client area scale automatically. Once you do, there is no way to disable it. Enabling non-client scaling means that all the areas drawn by the system for the window will automatically scale in response to DPI changes on the window. That includes areas like the caption bar, the scrollbars, and the menu bar. You want to call <b>EnableNonClientDpiScaling</b> when you want the operating system to be responsible for rendering these areas automatically at the correct size based on the DPI of the monitor. 
     * 
     * Calling this function enables non-client scaling for top-level windows only. Child windows are unaffected.
     * 
     * This function must be called from WM_NCCREATE during the initialization of a new window. An example call might look like this:
     * 
     * 
     * ```
     * case WM_NCCREATE:
     * {
     *     EnableNonClientDpiScaling(hwnd);
     *     return (DefWindowProc(hwnd, message, wParam, lParam));
     * }
     * ```
     * @param {Pointer<HWND>} hwnd The window that should have automatic scaling enabled.
     * @returns {Integer} If the function succeeds, the return value is nonzero. If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-enablenonclientdpiscaling
     * @since windows10.0.14393
     */
    static EnableNonClientDpiScaling(hwnd) {
        A_LastError := 0

        result := DllCall("USER32.dll\EnableNonClientDpiScaling", "ptr", hwnd, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the current process to a specified dots per inch (dpi) awareness context. The DPI awareness contexts are from the DPI_AWARENESS_CONTEXT value.
     * @remarks
     * This API is a more advanced version of the previously existing <a href="https://docs.microsoft.com/windows/desktop/api/shellscalingapi/nf-shellscalingapi-setprocessdpiawareness">SetProcessDpiAwareness</a> API, allowing for the process default to be set to the finer-grained <a href="https://docs.microsoft.com/windows/desktop/hidpi/dpi-awareness-context">DPI_AWARENESS_CONTEXT</a> values. Most importantly, this allows you to programmatically set <b>Per Monitor v2</b> as the process default value, which is not possible with the previous API.
     * 
     * This method sets the default <a href="https://docs.microsoft.com/windows/desktop/hidpi/dpi-awareness-context">DPI_AWARENESS_CONTEXT</a> for all threads within an application. Individual threads can have their DPI awareness changed from the default with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setthreaddpiawarenesscontext">SetThreadDpiAwarenessContext</a> method.
     * 
     * <div class="alert"><b>Important</b>  <p class="note">In general, it is recommended to not use <b>SetProcessDpiAwarenessContext</b> to set the DPI awareness for your application. If possible, you should declare the DPI awareness for your application in the application manifest. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt846517(v=vs.85)">Setting the default DPI awareness for a process</a>.
     * 
     * </div>
     * <div> </div>
     * You must call this API before you call any APIs that depend on the DPI awareness (including before creating any UI in your process). Once API awareness is set for an app, any future calls to this API will fail. This is true regardless of whether you set the DPI awareness in the manifest or by using this API.
     * 
     * If the DPI awareness level is not set, the default value is <b>DPI_AWARENESS_CONTEXT_UNAWARE</b>.
     * @param {Pointer<DPI_AWARENESS_CONTEXT>} value A <a href="https://docs.microsoft.com/windows/desktop/hidpi/dpi-awareness-context">DPI_AWARENESS_CONTEXT</a> handle to set.
     * @returns {Integer} This function returns TRUE if the operation was successful, and FALSE otherwise. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Possible errors are <b>ERROR_INVALID_PARAMETER</b> for an invalid input, and <b>ERROR_ACCESS_DENIED</b> if the default API awareness mode for the process has already been set (via a previous API call or within the application manifest).
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setprocessdpiawarenesscontext
     * @since windows10.0.15063
     */
    static SetProcessDpiAwarenessContext(value) {
        A_LastError := 0

        result := DllCall("USER32.dll\SetProcessDpiAwarenessContext", "ptr", value, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hProcess 
     * @returns {Pointer<DPI_AWARENESS_CONTEXT>} 
     */
    static GetDpiAwarenessContextForProcess(hProcess) {
        result := DllCall("USER32.dll\GetDpiAwarenessContextForProcess", "ptr", hProcess, "ptr")
        return result
    }

    /**
     * Sets the thread's DPI_HOSTING_BEHAVIOR. This behavior allows windows created in the thread to host child windows with a different DPI_AWARENESS_CONTEXT.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/windef/ne-windef-dpi_hosting_behavior">DPI_HOSTING_BEHAVIOR</a> enables a mixed content hosting behavior, which allows parent windows created in the thread to host child windows with a different <a href="https://docs.microsoft.com/windows/desktop/hidpi/dpi-awareness-context">DPI_AWARENESS_CONTEXT</a> value. This property only effects new windows created within this thread while the mixed hosting behavior is active. A parent window with this hosting behavior is able to host child windows with different <b>DPI_AWARENESS_CONTEXT</b> values, regardless of whether the child windows have mixed hosting behavior enabled.
     * 
     * This hosting behavior does not allow for windows with per-monitor <b>DPI_AWARENESS_CONTEXT</b> values to be hosted until windows with <b>DPI_AWARENESS_CONTEXT</b> values of system or unaware.
     * 
     * To avoid unexpected outcomes, a thread's <b>DPI_HOSTING_BEHAVIOR</b> should be changed to support mixed hosting behaviors only when creating a new window which needs to support those behaviors. Once that window is created, the hosting behavior should be switched back to its default value.
     * 
     * This API is used to change the thread's <b>DPI_HOSTING_BEHAVIOR</b> from its default value. This is only necessary if your app needs to host child windows from plugins and third-party components that do not support per-monitor-aware context. This is most likely to occur if you are updating complex applications to support per-monitor  <b>DPI_AWARENESS_CONTEXT</b> behaviors.
     * 
     * Enabling mixed hosting behavior will not automatically adjust the thread's <b>DPI_AWARENESS_CONTEXT</b> to be compatible with legacy content. The thread's awareness context must still be manually changed before new windows are created to host such content.
     * @param {Integer} value The new <a href="https://docs.microsoft.com/windows/desktop/api/windef/ne-windef-dpi_hosting_behavior">DPI_HOSTING_BEHAVIOR</a> value for the current thread.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setthreaddpihostingbehavior
     * @since windows10.0.17134
     */
    static SetThreadDpiHostingBehavior(value) {
        DllCall("USER32.dll\SetThreadDpiHostingBehavior", "int", value)
    }

    /**
     * Retrieves the DPI_HOSTING_BEHAVIOR from the current thread.
     * @remarks
     * This API returns the hosting behavior set by an earlier call of  <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setthreaddpihostingbehavior">SetThreadDpiHostingBehavior</a>, or <b>DPI_HOSTING_BEHAVIOR_DEFAULT</b> if no earlier call has been made.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getthreaddpihostingbehavior
     * @since windows10.0.17134
     */
    static GetThreadDpiHostingBehavior() {
        DllCall("USER32.dll\GetThreadDpiHostingBehavior")
    }

    /**
     * Returns the DPI_HOSTING_BEHAVIOR of the specified window.
     * @remarks
     * This API allows you to examine the hosting behavior of a window after it has been created. A window's hosting behavior is the hosting behavior of the thread in which the window was created, as set by a call to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setthreaddpihostingbehavior">SetThreadDpiHostingBehavior</a>. This is a permanent value and cannot be changed after the window is created, even if the thread's hosting behavior is changed.
     * @param {Pointer<HWND>} hwnd The handle for the window to examine.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getwindowdpihostingbehavior
     * @since windows10.0.17134
     */
    static GetWindowDpiHostingBehavior(hwnd) {
        DllCall("USER32.dll\GetWindowDpiHostingBehavior", "ptr", hwnd)
    }

    /**
     * Sets the process-default DPI awareness level. This is equivalent to calling SetProcessDpiAwarenessContext with the corresponding DPI_AWARENESS_CONTEXT value.
     * @remarks
     * It is recommended that you set the process-default DPI awareness via application manifest. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/mt846517(v=vs.85)">Setting the default DPI awareness for a process</a> for more information. Setting the process-default DPI awareness via API call can lead to unexpected application behavior.
     * 
     * Previous versions of Windows only had one DPI awareness value for the entire application. For those applications, the recommendation was to set the DPI awareness value in the manifest as described in <a href="https://docs.microsoft.com/windows/desktop/api/shellscalingapi/ne-shellscalingapi-process_dpi_awareness">PROCESS_DPI_AWARENESS</a>. Under that recommendation, you were not supposed to use <b>SetProcessDpiAwareness</b> to update the DPI awareness. In fact, future calls  to this API would fail after the DPI awareness was set once. Now that DPI awareness is tied to a thread rather than an application, you can use this method to update the DPI awareness. However, consider using <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setthreaddpiawarenesscontext">SetThreadDpiAwarenessContext</a> instead.
     * 
     * <div class="alert"><b>Important</b>  <p class="note">For older applications, it is strongly recommended to not use <b>SetProcessDpiAwareness</b> to set the DPI awareness for your application. Instead, you should declare the DPI awareness for your application in the application manifest. See <a href="https://docs.microsoft.com/windows/desktop/api/shellscalingapi/ne-shellscalingapi-process_dpi_awareness">PROCESS_DPI_AWARENESS</a> for more information about the DPI awareness values and how to set them in the manifest.
     * 
     * </div>
     * <div> </div>
     * You must call this API before you call any APIs that depend on the dpi awareness. This is part of the reason why it is recommended to use the application manifest rather than the <b>SetProcessDpiAwareness</b> API. Once API awareness is set for an app, any future calls to this API will fail. This is true regardless of whether you set the DPI awareness in the manifest or by using this API.
     * 
     * If the DPI awareness level is not set, the default value is <b>PROCESS_DPI_UNAWARE</b>.
     * @param {Integer} value The DPI awareness value to set. Possible values are from the <a href="https://docs.microsoft.com/windows/desktop/api/shellscalingapi/ne-shellscalingapi-process_dpi_awareness">PROCESS_DPI_AWARENESS</a> enumeration.
     * @returns {Integer} This function returns one of the following values.
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
     * The DPI awareness for the app was set successfully.
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
     * The value passed in is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DPI awareness is already set, either by calling this API previously or through the application (.exe) manifest.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/shellscalingapi/nf-shellscalingapi-setprocessdpiawareness
     * @since windows8.1
     */
    static SetProcessDpiAwareness(value) {
        result := DllCall("api-ms-win-shcore-scaling-l1-1-1.dll\SetProcessDpiAwareness", "int", value, "int")
        return result
    }

    /**
     * Retrieves the dots per inch (dpi) awareness of the specified process.
     * @remarks
     * This function is identical to the following code: 
     * 
     * <c>GetAwarenessFromDpiAwarenessContext(GetThreadDpiAwarenessContext());</c>
     * @param {Pointer<HANDLE>} hprocess Handle of the process that is being queried. If this parameter is NULL, the current process is queried.
     * @param {Pointer<Int32>} value The DPI awareness of the specified process. Possible values are from the <a href="https://docs.microsoft.com/windows/desktop/api/shellscalingapi/ne-shellscalingapi-process_dpi_awareness">PROCESS_DPI_AWARENESS</a> enumeration.
     * @returns {Integer} This function returns one of the following values.
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
     * The function successfully retrieved the DPI awareness of the specified process.
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
     * The handle or pointer passed in is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/shellscalingapi/nf-shellscalingapi-getprocessdpiawareness
     * @since windows8.1
     */
    static GetProcessDpiAwareness(hprocess, value) {
        result := DllCall("api-ms-win-shcore-scaling-l1-1-1.dll\GetProcessDpiAwareness", "ptr", hprocess, "ptr", value, "int")
        return result
    }

    /**
     * Queries the dots per inch (dpi) of a display.
     * @remarks
     * This API is not DPI aware and should not be used if the calling thread is per-monitor DPI aware. For the DPI-aware version of this API, see <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getdpiforwindow">GetDpiForWindow</a>.
     * 
     * When you call <b>GetDpiForMonitor</b>, you will receive different DPI values depending on the DPI awareness of the calling application. DPI awareness is an application-level property usually defined in the application manifest. For more information about DPI awareness values, see <a href="https://docs.microsoft.com/windows/desktop/api/shellscalingapi/ne-shellscalingapi-process_dpi_awareness">PROCESS_DPI_AWARENESS</a>. The following table indicates how the results will differ based on the <b>PROCESS_DPI_AWARENESS</b> value of your application.
     * 
     * <table>
     * <tr>
     * <td><b>PROCESS_DPI_UNAWARE</b></td>
     * <td>96 because the app is unaware of any other scale factors.</td>
     * </tr>
     * <tr>
     * <td><b>PROCESS_SYSTEM_DPI_AWARE</b></td>
     * <td>A value set to the system DPI because the app assumes all applications use the system DPI.</td>
     * </tr>
     * <tr>
     * <td><b>PROCESS_PER_MONITOR_DPI_AWARE</b></td>
     * <td>The actual DPI value set by the user for that display.</td>
     * </tr>
     * </table>
     *  
     * 
     * The values of <i>*dpiX</i> and <i>*dpiY</i> are identical. You only need to record one of the values to determine the DPI and respond appropriately.
     * 
     * When <a href="https://docs.microsoft.com/windows/desktop/api/shellscalingapi/ne-shellscalingapi-monitor_dpi_type">MONITOR_DPI_TYPE</a> is <b>MDT_ANGULAR_DPI</b> or <b>MDT_RAW_DPI</b>, the returned DPI value does not include any changes that the user made to the DPI by using the desktop scaling override slider control in Control Panel.
     * 
     * For more information about DPI settings in Control Panel, see the <a href="https://docs.microsoft.com/windows/win32/hidpi/high-dpi-desktop-application-development-on-windows">Writing DPI-Aware Desktop Applications in Windows 8.1 Preview</a> white paper.
     * @param {Pointer<HMONITOR>} hmonitor Handle of the monitor being queried.
     * @param {Integer} dpiType The type of DPI being queried. Possible values are from the <a href="https://docs.microsoft.com/windows/desktop/api/shellscalingapi/ne-shellscalingapi-monitor_dpi_type">MONITOR_DPI_TYPE</a> enumeration.
     * @param {Pointer<UInt32>} dpiX The value of the DPI along the X axis. This value always refers to the horizontal edge, even when the screen is rotated.
     * @param {Pointer<UInt32>} dpiY The value of the DPI along the Y axis. This value always refers to the vertical edge, even when the screen is rotated.
     * @returns {Integer} This function returns one of the following values.
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
     * The function successfully returns the X and Y DPI values for the specified monitor.
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
     * The handle, DPI type, or pointers passed in are not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/shellscalingapi/nf-shellscalingapi-getdpiformonitor
     * @since windows8.1
     */
    static GetDpiForMonitor(hmonitor, dpiType, dpiX, dpiY) {
        result := DllCall("api-ms-win-shcore-scaling-l1-1-1.dll\GetDpiForMonitor", "ptr", hmonitor, "int", dpiType, "ptr", dpiX, "ptr", dpiY, "int")
        return result
    }

;@endregion Methods
}
