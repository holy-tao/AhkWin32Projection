#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether icon buttons are displayed when an app bar is not completely open.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarcloseddisplaymode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class AppBarClosedDisplayMode extends Win32Enum{

    /**
     * Icon buttons are displayed but labels are not visible.
     * @type {Integer (Int32)}
     */
    static Compact => 0

    /**
     * Only the ellipsis is displayed. Neither icon buttons nor labels are visible.
     * @type {Integer (Int32)}
     */
    static Minimal => 1

    /**
     * The app bar is not displayed.
     * @type {Integer (Int32)}
     */
    static Hidden => 2
}
