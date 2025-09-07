#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WMDMDATETIME structure contains a date and time of day.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdmdatetime
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class WMDMDATETIME extends Win32Struct
{
    static sizeof => 12

    static packingSize => 2

    /**
     * Word containing the four-digit year.
     * @type {Integer}
     */
    wYear {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Word containing the month (1-12).
     * @type {Integer}
     */
    wMonth {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Word containing the day of the month (1-31).
     * @type {Integer}
     */
    wDay {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Word containing the hour (0-23).
     * @type {Integer}
     */
    wHour {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Word containing the minute (0-59).
     * @type {Integer}
     */
    wMinute {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Word containing the second (0-59).
     * @type {Integer}
     */
    wSecond {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }
}
