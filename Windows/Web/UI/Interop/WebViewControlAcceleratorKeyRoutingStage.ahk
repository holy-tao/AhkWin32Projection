#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * An enumeration that describes the accelerator key routing stage.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolacceleratorkeyroutingstage
 * @namespace Windows.Web.UI.Interop
 * @version WindowsRuntime 1.4
 */
class WebViewControlAcceleratorKeyRoutingStage extends Win32Enum{

    /**
     * Routing stage is tunneling.
     * @type {Integer (Int32)}
     */
    static Tunneling => 0

    /**
     * Routing stage is bubbling.
     * @type {Integer (Int32)}
     */
    static Bubbling => 1
}
