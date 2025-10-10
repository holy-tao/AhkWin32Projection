#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DATE_TIME structure defines a 64-bit integer value that contains a date/time, expressed as the number of ticks (100-nanosecond increments) since 12:00 midnight, January 1, 1 C.E. in the Gregorian calendar.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-date_time
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DATE_TIME extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the lower 32 bits of the time value.
     * @type {Integer}
     */
    dwLowDateTime {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the upper 32 bits of the time value.
     * @type {Integer}
     */
    dwHighDateTime {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
