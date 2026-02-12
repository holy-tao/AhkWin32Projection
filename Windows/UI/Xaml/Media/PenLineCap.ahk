#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the shape at the end of a line or segment.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.penlinecap
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class PenLineCap extends Win32Enum{

    /**
     * A cap that does not extend past the last point of the line. Comparable to no line cap.
     * @type {Integer (Int32)}
     */
    static Flat => 0

    /**
     * A rectangle that has a height equal to the line thickness and a length equal to half the line thickness.
     * @type {Integer (Int32)}
     */
    static Square => 1

    /**
     * A semicircle that has a diameter equal to the line thickness.
     * @type {Integer (Int32)}
     */
    static Round => 2

    /**
     * An isosceles right triangle whose base length is equal to the thickness of the line.
     * @type {Integer (Int32)}
     */
    static Triangle => 3
}
