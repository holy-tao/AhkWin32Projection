#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains basic limit information for a job object.
 * @remarks
 * Processes can still empty their working sets using the 
  * <a href="https://docs.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-setprocessworkingsetsize">SetProcessWorkingSetSize</a> function with (<b>SIZE_T</b>)-1, even when <b>JOB_OBJECT_LIMIT_WORKINGSET</b> is used. However, you cannot use <b>SetProcessWorkingSetSize</b> change the minimum or maximum working set size of a process in a job object.
  * 
  * The system increments the active process count when you attempt to associate a process with a job. If the limit is exceeded, the system decrements the active process count only when the process terminates and all handles to the process are closed. Therefore, if you have an open handle to a process that has been terminated in such a manner, you cannot associate any new processes until the handle is closed and the active process count is below the limit.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-jobobject_basic_limit_information
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOBOBJECT_BASIC_LIMIT_INFORMATION extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * If <b>LimitFlags</b> specifies <b>JOB_OBJECT_LIMIT_PROCESS_TIME</b>, this member is the per-process user-mode execution time limit, in 100-nanosecond ticks. Otherwise, this member is ignored. 
     * 
     * 
     * 
     * 
     * The system periodically checks to determine whether each process associated with the job has accumulated more user-mode time than the set limit. If it has, the process is terminated.
     * 
     * If the job is nested, the effective limit is the most restrictive limit in the job chain.
     * @type {Integer}
     */
    PerProcessUserTimeLimit {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * If <b>LimitFlags</b> specifies <b>JOB_OBJECT_LIMIT_JOB_TIME</b>, this member is the per-job user-mode execution time limit, in 100-nanosecond ticks. Otherwise, this member is ignored. 
     * 
     * 
     * 
     * 
     * The system adds the current time of the processes associated with the job to this limit. For example, if you set this limit to 1 minute, and the job has a process that has accumulated 5 minutes of user-mode time, the limit actually enforced is 6 minutes.
     * 
     * The system periodically checks to determine whether the sum of the user-mode execution time for all processes is greater than this end-of-job limit. If it is, the action specified in the <b>EndOfJobTimeAction</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-jobobject_end_of_job_time_information">JOBOBJECT_END_OF_JOB_TIME_INFORMATION</a> structure is carried out. By default, all processes are terminated and the status code is set to <b>ERROR_NOT_ENOUGH_QUOTA</b>.
     * 
     * To register  for  notification when this limit is exceeded without terminating processes, use the <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-setinformationjobobject">SetInformationJobObject</a> function with the <b>JobObjectNotificationLimitInformation</b> information class.
     * @type {Integer}
     */
    PerJobUserTimeLimit {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    LimitFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * If <b>LimitFlags</b> specifies <b>JOB_OBJECT_LIMIT_WORKINGSET</b>, this member is the minimum working set size in bytes for each process associated with the job. Otherwise, this member is ignored.
     * 
     * If <b>MaximumWorkingSetSize</b> is nonzero, <b>MinimumWorkingSetSize</b> cannot be zero.
     * @type {Pointer}
     */
    MinimumWorkingSetSize {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * If <b>LimitFlags</b> specifies <b>JOB_OBJECT_LIMIT_WORKINGSET</b>, this member is the maximum working set size in bytes for each process associated with the job. Otherwise, this member is ignored.
     * 
     * If <b>MinimumWorkingSetSize</b> is nonzero, <b>MaximumWorkingSetSize</b> cannot be zero.
     * @type {Pointer}
     */
    MaximumWorkingSetSize {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * If <b>LimitFlags</b> specifies <b>JOB_OBJECT_LIMIT_ACTIVE_PROCESS</b>, this member is the active process limit for the job. Otherwise, this member is ignored.
     * 
     * If you try to associate a process with a job, and this causes the active process count to exceed this limit, the process is terminated and the association fails.
     * @type {Integer}
     */
    ActiveProcessLimit {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * If <b>LimitFlags</b> specifies <b>JOB_OBJECT_LIMIT_AFFINITY</b>, this member is the processor affinity for all processes associated with the job. Otherwise, this member is ignored.
     * 
     * The affinity must be a subset of the system affinity mask obtained by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getprocessaffinitymask">GetProcessAffinityMask</a> function. The affinity of each thread is set to this value, but threads are free to subsequently set their affinity, as long as it is a subset of the specified affinity mask. Processes cannot set their own affinity mask.
     * @type {Pointer}
     */
    Affinity {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * If <b>LimitFlags</b> specifies <b>JOB_OBJECT_LIMIT_PRIORITY_CLASS</b>, this member is the priority class for all processes associated with the job. Otherwise, this member is ignored.
     * 
     * Processes and threads cannot modify their priority class. The calling process must enable the <b>SE_INC_BASE_PRIORITY_NAME</b> privilege.
     * @type {Integer}
     */
    PriorityClass {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * If <b>LimitFlags</b> specifies <b>JOB_OBJECT_LIMIT_SCHEDULING_CLASS</b>, this member is the scheduling class for all processes associated with the job. Otherwise, this member is ignored.
     * 
     * The valid values are 0 to 9. Use 0 for the least favorable scheduling class relative to other threads, and 9 for the most favorable scheduling class relative to other threads. By default, this value is 5. To use a scheduling class greater than 5, the calling process must enable the <b>SE_INC_BASE_PRIORITY_NAME</b> privilege.
     * @type {Integer}
     */
    SchedulingClass {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }
}
