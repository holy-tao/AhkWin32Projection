#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that specify whether the brush samples from the app content or from the content behind the app window.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.AcrylicBackgroundSource](/windows/winui/api/microsoft.ui.xaml.media.acrylicbackgroundsource) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.acrylicbackgroundsource
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class AcrylicBackgroundSource extends Win32Enum{

    /**
     * The brush samples from the content behind the app window.
     * @type {Integer (Int32)}
     */
    static HostBackdrop => 0

    /**
     * The brush samples from the app content.
     * @type {Integer (Int32)}
     */
    static Backdrop => 1
}
