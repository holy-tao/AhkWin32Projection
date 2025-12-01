#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the action the system will perform when an end-of-job time limit is exceeded.
 * @remarks
 * The end-of-job time limit is specified in the <b>PerJobUserTimeLimit</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-jobobject_basic_limit_information">JOBOBJECT_BASIC_LIMIT_INFORMATION</a> structure.
 * 
 * To associate a completion port with a job, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-jobobject_associate_completion_port">JOBOBJECT_ASSOCIATE_COMPLETION_PORT</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-jobobject_end_of_job_time_information
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOBOBJECT_END_OF_JOB_TIME_INFORMATION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    EndOfJobTimeAction {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
