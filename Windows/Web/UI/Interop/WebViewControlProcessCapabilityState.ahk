#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the state of the [Windows.Web.UI.Interop.WebViewControlProcess](webviewcontrolprocess.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolprocesscapabilitystate
 * @namespace Windows.Web.UI.Interop
 * @version WindowsRuntime 1.4
 */
class WebViewControlProcessCapabilityState extends Win32Enum{

    /**
     * The process is in an unknown state.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * The process is disabled.
     * @type {Integer (Int32)}
     */
    static Disabled => 1

    /**
     * The process is enabled.
     * @type {Integer (Int32)}
     */
    static Enabled => 2
}
