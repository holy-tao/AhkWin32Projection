#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates whether the event log is full.
 * @see https://docs.microsoft.com/windows/win32/api//winbase/ns-winbase-eventlog_full_information
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVENTLOG_FULL_INFORMATION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Indicates whether the event log is full. If the log is full, this member is <b>TRUE</b>. Otherwise, it is <b>FALSE</b>.
     * @type {Integer}
     */
    dwFull {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
