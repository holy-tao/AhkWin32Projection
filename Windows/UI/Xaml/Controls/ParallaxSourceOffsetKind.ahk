#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how the source offset values of a ParallaxView are interpreted.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxSourceOffsetKind](/windows/winui/api/microsoft.ui.xaml.controls.parallaxsourceoffsetkind) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxsourceoffsetkind
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ParallaxSourceOffsetKind extends Win32Enum{

    /**
     * The source start/end offset value is interpreted as an absolute value.
     * @type {Integer (Int32)}
     */
    static Absolute => 0

    /**
     * The source start/end offset value is added to the auto-computed source offset.
     * @type {Integer (Int32)}
     */
    static Relative => 1
}
