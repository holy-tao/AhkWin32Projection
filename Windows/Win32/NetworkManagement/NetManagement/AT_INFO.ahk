#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AT_INFO structure contains information about a job.
 * @remarks
 * For more information about scheduling jobs that execute once, jobs that execute multiple times, and jobs that execute periodically without deletion, see 
  * <a href="https://docs.microsoft.com/windows/desktop/api/lmat/nf-lmat-netschedulejobadd">NetScheduleJobAdd</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmat/ns-lmat-at_info
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class AT_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>DWORD_PTR</b>
     * 
     * A pointer to a value that indicates the time of day at which the job is scheduled to run. The time is the local time at a computer on which the schedule service is running; it is measured from midnight, and is expressed in milliseconds.
     * @type {Pointer}
     */
    JobTime {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A set of bit flags representing the days of the month. For each bit that is set, the scheduled job will run at the time specified by the <b>JobTime</b> member, on the corresponding day of the month. Bit 0 corresponds to the first day of the month, and so on.
     * 
     * The value of the bitmask is zero if the job was scheduled to run only once, at the first occurrence specified by the <b>JobTime</b> member.
     * @type {Integer}
     */
    DaysOfMonth {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>UCHAR</b>
     * 
     * A set of bit flags representing the days of the week. For each bit that is set, the scheduled job will run at the time specified by the <b>JobTime</b> member, on the corresponding day of the week. Bit 0 corresponds to Monday, and so on. 
     * 
     * 
     * 
     * 
     * The value of the bitmask is zero if the job was scheduled to run only once, at the first occurrence specified by the <b>JobTime</b> member.
     * @type {Integer}
     */
    DaysOfWeek {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * Type: <b>UCHAR</b>
     * 
     * A set of bit flags describing job properties. 
     * 
     * 
     * 
     * 
     *  When you submit a job using a call to the
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains the name of the command, batch program, or binary file to execute.
     * @type {Pointer<PWSTR>}
     */
    Command {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
