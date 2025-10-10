#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies date and time information for transitions between standard time and daylight saving time.
 * @see https://docs.microsoft.com/windows/win32/api//wtsdefs/ns-wtsdefs-wts_systemtime
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_SYSTEMTIME extends Win32Struct
{
    static sizeof => 16

    static packingSize => 2

    /**
     * The year from 1601 to 30827.
     * @type {Integer}
     */
    wYear {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    wMonth {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * 
     * @type {Integer}
     */
    wDayOfWeek {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * The day of the month when the transition occurs.
     * @type {Integer}
     */
    wDay {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * The hour when the transition occurs.
     * @type {Integer}
     */
    wHour {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The minute when the transition occurs.
     * @type {Integer}
     */
    wMinute {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * The second when the transition occurs.
     * @type {Integer}
     */
    wSecond {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * The millisecond when the transition occurs.
     * @type {Integer}
     */
    wMilliseconds {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }
}
