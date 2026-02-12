#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the style of frame used for the app window.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowframestyle
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class AppWindowFrameStyle extends Win32Enum{

    /**
     * The system default frame style is used for the current window.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * No frame is used for the current window.
     * @type {Integer (Int32)}
     */
    static NoFrame => 1
}
