#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JOB_OBJECT_LIMIT.ahk" { JOB_OBJECT_LIMIT }
#Import ".\JOBOBJECT_RATE_CONTROL_TOLERANCE.ahk" { JOBOBJECT_RATE_CONTROL_TOLERANCE }

/**
 * Contains extended information about resource notification limits that have been exceeded for a job object. This structure is used with the QueryInformationJobObject function with the JobObjectLimitViolationInformation2 information class.
 * @remarks
 * When any notification limit specified in a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-jobobject_notification_limit_information_2">JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION_2</a> structure is exceeded, the system sends a <b>JOB_OBJECT_MSG_NOTIFICATION_LIMIT</b> message to the I/O completion port associated with the job. 
 * 
 * To retrieve information about the limits that were exceeded, the application monitoring the I/O completion port must call the <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-queryinformationjobobject">QueryInformationJobObject</a> function with the <b>JobObjectLimitViolationInformation2</b> information class and a pointer to a <b>JOBOBJECT_LIMIT_VIOLATION_INFORMATION_2</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-jobobject_limit_violation_information_2
 * @namespace Windows.Win32.System.JobObjects
 */
export default struct JOBOBJECT_LIMIT_VIOLATION_INFORMATION_2 {
    #StructPack 8

    LimitFlags : JOB_OBJECT_LIMIT

    ViolationLimitFlags : JOB_OBJECT_LIMIT

    /**
     * If the <b>ViolationLimitFlags</b> member specifies <b>JOB_OBJECT_LIMIT_JOB_READ_BYTES</b>, this member contains the total I/O read bytes for all processes in the job at the time the notification was sent.
     */
    IoReadBytes : Int64

    /**
     * If the <b>LimitFlags</b> member specifies <b>JOB_OBJECT_LIMIT_JOB_READ_BYTES</b>, this member contains the I/O read bytes notification limit in effect for the job.
     */
    IoReadBytesLimit : Int64

    /**
     * If the <b>ViolationLimitFlags</b> member specifies <b>JOB_OBJECT_LIMIT_JOB_WRITE_BYTES</b>, this member contains the total I/O write bytes for all processes in the job at the time the notification was sent.
     */
    IoWriteBytes : Int64

    /**
     * If the <b>LimitFlags</b> member specifies <b>JOB_OBJECT_LIMIT_JOB_WRITE_BYTES</b>, this member contains the I/O write bytes notification limit in effect for the job.
     */
    IoWriteBytesLimit : Int64

    /**
     * If the <b>ViolationLimitFlags</b> member specifies <b>JOB_OBJECT_LIMIT_JOB_TIME</b>, this member contains the total user-mode execution time for all processes in the job at the time the notification was sent.
     */
    PerJobUserTime : Int64

    /**
     * If the <b>LimitFlags</b> member specifies <b>JOB_OBJECT_LIMIT_JOB_TIME</b>, this member contains the user-mode execution notification limit in effect for the job.
     */
    PerJobUserTimeLimit : Int64

    /**
     * If the <b>ViolationLimitFlags</b> member specifies <b>JOB_OBJECT_LIMIT_JOB_MEMORY_HIGH</b> or <b>JOB_OBJECT_LIMIT_JOB_MEMORY_LOW</b>, this member contains the committed memory for all processes in the job at the time the notification was sent.
     */
    JobMemory : Int64

    JobHighMemoryLimit : Int64

    RateControlTolerance : JOBOBJECT_RATE_CONTROL_TOLERANCE

    RateControlToleranceLimit : JOBOBJECT_RATE_CONTROL_TOLERANCE

    /**
     * If the <b>LimitFlags</b> member specifies <b>JOB_OBJECT_LIMIT_JOB_MEMORY_LOW</b>, this member contains the committed minimum memory limit in effect for the job.
     */
    JobLowMemoryLimit : Int64

    IoRateControlTolerance : JOBOBJECT_RATE_CONTROL_TOLERANCE

    /**
     * If the <i>LimitFlags</i> parameter specifies <b>JOB_OBJECT_LIMIT_IO_RATE_CONTROL</b>, this member contains the I/O rate control notification limits specified for the job.  
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ToleranceLow"></a><a id="tolerancelow"></a><a id="TOLERANCELOW"></a><dl>
     * <dt><b>ToleranceLow</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The job can exceed its I/O rate control limits for 20% of the tolerance interval.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ToleranceMedium"></a><a id="tolerancemedium"></a><a id="TOLERANCEMEDIUM"></a><dl>
     * <dt><b>ToleranceMedium</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The job can exceed its I/O rate control limits for 40% of the tolerance interval.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ToleranceHigh"></a><a id="tolerancehigh"></a><a id="TOLERANCEHIGH"></a><dl>
     * <dt><b>ToleranceHigh</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The job can exceed its I/O rate control limits for 60% of the tolerance interval.
     * 
     * </td>
     * </tr>
     * </table>
     */
    IoRateControlToleranceLimit : JOBOBJECT_RATE_CONTROL_TOLERANCE

    NetRateControlTolerance : JOBOBJECT_RATE_CONTROL_TOLERANCE

    /**
     * If the <i>LimitFlags</i> parameter specifies <b>JOB_OBJECT_LIMIT_NETWORK_RATE_CONTROL</b>, this member contains the network rate control notification limits specified for the job.  
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ToleranceLow"></a><a id="tolerancelow"></a><a id="TOLERANCELOW"></a><dl>
     * <dt><b>ToleranceLow</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The job can exceed its network rate control limits for 20% of the tolerance interval.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ToleranceMedium"></a><a id="tolerancemedium"></a><a id="TOLERANCEMEDIUM"></a><dl>
     * <dt><b>ToleranceMedium</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The job can exceed its network rate control limits for 40% of the tolerance interval.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ToleranceHigh"></a><a id="tolerancehigh"></a><a id="TOLERANCEHIGH"></a><dl>
     * <dt><b>ToleranceHigh</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The job can exceed its network rate control limits for 60% of the tolerance interval.
     * 
     * </td>
     * </tr>
     * </table>
     */
    NetRateControlToleranceLimit : JOBOBJECT_RATE_CONTROL_TOLERANCE

    static __New() {
        DefineProp(this.Prototype, 'JobMemoryLimit', { type: Int64, offset: 64 })
        DefineProp(this.Prototype, 'CpuRateControlTolerance', { type: JOBOBJECT_RATE_CONTROL_TOLERANCE, offset: 72 })
        DefineProp(this.Prototype, 'CpuRateControlToleranceLimit', { type: JOBOBJECT_RATE_CONTROL_TOLERANCE, offset: 76 })
        this.DeleteProp("__New")
    }
}
