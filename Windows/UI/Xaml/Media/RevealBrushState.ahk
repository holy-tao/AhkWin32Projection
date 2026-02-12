#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * > [!Important]
  * > RevealBrush is available for use in the operating systems specified in the Requirements section. However, we do not recommend its use as it may be altered or unavailable in subsequent versions.
  * 
  * Defines constants that specify the pointer state of an element.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.RevealBrushState](/windows/winui/api/microsoft.ui.xaml.media.revealbrushstate) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.revealbrushstate
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class RevealBrushState extends Win32Enum{

    /**
     * The element is in its default state.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * The pointer is over the element.
     * @type {Integer (Int32)}
     */
    static PointerOver => 1

    /**
     * The element is pressed.
     * @type {Integer (Int32)}
     */
    static Pressed => 2
}
