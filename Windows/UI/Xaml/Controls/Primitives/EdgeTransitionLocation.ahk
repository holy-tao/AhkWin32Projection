#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the location of edge transitions for edge UI, such as app bars.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.edgetransitionlocation
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class EdgeTransitionLocation extends Win32Enum{

    /**
     * Edge transition goes to left.
     * @type {Integer (Int32)}
     */
    static Left => 0

    /**
     * Edge transition goes to top.
     * @type {Integer (Int32)}
     */
    static Top => 1

    /**
     * Edge transition goes to right.
     * @type {Integer (Int32)}
     */
    static Right => 2

    /**
     * Edge transition goes to bottom.
     * @type {Integer (Int32)}
     */
    static Bottom => 3
}
