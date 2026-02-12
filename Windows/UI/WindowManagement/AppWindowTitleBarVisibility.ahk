#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the preferred visibility of an AppWindowTitleBar.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowtitlebarvisibility
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class AppWindowTitleBarVisibility extends Win32Enum{

    /**
     * The title bar uses the system default visibility.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * The title bar is always hidden.
     * @type {Integer (Int32)}
     */
    static AlwaysHidden => 1
}
