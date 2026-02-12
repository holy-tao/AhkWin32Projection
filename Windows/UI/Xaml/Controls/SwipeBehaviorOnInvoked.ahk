#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how a [SwipeControl](swipecontrol.md) behaves after a command is invoked.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeBehaviorOnInvoked](/windows/winui/api/microsoft.ui.xaml.controls.swipebehavioroninvoked) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipebehavioroninvoked
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SwipeBehaviorOnInvoked extends Win32Enum{

    /**
     * In **Reveal** mode, the SwipeControl closes after an item is invoked. In **Execute** mode, the SwipeControl remains open.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * The SwipeControl closes after an item is invoked.
     * @type {Integer (Int32)}
     */
    static Close => 1

    /**
     * The SwipeControl remains open after an item is invoked.
     * @type {Integer (Int32)}
     */
    static RemainOpen => 2
}
