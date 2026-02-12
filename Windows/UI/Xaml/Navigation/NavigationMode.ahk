#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the navigation stack characteristics of a navigation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.navigationmode
 * @namespace Windows.UI.Xaml.Navigation
 * @version WindowsRuntime 1.4
 */
class NavigationMode extends Win32Enum{

    /**
     * Navigation is to a new instance of a page (not going forward or backward in the stack).
     * @type {Integer (Int32)}
     */
    static New => 0

    /**
     * Navigation is going backward in the stack.
     * @type {Integer (Int32)}
     */
    static Back => 1

    /**
     * Navigation is going forward in the stack.
     * @type {Integer (Int32)}
     */
    static Forward => 2

    /**
     * Navigation is to the current page (perhaps with different data).
     * @type {Integer (Int32)}
     */
    static Refresh => 3
}
