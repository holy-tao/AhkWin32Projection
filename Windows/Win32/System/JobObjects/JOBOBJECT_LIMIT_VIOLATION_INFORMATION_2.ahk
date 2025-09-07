#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains extended information about resource notification limits that have been exceeded for a job object. This structure is used with the QueryInformationJobObject function with the JobObjectLimitViolationInformation2 information class.
 * @remarks
 * When any notification limit specified in a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-jobobject_notification_limit_information_2">JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION_2</a> structure is exceeded, the system sends a <b>JOB_OBJECT_MSG_NOTIFICATION_LIMIT</b> message to the I/O completion port associated with the job. 
  * 
  * To retrieve information about the limits that were exceeded, the application monitoring the I/O completion port must call the <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-queryinformationjobobject">QueryInformationJobObject</a> function with the <b>JobObjectLimitViolationInformation2</b> information class and a pointer to a <b>JOBOBJECT_LIMIT_VIOLATION_INFORMATION_2</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-jobobject_limit_violation_information_2
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOBOBJECT_LIMIT_VIOLATION_INFORMATION_2 extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    LimitFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    ViolationLimitFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * If the <b>ViolationLimitFlags</b> member specifies <b>JOB_OBJECT_LIMIT_JOB_READ_BYTES</b>, this member contains the total I/O read bytes for all processes in the job at the time the notification was sent.
     * @type {Integer}
     */
    IoReadBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * If the <b>LimitFlags</b> member specifies <b>JOB_OBJECT_LIMIT_JOB_READ_BYTES</b>, this member contains the I/O read bytes notification limit in effect for the job.
     * @type {Integer}
     */
    IoReadBytesLimit {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * If the <b>ViolationLimitFlags</b> member specifies <b>JOB_OBJECT_LIMIT_JOB_WRITE_BYTES</b>, this member contains the total I/O write bytes for all processes in the job at the time the notification was sent.
     * @type {Integer}
     */
    IoWriteBytes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * If the <b>LimitFlags</b> member specifies <b>JOB_OBJECT_LIMIT_JOB_WRITE_BYTES</b>, this member contains the I/O write bytes notification limit in effect for the job.
     * @type {Integer}
     */
    IoWriteBytesLimit {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * If the <b>ViolationLimitFlags</b> member specifies <b>JOB_OBJECT_LIMIT_JOB_TIME</b>, this member contains the total user-mode execution time for all processes in the job at the time the notification was sent.
     * @type {Integer}
     */
    PerJobUserTime {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * If the <b>LimitFlags</b> member specifies <b>JOB_OBJECT_LIMIT_JOB_TIME</b>, this member contains the user-mode execution notification limit in effect for the job.
     * @type {Integer}
     */
    PerJobUserTimeLimit {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
    }

    /**
     * If the <b>ViolationLimitFlags</b> member specifies <b>JOB_OBJECT_LIMIT_JOB_MEMORY_HIGH</b> or <b>JOB_OBJECT_LIMIT_JOB_MEMORY_LOW</b>, this member contains the committed memory for all processes in the job at the time the notification was sent.
     * @type {Integer}
     */
    JobMemory {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    JobHighMemoryLimit {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    JobMemoryLimit {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    RateControlTolerance {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    CpuRateControlTolerance {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    RateControlToleranceLimit {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    CpuRateControlToleranceLimit {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * If the <b>LimitFlags</b> member specifies <b>JOB_OBJECT_LIMIT_JOB_MEMORY_LOW</b>, this member contains the committed minimum memory limit in effect for the job.
     * @type {Integer}
     */
    JobLowMemoryLimit {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * 
     * @type {Integer}
     */
    IoRateControlTolerance {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

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
     * @type {Integer}
     */
    IoRateControlToleranceLimit {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }

    /**
     * 
     * @type {Integer}
     */
    NetRateControlTolerance {
        get => NumGet(this, 96, "int")
        set => NumPut("int", value, this, 96)
    }

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
     * @type {Integer}
     */
    NetRateControlToleranceLimit {
        get => NumGet(this, 100, "int")
        set => NumPut("int", value, this, 100)
    }
}
