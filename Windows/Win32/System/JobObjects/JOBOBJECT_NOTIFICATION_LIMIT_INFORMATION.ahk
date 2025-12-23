#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about notification limits for a job object. This structure is used by the SetInformationJobObject and QueryInformationJobObject functions with the JobObjectNotificationLimitInformation information class.
 * @remarks
 * When a notification limit is exceeded, the system sends a JOB_OBJECT_MSG_NOTIFICATION_LIMIT message to the I/O completion port associated with the job. Processes in the job continue to run and can continue to allocate memory or transmit read or write bytes beyond the specified limits. 
 * 
 * When the application monitoring the I/O completion port receives a JOB_OBJECT_MSG_NOTIFICATION_LIMIT message, it must call <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-queryinformationjobobject">QueryInformationJobObject</a> with the <b>JobObjectLimitViolationInformation</b> information class. Limit violation information is received in a JOBOBJECT_LIMIT_VIOLATION_STRUCTURE that contains information about all notification limits that were exceeded at the time of the query. The system will not send another JOB_OBJECT_MSG_NOTIFICATION_LIMIT message until after   <b>QueryInformationJobObject</b> is called.  
 * 
 * CPU rate control limits for a job are established in a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-jobobject_cpu_rate_control_information">JOBOBJECT_CPU_RATE_CONTROL_INFORMATION</a> structure. The CPU rate control values in the <b>JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION</b> structure specify how much the job can exceed its established CPU rate control limits before notification is sent.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-jobobject_notification_limit_information
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * If the <i>LimitFlags</i> member specifies JOB_OBJECT_LIMIT_JOB_READ_BYTES, this member is the notification limit for total I/O bytes read by all processes in the job. Otherwise, this member is ignored.
     * @type {Integer}
     */
    IoReadBytesLimit {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * If the <i>LimitFlags</i> parameter specifies JOB_OBJECT_LIMIT_JOB_WRITE_BYTES, this member is the notification limit for total I/O bytes written by all processes in the job. Otherwise, this member is ignored.
     * @type {Integer}
     */
    IoWriteBytesLimit {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * If the <i>LimitFlags</i> parameter specifies JOB_OBJECT_LIMIT_JOB_TIME, this member is the notification limit for per-job user-mode execution time, in 100-nanosecond ticks. Otherwise, this member is ignored.
     * 
     * The system adds the accumulated execution time of processes associated with the job to this limit when the limit is set. For example, if a process associated with the job has already accumulated 5 minutes of user-mode execution time and the limit is set to 1 minute, the limit actually enforced is 6 minutes.
     * 
     * To specify <b>PerJobUserTimeLimit</b> as an enforceable limit and terminate processes in jobs that exceed the limit, see the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-jobobject_basic_limit_information">JOBOBJECT_BASIC_LIMIT_INFORMATION</a> structure.
     * @type {Integer}
     */
    PerJobUserTimeLimit {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * If the <i>LimitFlags</i> parameter specifies JOB_OBJECT_LIMIT_JOB_MEMORY, this member is the notification limit for total virtual memory that can be committed by all processes in the job, in bytes. Otherwise, this member is ignored.
     * 
     * To specify <b>JobMemoryLimit</b> as an enforceable limit and prevent processes in jobs that exceed the limit from continuing to commit memory, see the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-jobobject_basic_limit_information">JOBOBJECT_EXTENDED_LIMIT_INFORMATION</a> structure.
     * @type {Integer}
     */
    JobMemoryLimit {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * If the <i>LimitFlags</i> parameter specifies JOB_OBJECT_LIMIT_RATE_CONTROL, this member specifies the extent to which a job can exceed its CPU rate control limits during the interval specified by the <b>RateControlToleranceInterval</b> member.  Otherwise, this member is ignored.
     * @type {Integer}
     */
    RateControlTolerance {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * If the <i>LimitFlags</i> parameter specifies JOB_OBJECT_LIMIT_RATE_CONTROL, this member specifies the interval during which a job's CPU usage is monitored to determine whether the job has exceeded its CPU rate control limits. Otherwise, this member is ignored.
     * @type {Integer}
     */
    RateControlToleranceInterval {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * 
     * @type {Integer}
     */
    LimitFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
