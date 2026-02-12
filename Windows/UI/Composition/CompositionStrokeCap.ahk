#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the shape at the end of a line or segment.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionstrokecap
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionStrokeCap extends Win32Enum{

    /**
     * A cap that does not extend past the last point of the line.
     * @type {Integer (Int32)}
     */
    static Flat => 0

    /**
     * Half of a square that has a length equal to the line thickness.
     * @type {Integer (Int32)}
     */
    static Square => 1

    /**
     * A semicircle that has a diameter equal to the line thickness.
     * @type {Integer (Int32)}
     */
    static Round => 2

    /**
     * An isosceles right triangle whose hypotenuse is equal in length to the thickness of the line.
     * @type {Integer (Int32)}
     */
    static Triangle => 3
}
