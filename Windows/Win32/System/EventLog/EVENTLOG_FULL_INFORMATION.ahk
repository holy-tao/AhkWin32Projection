#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates whether the event log is full.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-eventlog_full_information
 * @namespace Windows.Win32.System.EventLog
 */
export default struct EVENTLOG_FULL_INFORMATION {
    #StructPack 4

    /**
     * Indicates whether the event log is full. If the log is full, this member is <b>TRUE</b>. Otherwise, it is <b>FALSE</b>.
     */
    dwFull : UInt32

}
