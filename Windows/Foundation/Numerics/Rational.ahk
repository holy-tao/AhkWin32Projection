#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Describes a number that can be created by the division of 2 integers.
 * @remarks
 * If you are representing a whole number, the denominator should be 1.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.numerics.rational
 * @namespace Windows.Foundation.Numerics
 * @version WindowsRuntime 1.4
 */
class Rational extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The number above the line in a fraction.
     * @type {Integer}
     */
    Numerator {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number below the line in a fraction.
     * @type {Integer}
     */
    Denominator {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
