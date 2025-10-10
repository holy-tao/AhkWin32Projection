#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to contain the replication schedule data for a replication source.
 * @see https://docs.microsoft.com/windows/win32/api//schedule/ns-schedule-schedule_header
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class SCHEDULE_HEADER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains the offset, in bytes, from the beginning of the <a href="https://docs.microsoft.com/windows/desktop/api/schedule/ns-schedule-schedule">SCHEDULE</a> structure to the data for this schedule. The size and form of this data depends on the schedule type defined by the <b>Type</b> member.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
