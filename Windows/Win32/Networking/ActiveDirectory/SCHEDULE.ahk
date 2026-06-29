#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCHEDULE_HEADER.ahk" { SCHEDULE_HEADER }

/**
 * Used with the DsReplicaAdd and DsReplicaModify functions to contain replication schedule data for a replication source.
 * @see https://learn.microsoft.com/windows/win32/api/schedule/ns-schedule-schedule
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct SCHEDULE {
    #StructPack 4

    /**
     * Contains the size, in bytes, of the <b>SCHEDULE</b> structure, including the size of all of the elements and data of the <b>Schedules</b> array.
     */
    Size : UInt32

    /**
     * Not used.
     */
    Bandwidth : UInt32

    /**
     * Contains the number of elements in the <b>Schedules</b> array.
     */
    NumberOfSchedules : UInt32

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/schedule/ns-schedule-schedule_header">SCHEDULE_HEADER</a> structures that contain the replication schedule data for the replication source. The <b>NumberOfSchedules</b> member contains the number of elements in this array. Currently, this array can only contain one element.
     */
    Schedules : SCHEDULE_HEADER[1]

}
