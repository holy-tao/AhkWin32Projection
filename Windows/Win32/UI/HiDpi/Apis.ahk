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
     * @param {Pointer<Void>} hwnd The handle of the window for which theme data is required.
     * @param {Pointer<Char>} pszClassList A pointer to a string that contains a semicolon-separated list of classes.
     * @param {Integer} dpi The specified DPI value with which to associate the theme handle. The function will return an error if this value is outside of those that correspond to the set of connected monitors.
     * @returns {Pointer} See <a href="/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a>.
     * @see https://docs.microsoft.com/windows/win32/api//uxtheme/nf-uxtheme-openthemedatafordpi
     * @since windows10.0.15063
     */
    static OpenThemeDataForDpi(hwnd, pszClassList, dpi) {
        pszClassList := pszClassList is String? StrPtr(pszClassList) : pszClassList

        result := DllCall("UxTheme.dll\OpenThemeDataForDpi", "ptr", hwnd, "ptr", pszClassList, "uint", dpi, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hWnd 
     * @param {Integer} mask 
     * @param {Integer} values 
     * @returns {Integer} 
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
     * @param {Pointer<Void>} hWnd The handle for the window to examine.
     * @returns {Integer} The flags set on the given window. If passed an invalid handle, this function will return zero, and set its <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">last error</a> to <b>ERROR_INVALID_HANDLE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getdialogcontroldpichangebehavior
     * @since windows10.0.15063
     */
    static GetDialogControlDpiChangeBehavior(hWnd) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetDialogControlDpiChangeBehavior", "ptr", hWnd, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Dialogs in Per-Monitor v2 contexts are automatically DPI scaled. This method lets you customize their DPI change behavior.
     * @param {Pointer<Void>} hDlg A handle for the dialog whose behavior will be modified.
     * @param {Integer} mask A mask specifying the subset of flags to be changed.
     * @param {Integer} values The desired value to be set for the specified subset of flags.
     * @returns {Integer} This function returns TRUE if the operation was successful, and FALSE otherwise. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Possible errors are <b>ERROR_INVALID_HANDLE</b> if passed an invalid dialog HWND, and <b>ERROR_ACCESS_DENIED</b> if the dialog belongs to another process.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setdialogdpichangebehavior
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
     * @param {Pointer<Void>} hDlg The handle for the dialog to examine.
     * @returns {Integer} The flags set on the given dialog. If passed an invalid handle, this function will return zero, and set its <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">last error</a> to <b>ERROR_INVALID_HANDLE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getdialogdpichangebehavior
     * @since windows10.0.15063
     */
    static GetDialogDpiChangeBehavior(hDlg) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetDialogDpiChangeBehavior", "ptr", hDlg, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the specified system metric or system configuration setting taking into account a provided DPI.
     * @param {Integer} nIndex The system metric or configuration setting to be retrieved. See <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsystemmetrics">GetSystemMetrics</a> for the possible values.
     * @param {Integer} dpi The DPI to use for scaling the metric.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getsystemmetricsfordpi
     * @since windows10.0.14393
     */
    static GetSystemMetricsForDpi(nIndex, dpi) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetSystemMetricsForDpi", "int", nIndex, "uint", dpi, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Calculates the required size of the window rectangle, based on the desired size of the client rectangle and the provided DPI.
     * @param {Pointer<RECT>} lpRect A pointer to a <b>RECT</b> structure that contains the coordinates of the top-left and bottom-right corners of the desired client area. When the function returns, the structure contains the coordinates of the top-left and bottom-right corners of the window to accommodate the desired client area.
     * @param {Integer} dwStyle The <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">Window Style</a> of the window whose required size is to be calculated. Note that you cannot specify the <b>WS_OVERLAPPED</b> style.
     * @param {Integer} bMenu Indicates whether the window has a menu.
     * @param {Integer} dwExStyle The <a href="https://docs.microsoft.com/windows/desktop/winmsg/extended-window-styles">Extended Window Style</a> of the window whose required size is to be calculated.
     * @param {Integer} dpi The DPI to use for scaling.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-adjustwindowrectexfordpi
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
     * @param {Pointer<Void>} hWnd A handle to the window whose transform is used for the conversion.
     * @param {Pointer<POINT>} lpPoint A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that specifies the logical coordinates to be converted. The new physical coordinates are copied into this structure if the function succeeds.
     * @returns {Integer} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-logicaltophysicalpointforpermonitordpi
     * @since windows8.1
     */
    static LogicalToPhysicalPointForPerMonitorDPI(hWnd, lpPoint) {
        result := DllCall("USER32.dll\LogicalToPhysicalPointForPerMonitorDPI", "ptr", hWnd, "ptr", lpPoint, "int")
        return result
    }

    /**
     * Converts a point in a window from physical coordinates into logical coordinates, regardless of the dots per inch (dpi) awareness of the caller.
     * @param {Pointer<Void>} hWnd A handle to the window whose transform is used for the conversion.
     * @param {Pointer<POINT>} lpPoint A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that specifies the physical/screen coordinates to be converted. The new logical coordinates are copied into this structure if the function succeeds.
     * @returns {Integer} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-physicaltologicalpointforpermonitordpi
     * @since windows8.1
     */
    static PhysicalToLogicalPointForPerMonitorDPI(hWnd, lpPoint) {
        result := DllCall("USER32.dll\PhysicalToLogicalPointForPerMonitorDPI", "ptr", hWnd, "ptr", lpPoint, "int")
        return result
    }

    /**
     * Retrieves the value of one of the system-wide parameters, taking into account the provided DPI value.
     * @param {Integer} uiAction The system-wide parameter to be retrieved. This function is only intended for use with <b>SPI_GETICONTITLELOGFONT</b>, <b>SPI_GETICONMETRICS</b>, or <b>SPI_GETNONCLIENTMETRICS</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-systemparametersinfoa">SystemParametersInfo</a> for more information on these values.
     * @param {Integer} uiParam A parameter whose usage and format depends on the system parameter being queried. For more information about system-wide parameters, see the <i>uiAction</i> parameter. If not otherwise indicated, you must specify zero for this parameter.
     * @param {Pointer<Void>} pvParam A parameter whose usage and format depends on the system parameter being queried. For more information about system-wide parameters, see the <i>uiAction</i> parameter. If not otherwise indicated, you must specify <b>NULL</b> for this parameter. For information on the <b>PVOID</b> datatype, see <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">Windows Data Types</a>.
     * @param {Integer} fWinIni Has no effect for with this API. This parameter only has an effect if you're setting parameter.
     * @param {Integer} dpi The DPI to use for scaling the metric.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-systemparametersinfofordpi
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
     * @param {Pointer<Void>} dpiContext The new <a href="https://docs.microsoft.com/windows/desktop/hidpi/dpi-awareness-context">DPI_AWARENESS_CONTEXT</a> for the current thread. This context includes the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ne-windef-dpi_awareness">DPI_AWARENESS</a> value.
     * @returns {Pointer<Void>} The old <a href="/windows/desktop/hidpi/dpi-awareness-context">DPI_AWARENESS_CONTEXT</a> for the thread. If the <i>dpiContext</i> is invalid, the thread will not be updated and the return value will be <b>NULL</b>. You can use this value to restore the old <b>DPI_AWARENESS_CONTEXT</b> after overriding it with a predefined value.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setthreaddpiawarenesscontext
     * @since windows10.0.14393
     */
    static SetThreadDpiAwarenessContext(dpiContext) {
        result := DllCall("USER32.dll\SetThreadDpiAwarenessContext", "ptr", dpiContext, "ptr")
        return result
    }

    /**
     * Gets the DPI_AWARENESS_CONTEXT for the current thread.
     * @returns {Pointer<Void>} The current <a href="/windows/desktop/hidpi/dpi-awareness-context">DPI_AWARENESS_CONTEXT</a> for the thread.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getthreaddpiawarenesscontext
     * @since windows10.0.14393
     */
    static GetThreadDpiAwarenessContext() {
        result := DllCall("USER32.dll\GetThreadDpiAwarenessContext", "ptr")
        return result
    }

    /**
     * Returns the DPI_AWARENESS_CONTEXT associated with a window.
     * @param {Pointer<Void>} hwnd The window to query.
     * @returns {Pointer<Void>} The <a href="/windows/desktop/hidpi/dpi-awareness-context">DPI_AWARENESS_CONTEXT</a> for the provided window. If the window is not valid, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getwindowdpiawarenesscontext
     * @since windows10.0.14393
     */
    static GetWindowDpiAwarenessContext(hwnd) {
        result := DllCall("USER32.dll\GetWindowDpiAwarenessContext", "ptr", hwnd, "ptr")
        return result
    }

    /**
     * Retrieves the DPI_AWARENESS value from a DPI_AWARENESS_CONTEXT.
     * @param {Pointer<Void>} value The <b>DPI_AWARENESS_CONTEXT</b> you want to examine.
     * @returns {Integer} The <a href="/windows/desktop/api/windef/ne-windef-dpi_awareness">DPI_AWARENESS</a>. If the provided <i>value</i> is <b>null</b> or invalid, this method will return <b>DPI_AWARENESS_INVALID</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getawarenessfromdpiawarenesscontext
     * @since windows10.0.14393
     */
    static GetAwarenessFromDpiAwarenessContext(value) {
        result := DllCall("USER32.dll\GetAwarenessFromDpiAwarenessContext", "ptr", value, "int")
        return result
    }

    /**
     * Retrieves the DPI from a given DPI_AWARENESS_CONTEXT handle. This enables you to determine the DPI of a thread without needed to examine a window created within that thread.
     * @param {Pointer<Void>} value The <b>DPI_AWARENESS_CONTEXT</b> handle to examine.
     * @returns {Integer} The DPI value associated with the <b>DPI_AWARENESS_CONTEXT</b> handle.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getdpifromdpiawarenesscontext
     * @since windows10.0.17134
     */
    static GetDpiFromDpiAwarenessContext(value) {
        result := DllCall("USER32.dll\GetDpiFromDpiAwarenessContext", "ptr", value, "uint")
        return result
    }

    /**
     * Determines whether two DPI_AWARENESS_CONTEXT values are identical.
     * @param {Pointer<Void>} dpiContextA The first value to compare.
     * @param {Pointer<Void>} dpiContextB The second value to compare.
     * @returns {Integer} Returns <b>TRUE</b> if the values are equal, otherwise <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-aredpiawarenesscontextsequal
     * @since windows10.0.14393
     */
    static AreDpiAwarenessContextsEqual(dpiContextA, dpiContextB) {
        result := DllCall("USER32.dll\AreDpiAwarenessContextsEqual", "ptr", dpiContextA, "ptr", dpiContextB, "int")
        return result
    }

    /**
     * Determines if a specified DPI_AWARENESS_CONTEXT is valid and supported by the current system.
     * @param {Pointer<Void>} value The context that you want to determine if it is supported.
     * @returns {Integer} <b>TRUE</b> if the provided context is supported, otherwise <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-isvaliddpiawarenesscontext
     * @since windows10.0.14393
     */
    static IsValidDpiAwarenessContext(value) {
        result := DllCall("USER32.dll\IsValidDpiAwarenessContext", "ptr", value, "int")
        return result
    }

    /**
     * Returns the dots per inch (dpi) value for the associated window.
     * @param {Pointer<Void>} hwnd The window you want to get information about.
     * @returns {Integer} The DPI for the window which depends on the <a href="/windows/desktop/api/windef/ne-windef-dpi_awareness">DPI_AWARENESS</a> of the window. See the Remarks for more information. An invalid <i>hwnd</i> value will result in a return value of 0.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getdpiforwindow
     * @since windows10.0.14393
     */
    static GetDpiForWindow(hwnd) {
        result := DllCall("USER32.dll\GetDpiForWindow", "ptr", hwnd, "uint")
        return result
    }

    /**
     * Returns the system DPI.
     * @returns {Integer} The system DPI value.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getdpiforsystem
     * @since windows10.0.14393
     */
    static GetDpiForSystem() {
        result := DllCall("USER32.dll\GetDpiForSystem", "uint")
        return result
    }

    /**
     * Retrieves the system DPI associated with a given process. This is useful for avoiding compatibility issues that arise from sharing DPI-sensitive information between multiple system-aware processes with different system DPI values.
     * @param {Pointer<Void>} hProcess The handle for the process to examine. If this value is null, this API behaves identically to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getdpiforsystem">GetDpiForSystem</a>.
     * @returns {Integer} The process's system DPI value.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getsystemdpiforprocess
     * @since windows10.0.17134
     */
    static GetSystemDpiForProcess(hProcess) {
        result := DllCall("USER32.dll\GetSystemDpiForProcess", "ptr", hProcess, "uint")
        return result
    }

    /**
     * In high-DPI displays, enables automatic display scaling of the non-client area portions of the specified top-level window. Must be called during the initialization of that window.
     * @param {Pointer<Void>} hwnd The window that should have automatic scaling enabled.
     * @returns {Integer} If the function succeeds, the return value is nonzero. If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-enablenonclientdpiscaling
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
     * @param {Pointer<Void>} value A <a href="https://docs.microsoft.com/windows/desktop/hidpi/dpi-awareness-context">DPI_AWARENESS_CONTEXT</a> handle to set.
     * @returns {Integer} This function returns TRUE if the operation was successful, and FALSE otherwise. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Possible errors are <b>ERROR_INVALID_PARAMETER</b> for an invalid input, and <b>ERROR_ACCESS_DENIED</b> if the default API awareness mode for the process has already been set (via a previous API call or within the application manifest).
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setprocessdpiawarenesscontext
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
     * @param {Pointer<Void>} hProcess 
     * @returns {Pointer<Void>} 
     */
    static GetDpiAwarenessContextForProcess(hProcess) {
        result := DllCall("USER32.dll\GetDpiAwarenessContextForProcess", "ptr", hProcess, "ptr")
        return result
    }

    /**
     * Sets the thread's DPI_HOSTING_BEHAVIOR. This behavior allows windows created in the thread to host child windows with a different DPI_AWARENESS_CONTEXT.
     * @param {Integer} value The new <a href="https://docs.microsoft.com/windows/desktop/api/windef/ne-windef-dpi_hosting_behavior">DPI_HOSTING_BEHAVIOR</a> value for the current thread.
     * @returns {Integer} The previous <a href="/windows/desktop/api/windef/ne-windef-dpi_hosting_behavior">DPI_HOSTING_BEHAVIOR</a> for the thread. If the hosting behavior passed in is invalid, the thread will not be updated and the return value will be <b>DPI_HOSTING_BEHAVIOR_INVALID</b>. You can use this value to restore the old <b>DPI_HOSTING_BEHAVIOR</b> after overriding it with a predefined value.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setthreaddpihostingbehavior
     * @since windows10.0.17134
     */
    static SetThreadDpiHostingBehavior(value) {
        result := DllCall("USER32.dll\SetThreadDpiHostingBehavior", "int", value, "int")
        return result
    }

    /**
     * Retrieves the DPI_HOSTING_BEHAVIOR from the current thread.
     * @returns {Integer} The <a href="/windows/desktop/api/windef/ne-windef-dpi_hosting_behavior">DPI_HOSTING_BEHAVIOR</a> of the current thread.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getthreaddpihostingbehavior
     * @since windows10.0.17134
     */
    static GetThreadDpiHostingBehavior() {
        result := DllCall("USER32.dll\GetThreadDpiHostingBehavior", "int")
        return result
    }

    /**
     * Returns the DPI_HOSTING_BEHAVIOR of the specified window.
     * @param {Pointer<Void>} hwnd The handle for the window to examine.
     * @returns {Integer} The <a href="/windows/desktop/api/windef/ne-windef-dpi_hosting_behavior">DPI_HOSTING_BEHAVIOR</a> of the specified window.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getwindowdpihostingbehavior
     * @since windows10.0.17134
     */
    static GetWindowDpiHostingBehavior(hwnd) {
        result := DllCall("USER32.dll\GetWindowDpiHostingBehavior", "ptr", hwnd, "int")
        return result
    }

    /**
     * Sets the process-default DPI awareness level. This is equivalent to calling SetProcessDpiAwarenessContext with the corresponding DPI_AWARENESS_CONTEXT value.
     * @param {Integer} value The DPI awareness value to set. Possible values are from the <a href="https://docs.microsoft.com/windows/desktop/api/shellscalingapi/ne-shellscalingapi-process_dpi_awareness">PROCESS_DPI_AWARENESS</a>enumeration.
     * @returns {HRESULT} This function returns one of the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//shellscalingapi/nf-shellscalingapi-setprocessdpiawareness
     * @since windows8.1
     */
    static SetProcessDpiAwareness(value) {
        result := DllCall("api-ms-win-shcore-scaling-l1-1-1.dll\SetProcessDpiAwareness", "int", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the dots per inch (dpi) awareness of the specified process.
     * @param {Pointer<Void>} hprocess Handle of the process that is being queried. If this parameter is NULL, the current process is queried.
     * @param {Pointer<Int32>} value The DPI awareness of the specified process. Possible values are from the <a href="https://docs.microsoft.com/windows/desktop/api/shellscalingapi/ne-shellscalingapi-process_dpi_awareness">PROCESS_DPI_AWARENESS</a> enumeration.
     * @returns {HRESULT} This function returns one of the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//shellscalingapi/nf-shellscalingapi-getprocessdpiawareness
     * @since windows8.1
     */
    static GetProcessDpiAwareness(hprocess, value) {
        result := DllCall("api-ms-win-shcore-scaling-l1-1-1.dll\GetProcessDpiAwareness", "ptr", hprocess, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Queries the dots per inch (dpi) of a display.
     * @param {Pointer<Void>} hmonitor Handle of the monitor being queried.
     * @param {Integer} dpiType The type of DPI being queried. Possible values are from the <a href="https://docs.microsoft.com/windows/desktop/api/shellscalingapi/ne-shellscalingapi-monitor_dpi_type">MONITOR_DPI_TYPE</a> enumeration.
     * @param {Pointer<UInt32>} dpiX The value of the DPI along the X axis. This value always refers to the horizontal edge, even when the screen is rotated.
     * @param {Pointer<UInt32>} dpiY The value of the DPI along the Y axis. This value always refers to the vertical edge, even when the screen is rotated.
     * @returns {HRESULT} This function returns one of the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//shellscalingapi/nf-shellscalingapi-getdpiformonitor
     * @since windows8.1
     */
    static GetDpiForMonitor(hmonitor, dpiType, dpiX, dpiY) {
        result := DllCall("api-ms-win-shcore-scaling-l1-1-1.dll\GetDpiForMonitor", "ptr", hmonitor, "int", dpiType, "uint*", dpiX, "uint*", dpiY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
