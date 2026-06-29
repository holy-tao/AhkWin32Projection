#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JOB_OBJECT_TERMINATE_AT_END_ACTION.ahk" { JOB_OBJECT_TERMINATE_AT_END_ACTION }

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
 */
export default struct JOBOBJECT_END_OF_JOB_TIME_INFORMATION {
    #StructPack 4

    EndOfJobTimeAction : JOB_OBJECT_TERMINATE_AT_END_ACTION

}
