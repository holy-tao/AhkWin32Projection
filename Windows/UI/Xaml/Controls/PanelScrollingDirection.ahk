#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the direction that a panel is scrolling.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.panelscrollingdirection
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class PanelScrollingDirection extends Win32Enum{

    /**
     * The panel is not scrolling.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The panel is scrolling forward.
     * @type {Integer (Int32)}
     */
    static Forward => 1

    /**
     * The panel is scrolling backward.
     * @type {Integer (Int32)}
     */
    static Backward => 2
}
