#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains extended information about notification limits for a job object. This structure is used by the SetInformationJobObject and QueryInformationJobObject functions with the JobObjectNotificationLimitInformation2 information class.
 * @remarks
 * When a notification limit is exceeded, the system sends a <b>JOB_OBJECT_MSG_NOTIFICATION_LIMIT</b> message to the I/O completion port associated with the job. Processes in the job continue to run and can continue to allocate memory or transmit read or write bytes beyond the specified limits. 
  * 
  * When the application monitoring the I/O completion port receives a <b>JOB_OBJECT_MSG_NOTIFICATION_LIMIT</b> message, it must call <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-queryinformationjobobject">QueryInformationJobObject</a> with the <b>JobObjectLimitViolationInformation2</b> information class. Limit violation information is received in a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-jobobject_limit_violation_information_2">JOBOBJECT_LIMIT_VIOLATION_INFORMATION_2</a> structure that contains information about all notification limits that were exceeded at the time of the query. The system will not send another <b>JOB_OBJECT_MSG_NOTIFICATION_LIMIT</b> message until after   <b>QueryInformationJobObject</b> is called.  
  * 
  * CPU rate control limits for a job are established in a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-jobobject_cpu_rate_control_information">JOBOBJECT_CPU_RATE_CONTROL_INFORMATION</a> structure. The CPU rate control values in the <b>JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION_2</b> structure specify how much the job can exceed its established CPU rate control limits before notification is sent.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-jobobject_notification_limit_information_2
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION_2 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * If the <i>LimitFlags</i> member specifies <b>JOB_OBJECT_LIMIT_JOB_READ_BYTES</b>, this member is the notification limit for the total I/O bytes read by all processes in the job. Otherwise, this member is ignored.
     * @type {Integer}
     */
    IoReadBytesLimit {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * If the <i>LimitFlags</i> parameter specifies <b>JOB_OBJECT_LIMIT_JOB_WRITE_BYTES</b>, this member is the notification limit for the total I/O bytes written by all processes in the job. Otherwise, this member is ignored.
     * @type {Integer}
     */
    IoWriteBytesLimit {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * If the <i>LimitFlags</i> parameter specifies <b>JOB_OBJECT_LIMIT_JOB_TIME</b>, this member is the notification limit for per-job user-mode execution time, in 100-nanosecond ticks. Otherwise, this member is ignored.
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
     * @type {Integer}
     */
    JobHighMemoryLimit {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    JobMemoryLimit {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    RateControlTolerance {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    CpuRateControlTolerance {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    RateControlToleranceInterval {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    CpuRateControlToleranceInterval {
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

    /**
     * If the <i>LimitFlags</i> parameter specifies <b>JOB_OBJECT_LIMIT_IO_RATE_CONTROL</b>, this member specifies the extent to which a job can exceed its I/O rate control limits during the interval specified by the <b>IoRateControlToleranceInterval</b> member.  Otherwise, this member is ignored.
     * @type {Integer}
     */
    IoRateControlTolerance {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * If the <i>LimitFlags</i> parameter specifies <b>JOB_OBJECT_LIMIT_JOB_MEMORY_LOW</b>, this member is the notification limit minimum for the total virtual memory that can be committed by all processes in the job, in bytes. Otherwise, this member is ignored.
     * @type {Integer}
     */
    JobLowMemoryLimit {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * If the <i>LimitFlags</i> parameter specifies <b>JOB_OBJECT_IO_LIMIT_RATE_CONTROL</b>, this member specifies the interval during which a job's I/O usage is monitored to determine whether the job has exceeded its I/O rate control limits. Otherwise, this member is ignored.
     * @type {Integer}
     */
    IoRateControlToleranceInterval {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * If the <i>LimitFlags</i> parameter specifies <b>JOB_OBJECT_LIMIT_IO_RATE_CONTROL</b>, this member specifies the extent to which a job can exceed its network rate control limits during the interval specified by the <b>NetRateControlToleranceInterval</b> member.  Otherwise, this member is ignored.
     * @type {Integer}
     */
    NetRateControlTolerance {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * If the <i>LimitFlags</i> parameter specifies <b>JOB_OBJECT_NET_LIMIT_RATE_CONTROL</b>, this member specifies the interval during which a job's network usage is monitored to determine whether the job has exceeded its network rate control limits. Otherwise, this member is ignored.
     * @type {Integer}
     */
    NetRateControlToleranceInterval {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }
}
