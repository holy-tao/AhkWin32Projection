#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The FillMode enumeration specifies how to fill areas that are formed when a path or curve intersects itself.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-fillmode
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class FillMode extends Win32Enum{

    /**
     * Specifies that areas are filled according to the even-odd parity rule. According to this rule, you can determine whether a test point is inside or outside a closed curve as follows: Draw a line from the test point to a point that is distant from the curve. If that line crosses the curve an odd number of times, the test point is inside the curve; otherwise, the test point is outside the curve.
     * @type {Integer (Int32)}
     */
    static FillModeAlternate => 0

    /**
     * Specifies that areas are filled according to the nonzero winding rule. According to this rule, you can determine whether a test point is inside or outside a closed curve as follows: Draw a line from a test point to a point that is distant from the curve. Count the number of times the curve crosses the test line from left to right, and count the number of times the curve crosses the test line from right to left. If those two numbers are the same, the test point is outside the curve; otherwise, the test point is inside the curve.
     * @type {Integer (Int32)}
     */
    static FillModeWinding => 1
}
