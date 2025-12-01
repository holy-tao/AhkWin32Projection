#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ENG_TIME_FIELDS structure is used by the EngQueryLocalTime function to return the local time.
 * @remarks
 * The driver is responsible for allocating the ENG_TIME_FIELDS structure and passing its pointer to <b>EngQueryLocalTime</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-eng_time_fields
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class ENG_TIME_FIELDS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 2

    /**
     * Specifies the current calendar year. The range is [1601,...].
     * @type {Integer}
     */
    usYear {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Specifies the current calendar month. The range is [1,12].
     * @type {Integer}
     */
    usMonth {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Specifies the current calendar day. The range is [1,31].
     * @type {Integer}
     */
    usDay {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Specifies the current hour. The range is [0,23].
     * @type {Integer}
     */
    usHour {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Specifies the current minute. The range is [0,59].
     * @type {Integer}
     */
    usMinute {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Specifies the current second. The range is [0,59].
     * @type {Integer}
     */
    usSecond {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * Specifies the current millisecond. The range is [0,999].
     * @type {Integer}
     */
    usMilliseconds {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * Specifies the current day. The range is [0,6], where 0 is Sunday and 6 is Saturday.
     * @type {Integer}
     */
    usWeekday {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }
}
