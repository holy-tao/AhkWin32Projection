#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the date of manufacture of a battery.
 * @remarks
 * The date is encoded in the Gregorian or western calendar format.
 * @see https://learn.microsoft.com/windows/win32/Power/battery-manufacture-date-str
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class BATTERY_MANUFACTURE_DATE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * The day of the month of manufacture, in the range 1 to 31. In spite of the data type, this is not an ASCII encoded value. It is an unsigned byte.
     * @type {Integer}
     */
    Day {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The month of manufacture, in the range 1 (January) to 12 (December). In spite of the data type, this is not an ASCII encoded value. It is an unsigned byte.
     * @type {Integer}
     */
    Month {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * The year of manufacture. This will typically be in the range 1900-2100.
     * @type {Integer}
     */
    Year {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
