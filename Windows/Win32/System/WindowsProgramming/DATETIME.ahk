#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Returns the date and time value represented by datetime or expression.
 * @remarks
 * If _datetime_  is missing or cannot be interpreted as a valid date or time, DATETIME returns a #VALUE! error.
 *   
 * The returned value is formatted according to the short date style and time style in the system's current Regional Settings.
 *   
 * The DATETIME function also accepts a single number value for _expression_  where the integer portion of the result represents the number of days since December 30, 1899, and the decimal portion represents the fraction of a day since midnight.
 * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/datetime-function
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class DATETIME extends Win32Struct
{
    static sizeof => 12

    static packingSize => 2

    /**
     * @type {Integer}
     */
    year {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    month {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    day {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    hour {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    min {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    sec {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }
}
