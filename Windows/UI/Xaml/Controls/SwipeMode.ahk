#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the effect of a swipe interaction.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeMode](/windows/winui/api/microsoft.ui.xaml.controls.swipemode) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * This enumeration is used by the [SwipeItems.Mode](swipeitems_mode.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipemode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SwipeMode extends Win32Enum{

    /**
     * A swipe reveals a menu of commands.
     * @type {Integer (Int32)}
     */
    static Reveal => 0

    /**
     * A swipe executes a command.
     * @type {Integer (Int32)}
     */
    static Execute => 1
}
