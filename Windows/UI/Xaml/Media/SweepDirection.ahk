#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the direction in which an elliptical arc is drawn.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.sweepdirection
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class SweepDirection extends Win32Enum{

    /**
     * Arcs are drawn in a counterclockwise (negative-angle) direction.
     * @type {Integer (Int32)}
     */
    static Counterclockwise => 0

    /**
     * Arcs are drawn in a clockwise (positive-angle) direction.
     * @type {Integer (Int32)}
     */
    static Clockwise => 1
}
