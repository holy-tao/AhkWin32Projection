#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JOB_OBJECT_LIMIT.ahk" { JOB_OBJECT_LIMIT }
#Import ".\JOBOBJECT_RATE_CONTROL_TOLERANCE.ahk" { JOBOBJECT_RATE_CONTROL_TOLERANCE }

/**
 * Contains information about resource notification limits that have been exceeded for a job object. This structure is used with the QueryInformationJobObject function with the JobObjectLimitViolationInformation information class.
 * @remarks
 * When any notification limit specified in a JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION structure is exceeded, the system sends a JOB_OBJECT_MSG_NOTIFICATION_LIMIT message to the I/O completion port associated with the job.
 * 
 * To retrieve information about the limits that were exceeded, the application monitoring the I/O completion port must call the <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-queryinformationjobobject">QueryInformationJobObject</a> function with the <b>JobObjectLimitViolationInformation</b> information class and a pointer to a <b>JOBOBJECT_LIMIT_VIOLATION_INFORMATION</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-jobobject_limit_violation_information
 * @namespace Windows.Win32.System.JobObjects
 */
export default struct JOBOBJECT_LIMIT_VIOLATION_INFORMATION {
    #StructPack 8

    LimitFlags : JOB_OBJECT_LIMIT

    ViolationLimitFlags : JOB_OBJECT_LIMIT

    /**
     * If the ViolationLimitFlags member specifies JOB_OBJECT_LIMIT_READ_BYTES, this member contains the total I/O read bytes for all processes in the job at the time the notification was sent.
     */
    IoReadBytes : Int64

    /**
     * If the LimitFlags member specifies JOB_OBJECT_LIMIT_READ_BYTES, this member contains the I/O read bytes notification limit in effect for the job.
     */
    IoReadBytesLimit : Int64

    /**
     * If the ViolationLimitFlags member specifies JOB_OBJECT_LIMIT_WRITE_BYTES, this member contains the total I/O write bytes for all processes in the job at the time the notification was sent.
     */
    IoWriteBytes : Int64

    /**
     * If the LimitFlags member specifies JOB_OBJECT_LIMIT_WRITE_BYTES, this member contains the I/O write bytes notification limit in effect for the job.
     */
    IoWriteBytesLimit : Int64

    /**
     * If the ViolationLimitFlags member specifies JOB_OBJECT_LIMIT_JOB_TIME, this member contains the total user-mode execution time for all processes in the job at the time the notification was sent.
     */
    PerJobUserTime : Int64

    /**
     * If the LimitFlags member specifies JOB_OBJECT_LIMIT_JOB_TIME, this member contains the user-mode execution notification limit in effect for the job.
     */
    PerJobUserTimeLimit : Int64

    /**
     * If the ViolationLimitFlags member specifies JOB_OBJECT_LIMIT_JOB_MEMORY, this member contains the committed memory for all processes in the job at the time the notification was sent.
     */
    JobMemory : Int64

    /**
     * If the LimitFlags member specifies JOB_OBJECT_LIMIT_JOB_MEMORY, this member contains the committed memory limit in effect for the job.
     */
    JobMemoryLimit : Int64

    RateControlTolerance : JOBOBJECT_RATE_CONTROL_TOLERANCE

    /**
     * If the <i>LimitFlags</i> parameter specifies JOB_OBJECT_LIMIT_RATE_CONTROL, this member contains the CPU rate control notification limits specified for the job.  
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="_ToleranceIntervalShort"></a><a id="_toleranceintervalshort"></a><a id="_TOLERANCEINTERVALSHORT"></a><dl>
     * <dt><b> ToleranceIntervalShort</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The tolerance interval is 10 seconds.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ToleranceIntervalMedium"></a><a id="toleranceintervalmedium"></a><a id="TOLERANCEINTERVALMEDIUM"></a><dl>
     * <dt><b>ToleranceIntervalMedium</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The tolerance interval is one minute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ToleranceIntervalLong"></a><a id="toleranceintervallong"></a><a id="TOLERANCEINTERVALLONG"></a><dl>
     * <dt><b>ToleranceIntervalLong</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The tolerance interval is 10 minutes.
     * 
     * </td>
     * </tr>
     * </table>
     */
    RateControlToleranceLimit : JOBOBJECT_RATE_CONTROL_TOLERANCE

}
