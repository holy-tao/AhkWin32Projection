#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about resource notification limits that have been exceeded for a job object. This structure is used with the QueryInformationJobObject function with the JobObjectLimitViolationInformation information class.
 * @remarks
 * 
  * When any notification limit specified in a JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION structure is exceeded, the system sends a JOB_OBJECT_MSG_NOTIFICATION_LIMIT message to the I/O completion port associated with the job.
  * 
  * To retrieve information about the limits that were exceeded, the application monitoring the I/O completion port must call the <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-queryinformationjobobject">QueryInformationJobObject</a> function with the <b>JobObjectLimitViolationInformation</b> information class and a pointer to a <b>JOBOBJECT_LIMIT_VIOLATION_INFORMATION</b> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-jobobject_limit_violation_information
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOBOBJECT_LIMIT_VIOLATION_INFORMATION extends Win32Struct
{
    static sizeof => 80

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
     * If the ViolationLimitFlags member specifies JOB_OBJECT_LIMIT_READ_BYTES, this member contains the total I/O read bytes for all processes in the job at the time the notification was sent.
     * @type {Integer}
     */
    IoReadBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * If the LimitFlags member specifies JOB_OBJECT_LIMIT_READ_BYTES, this member contains the I/O read bytes notification limit in effect for the job.
     * @type {Integer}
     */
    IoReadBytesLimit {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * If the ViolationLimitFlags member specifies JOB_OBJECT_LIMIT_WRITE_BYTES, this member contains the total I/O write bytes for all processes in the job at the time the notification was sent.
     * @type {Integer}
     */
    IoWriteBytes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * If the LimitFlags member specifies JOB_OBJECT_LIMIT_WRITE_BYTES, this member contains the I/O write bytes notification limit in effect for the job.
     * @type {Integer}
     */
    IoWriteBytesLimit {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * If the ViolationLimitFlags member specifies JOB_OBJECT_LIMIT_JOB_TIME, this member contains the total user-mode execution time for all processes in the job at the time the notification was sent.
     * @type {Integer}
     */
    PerJobUserTime {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * If the LimitFlags member specifies JOB_OBJECT_LIMIT_JOB_TIME, this member contains the user-mode execution notification limit in effect for the job.
     * @type {Integer}
     */
    PerJobUserTimeLimit {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
    }

    /**
     * If the ViolationLimitFlags member specifies JOB_OBJECT_LIMIT_JOB_MEMORY, this member contains the committed memory for all processes in the job at the time the notification was sent.
     * @type {Integer}
     */
    JobMemory {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * If the LimitFlags member specifies JOB_OBJECT_LIMIT_JOB_MEMORY, this member contains the committed memory limit in effect for the job.
     * @type {Integer}
     */
    JobMemoryLimit {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * 
     * @type {Integer}
     */
    RateControlTolerance {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

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
     * @type {Integer}
     */
    RateControlToleranceLimit {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }
}
