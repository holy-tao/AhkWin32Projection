#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AT_ENUM structure contains information about a submitted job. The NetScheduleJobEnum function uses this structure to enumerate and return information about an entire queue of submitted jobs.
 * @remarks
 * For more information about setting the bit flags to schedule jobs that execute once, jobs that execute multiple times, and jobs that execute periodically without deletion, see 
  * the <a href="https://docs.microsoft.com/windows/desktop/api/lmat/nf-lmat-netschedulejobadd">NetScheduleJobAdd</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/lmat/ns-lmat-at_enum
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class AT_ENUM extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The job identifier of a submitted (queued) job.
     * @type {Integer}
     */
    JobId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD_PTR</b>
     * 
     * A pointer to the time of day at which the job is scheduled to run. The time is the local time at a computer on which the schedule service is running; it is measured from midnight, and is expressed in milliseconds.
     * @type {Pointer}
     */
    JobTime {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A set of bit flags representing the days of the month. For each bit that is set, the scheduled job will run at the time specified by the <b>JobTime</b> member, on the corresponding day of the month. Bit 0 corresponds to the first day of the month, and so on. 
     * 
     * 
     * 
     * 
     * The value of the bitmask is zero if the job was scheduled to run only once, at the first occurrence specified in the <b>JobTime</b> member
     * @type {Integer}
     */
    DaysOfMonth {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>UCHAR</b>
     * 
     * A set of bit flags representing the days of the week. For each bit that is set, the scheduled job will run at the time specified by the <b>JobTime</b> member, on the corresponding day of the week. Bit 0 corresponds to Monday, and so on. 
     * 
     * 
     * 
     * 
     * The value of the bitmask is zero if the job was scheduled to run only once, at the first occurrence specified in the <b>JobTime</b> member.
     * @type {Integer}
     */
    DaysOfWeek {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * Type: <b>UCHAR</b>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 21, "char")
        set => NumPut("char", value, this, 21)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains the name of the command, batch program, or binary file to execute.
     * @type {Pointer<PWSTR>}
     */
    Command {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
