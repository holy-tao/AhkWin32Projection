#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JOB_OBJECT_LIMIT.ahk" { JOB_OBJECT_LIMIT }
#Import ".\JOBOBJECT_RATE_CONTROL_TOLERANCE.ahk" { JOBOBJECT_RATE_CONTROL_TOLERANCE }
#Import ".\JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL.ahk" { JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL }

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
 */
export default struct JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION_2 {
    #StructPack 8

    /**
     * If the <i>LimitFlags</i> member specifies <b>JOB_OBJECT_LIMIT_JOB_READ_BYTES</b>, this member is the notification limit for the total I/O bytes read by all processes in the job. Otherwise, this member is ignored.
     */
    IoReadBytesLimit : Int64

    /**
     * If the <i>LimitFlags</i> parameter specifies <b>JOB_OBJECT_LIMIT_JOB_WRITE_BYTES</b>, this member is the notification limit for the total I/O bytes written by all processes in the job. Otherwise, this member is ignored.
     */
    IoWriteBytesLimit : Int64

    /**
     * If the <i>LimitFlags</i> parameter specifies <b>JOB_OBJECT_LIMIT_JOB_TIME</b>, this member is the notification limit for per-job user-mode execution time, in 100-nanosecond ticks. Otherwise, this member is ignored.
     * 
     * The system adds the accumulated execution time of processes associated with the job to this limit when the limit is set. For example, if a process associated with the job has already accumulated 5 minutes of user-mode execution time and the limit is set to 1 minute, the limit actually enforced is 6 minutes.
     * 
     * To specify <b>PerJobUserTimeLimit</b> as an enforceable limit and terminate processes in jobs that exceed the limit, see the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-jobobject_basic_limit_information">JOBOBJECT_BASIC_LIMIT_INFORMATION</a> structure.
     */
    PerJobUserTimeLimit : Int64

    JobHighMemoryLimit : Int64

    RateControlTolerance : JOBOBJECT_RATE_CONTROL_TOLERANCE

    RateControlToleranceInterval : JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL

    LimitFlags : JOB_OBJECT_LIMIT

    /**
     * If the <i>LimitFlags</i> parameter specifies <b>JOB_OBJECT_LIMIT_IO_RATE_CONTROL</b>, this member specifies the extent to which a job can exceed its I/O rate control limits during the interval specified by the <b>IoRateControlToleranceInterval</b> member.  Otherwise, this member is ignored.
     */
    IoRateControlTolerance : JOBOBJECT_RATE_CONTROL_TOLERANCE

    /**
     * If the <i>LimitFlags</i> parameter specifies <b>JOB_OBJECT_LIMIT_JOB_MEMORY_LOW</b>, this member is the notification limit minimum for the total virtual memory that can be committed by all processes in the job, in bytes. Otherwise, this member is ignored.
     */
    JobLowMemoryLimit : Int64

    /**
     * If the <i>LimitFlags</i> parameter specifies <b>JOB_OBJECT_IO_LIMIT_RATE_CONTROL</b>, this member specifies the interval during which a job's I/O usage is monitored to determine whether the job has exceeded its I/O rate control limits. Otherwise, this member is ignored.
     */
    IoRateControlToleranceInterval : JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL

    /**
     * If the <i>LimitFlags</i> parameter specifies <b>JOB_OBJECT_LIMIT_IO_RATE_CONTROL</b>, this member specifies the extent to which a job can exceed its network rate control limits during the interval specified by the <b>NetRateControlToleranceInterval</b> member.  Otherwise, this member is ignored.
     */
    NetRateControlTolerance : JOBOBJECT_RATE_CONTROL_TOLERANCE

    /**
     * If the <i>LimitFlags</i> parameter specifies <b>JOB_OBJECT_NET_LIMIT_RATE_CONTROL</b>, this member specifies the interval during which a job's network usage is monitored to determine whether the job has exceeded its network rate control limits. Otherwise, this member is ignored.
     */
    NetRateControlToleranceInterval : JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL

    static __New() {
        DefineProp(this.Prototype, 'JobMemoryLimit', { type: Int64, offset: 24 })
        DefineProp(this.Prototype, 'CpuRateControlTolerance', { type: JOBOBJECT_RATE_CONTROL_TOLERANCE, offset: 32 })
        DefineProp(this.Prototype, 'CpuRateControlToleranceInterval', { type: JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL, offset: 36 })
        this.DeleteProp("__New")
    }
}
