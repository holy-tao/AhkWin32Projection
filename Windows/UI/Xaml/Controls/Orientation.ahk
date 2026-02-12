#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the different orientations that a control or layout can have.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.orientation
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class Orientation extends Win32Enum{

    /**
     * The control or layout should be vertically oriented.
     * @type {Integer (Int32)}
     */
    static Vertical => 0

    /**
     * The control or layout should be horizontally oriented.
     * @type {Integer (Int32)}
     */
    static Horizontal => 1
}
