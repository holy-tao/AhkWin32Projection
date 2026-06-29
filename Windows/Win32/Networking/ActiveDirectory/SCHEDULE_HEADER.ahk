#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used to contain the replication schedule data for a replication source.
 * @see https://learn.microsoft.com/windows/win32/api/schedule/ns-schedule-schedule_header
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct SCHEDULE_HEADER {
    #StructPack 4

    Type : UInt32

    /**
     * Contains the offset, in bytes, from the beginning of the <a href="https://docs.microsoft.com/windows/desktop/api/schedule/ns-schedule-schedule">SCHEDULE</a> structure to the data for this schedule. The size and form of this data depends on the schedule type defined by the <b>Type</b> member.
     */
    Offset : UInt32

}
