#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JOBOBJECT_BASIC_LIMIT_INFORMATION.ahk
#Include ..\Threading\IO_COUNTERS.ahk

/**
 * Contains basic and extended limit information for a job object.
 * @remarks
 * The system tracks the value of <b>PeakProcessMemoryUsed</b> and <b>PeakJobMemoryUsed</b> constantly. This allows you know the peak memory usage of each job. You can use this information to establish a memory limit using the <b>JOB_OBJECT_LIMIT_PROCESS_MEMORY</b> or <b>JOB_OBJECT_LIMIT_JOB_MEMORY</b> value.
  * 
  * Note that the job memory and process memory limits are very similar in operation, but they are independent. You could set a job-wide limit of 100 MB with a per-process limit of 10 MB. In this scenario, no single process could commit more than 10 MB, and the set of processes associated with a job could never exceed 100 MB.
  * 
  * To register for notifications  that a job has exceeded its peak memory limit while allowing processes to continue to commit memory, use the <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-setinformationjobobject">SetInformationJobObject</a> function with the <b>JobObjectNotificationLimitInformation</b> information class.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-jobobject_extended_limit_information
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOBOBJECT_EXTENDED_LIMIT_INFORMATION extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-jobobject_basic_limit_information">JOBOBJECT_BASIC_LIMIT_INFORMATION</a> structure that contains basic limit information.
     * @type {JOBOBJECT_BASIC_LIMIT_INFORMATION}
     */
    BasicLimitInformation{
        get {
            if(!this.HasProp("__BasicLimitInformation"))
                this.__BasicLimitInformation := JOBOBJECT_BASIC_LIMIT_INFORMATION(this.ptr + 0)
            return this.__BasicLimitInformation
        }
    }

    /**
     * Reserved.
     * @type {IO_COUNTERS}
     */
    IoInfo{
        get {
            if(!this.HasProp("__IoInfo"))
                this.__IoInfo := IO_COUNTERS(this.ptr + 64)
            return this.__IoInfo
        }
    }

    /**
     * If the <b>LimitFlags</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-jobobject_basic_limit_information">JOBOBJECT_BASIC_LIMIT_INFORMATION</a> structure specifies the <b>JOB_OBJECT_LIMIT_PROCESS_MEMORY</b> value, this member specifies the limit for the virtual memory that can be committed by a process. Otherwise, this member is ignored.
     * @type {Pointer}
     */
    ProcessMemoryLimit {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * If the <b>LimitFlags</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-jobobject_basic_limit_information">JOBOBJECT_BASIC_LIMIT_INFORMATION</a> structure specifies the <b>JOB_OBJECT_LIMIT_JOB_MEMORY</b> value, this member specifies the limit for the virtual memory that can be committed for the job. Otherwise, this member is ignored.
     * @type {Pointer}
     */
    JobMemoryLimit {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * The peak memory used by any process ever associated with the job.
     * @type {Pointer}
     */
    PeakProcessMemoryUsed {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * The peak memory usage of all processes currently associated with the job.
     * @type {Pointer}
     */
    PeakJobMemoryUsed {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }
}
