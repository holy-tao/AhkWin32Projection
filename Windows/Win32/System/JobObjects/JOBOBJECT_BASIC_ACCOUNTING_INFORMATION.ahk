#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains basic accounting information for a job object.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-jobobject_basic_accounting_information
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOBOBJECT_BASIC_ACCOUNTING_INFORMATION extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The total amount of user-mode execution time for all active processes associated with the job, as well as all terminated processes no longer associated with the job, in 100-nanosecond ticks.
     * @type {Integer}
     */
    TotalUserTime {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The total amount of kernel-mode execution time for all active processes associated with the job, as well as all terminated processes no longer associated with the job, in 100-nanosecond ticks.
     * @type {Integer}
     */
    TotalKernelTime {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The total amount of user-mode execution time for all active processes associated with the job (as well as all terminated processes no longer associated with the job) since the last call that set a per-job user-mode time limit, in 100-nanosecond ticks. 
     * 
     * 
     * 
     * 
     * This member is set to 0 on creation of the job, and each time a per-job user-mode time limit is established.
     * @type {Integer}
     */
    ThisPeriodTotalUserTime {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * The total amount of kernel-mode execution time for all active processes associated with the job (as well as all terminated processes no longer associated with the job) since the last call that set a per-job kernel-mode time limit, in 100-nanosecond ticks. 
     * 
     * 
     * 
     * 
     * This member is set to zero on creation of the job, and each time a per-job kernel-mode time limit is established.
     * @type {Integer}
     */
    ThisPeriodTotalKernelTime {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * The total number of page faults encountered by all active processes associated with the job, as well as all terminated processes no longer associated with the job.
     * @type {Integer}
     */
    TotalPageFaultCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The total number of processes associated with the job during its lifetime, including those that have terminated. For example, when a process is associated with a job, but the association fails because of a limit violation, this value is incremented.
     * @type {Integer}
     */
    TotalProcesses {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The total number of processes currently associated with the job. When a process is associated with a job, but the association fails because of a limit violation, this value is temporarily incremented. When the terminated process exits and all references to the process are released, this value is decremented.
     * @type {Integer}
     */
    ActiveProcesses {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The total number of processes terminated because of a limit violation.
     * @type {Integer}
     */
    TotalTerminatedProcesses {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
