#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * An enum that describes the reason for move the focus.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolmovefocusreason
 * @namespace Windows.Web.UI.Interop
 * @version WindowsRuntime 1.4
 */
class WebViewControlMoveFocusReason extends Win32Enum{

    /**
     * Focus was moved programmatically.
     * @type {Integer (Int32)}
     */
    static Programmatic => 0

    /**
     * Focus was moved to the next.
     * @type {Integer (Int32)}
     */
    static Next => 1

    /**
     * Focus was moved to the previous.
     * @type {Integer (Int32)}
     */
    static Previous => 2
}
