#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SCHEDULE_HEADER.ahk

/**
 * Used with the DsReplicaAdd and DsReplicaModify functions to contain replication schedule data for a replication source.
 * @see https://learn.microsoft.com/windows/win32/api/schedule/ns-schedule-schedule
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class SCHEDULE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Contains the size, in bytes, of the <b>SCHEDULE</b> structure, including the size of all of the elements and data of the <b>Schedules</b> array.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    Bandwidth {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains the number of elements in the <b>Schedules</b> array.
     * @type {Integer}
     */
    NumberOfSchedules {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/schedule/ns-schedule-schedule_header">SCHEDULE_HEADER</a> structures that contain the replication schedule data for the replication source. The <b>NumberOfSchedules</b> member contains the number of elements in this array. Currently, this array can only contain one element.
     * @type {Array<SCHEDULE_HEADER>}
     */
    Schedules{
        get {
            if(!this.HasProp("__SchedulesProxyArray"))
                this.__SchedulesProxyArray := Win32FixedArray(this.ptr + 16, 1, SCHEDULE_HEADER, "")
            return this.__SchedulesProxyArray
        }
    }
}
