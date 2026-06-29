#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains basic accounting information for a job object.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-jobobject_basic_accounting_information
 * @namespace Windows.Win32.System.JobObjects
 */
export default struct JOBOBJECT_BASIC_ACCOUNTING_INFORMATION {
    #StructPack 8

    /**
     * The total amount of user-mode execution time for all active processes associated with the job, as well as all terminated processes no longer associated with the job, in 100-nanosecond ticks.
     */
    TotalUserTime : Int64

    /**
     * The total amount of kernel-mode execution time for all active processes associated with the job, as well as all terminated processes no longer associated with the job, in 100-nanosecond ticks.
     */
    TotalKernelTime : Int64

    /**
     * The total amount of user-mode execution time for all active processes associated with the job (as well as all terminated processes no longer associated with the job) since the last call that set a per-job user-mode time limit, in 100-nanosecond ticks. 
     * 
     * 
     * 
     * 
     * This member is set to 0 on creation of the job, and each time a per-job user-mode time limit is established.
     */
    ThisPeriodTotalUserTime : Int64

    /**
     * The total amount of kernel-mode execution time for all active processes associated with the job (as well as all terminated processes no longer associated with the job) since the last call that set a per-job kernel-mode time limit, in 100-nanosecond ticks. 
     * 
     * 
     * 
     * 
     * This member is set to zero on creation of the job, and each time a per-job kernel-mode time limit is established.
     */
    ThisPeriodTotalKernelTime : Int64

    /**
     * The total number of page faults encountered by all active processes associated with the job, as well as all terminated processes no longer associated with the job.
     */
    TotalPageFaultCount : UInt32

    /**
     * The total number of processes associated with the job during its lifetime, including those that have terminated. For example, when a process is associated with a job, but the association fails because of a limit violation, this value is incremented.
     */
    TotalProcesses : UInt32

    /**
     * The total number of processes currently associated with the job. When a process is associated with a job, but the association fails because of a limit violation, this value is temporarily incremented. When the terminated process exits and all references to the process are released, this value is decremented.
     */
    ActiveProcesses : UInt32

    /**
     * The total number of processes terminated because of a limit violation.
     */
    TotalTerminatedProcesses : UInt32

}
