#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a date-and-time value.
 * @remarks
 * This structure is a packed date-and-time value that can store years between 1601 and 67136 and times that are accurate to the millisecond.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/ns-winsync-sync_time
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class SYNC_TIME extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The date portion of the value.
     * @type {Integer}
     */
    dwDate {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The time portion of the value.
     * @type {Integer}
     */
    dwTime {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
