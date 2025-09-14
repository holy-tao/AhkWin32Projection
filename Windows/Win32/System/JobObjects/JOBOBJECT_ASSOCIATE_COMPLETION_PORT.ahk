#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information used to associate a completion port with a job.
 * @remarks
 * The system sends messages to the I/O completion port associated with a job when certain events occur. If the job is nested, the message is sent to every I/O completion port associated with any job in the parent job chain of the job that triggered the message. All messages are sent directly from the job as if the job had called the 
  * <a href="https://docs.microsoft.com/windows/desktop/FileIO/postqueuedcompletionstatus">PostQueuedCompletionStatus</a> function. 
  * 
  * Note that, except for limits set with the <b>JobObjectNotificationLimitInformation</b> information class, messages are intended only as notifications and their delivery to the completion port is not guaranteed. The failure of a message to arrive at the completion port does not necessarily mean that the event did not occur. Notifications for limits set with <b>JobObjectNotificationLimitInformation</b> are guaranteed to arrive at the completion port. 
  * 
  * A thread must monitor the completion port using the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> function to pick up the messages. The thread receives information in the <b>GetQueuedCompletionStatus</b> parameters shown in the following table.
  * 
  * <table>
  * <tr>
  * <th>Parameter</th>
  * <th>Information Received</th>
  * </tr>
  * <tr>
  * <td><i>lpCompletionKey</i></td>
  * <td>The value specified in <i>CompletionKey</i> during the completion-port association. If a completion port is associated with multiple jobs, <i>CompletionKey</i> should help the caller determine which completion port is sending a message.</td>
  * </tr>
  * <tr>
  * <td><i>lpOverlapped</i></td>
  * <td>Message-specific value. For more information, see the following table of message identifiers.</td>
  * </tr>
  * <tr>
  * <td><i>LpNumberOfBytes</i></td>
  * <td>The message identifier that indicates which job-related event occurred. For more information, see the following table of message identifiers.</td>
  * </tr>
  * </table>
  *  
  * 
  * The following messages can be sent to the completion port. Note that for messages that return a process identifier, you cannot guarantee that this process is still active or that the identifier has not been recycled (assigned to a new process after termination) unless you maintain an open handle to the process.
  * 
  * <table>
  * <tr>
  * <th>Message Identifier</th>
  * <th>Description</th>
  * </tr>
  * <tr>
  * <td>JOB_OBJECT_MSG_ABNORMAL_EXIT_PROCESS</td>
  * <td>
  * Indicates that a process associated with the job exited with an exit code that indicates an abnormal exit (see the list following this table). 
  * 
  * 
  * 
  * 
  * The value of <i>lpOverlapped</i> is the identifier of the exiting process.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>JOB_OBJECT_MSG_ACTIVE_PROCESS_LIMIT</td>
  * <td>
  * Indicates that the active process limit has been exceeded. 
  * 
  * 
  * 
  * 
  * The value of <i>lpOverlapped</i> is NULL.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>JOB_OBJECT_MSG_ACTIVE_PROCESS_ZERO</td>
  * <td>
  * Indicates that the active process count has been decremented to 0. For example, if the job currently has two active processes, the system sends this message after they both terminate. 
  * 
  * 
  * 
  * 
  * The value of <i>lpOverlapped</i> is NULL.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>JOB_OBJECT_MSG_END_OF_JOB_TIME</td>
  * <td>
  * Indicates that the JOB_OBJECT_POST_AT_END_OF_JOB option is in effect and the end-of-job time limit has been reached. Upon posting this message, the time limit is canceled and the job's processes can continue to run. 
  * 
  * 
  * 
  * 
  * The value of <i>lpOverlapped</i> is NULL.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>JOB_OBJECT_MSG_END_OF_PROCESS_TIME</td>
  * <td>
  * Indicates that a process has exceeded a per-process time limit. The system sends this message after the process termination has been requested. 
  * 
  * 
  * 
  * 
  * The value of <i>lpOverlapped</i> is the identifier of the process that exceeded its limit.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>JOB_OBJECT_MSG_EXIT_PROCESS</td>
  * <td>
  * Indicates that a process associated with the job has exited. 
  * 
  * 
  * 
  * 
  * The value of <i>lpOverlapped</i> is the identifier of the exiting process.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>JOB_OBJECT_MSG_JOB_MEMORY_LIMIT</td>
  * <td>
  * Indicates that a process associated with the job caused the job to exceed the job-wide memory limit (if one is in effect). 
  * 
  * 
  * 
  * 
  * The value of <i>lpOverlapped</i> specifies the identifier of the process that has attempted to exceed the limit. The system does not send this message if the process has not yet reported its process identifier.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>JOB_OBJECT_MSG_NEW_PROCESS</td>
  * <td>
  * Indicates that a process has been added to the job. Processes added to a job at the time a completion port is associated are also reported. 
  * 
  * 
  * 
  * 
  * The value of <i>lpOverlapped</i> is the identifier of the process added to the job.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>JOB_OBJECT_MSG_NOTIFICATION_LIMIT</td>
  * <td>
  * Indicates that a process associated with a job that has registered for resource limit notifications has exceeded one or more  limits. Use the <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-queryinformationjobobject">QueryInformationJobObject</a> function with JobObjectLimitViolationInformation to determine which limit was exceeded. 
  * 
  * The value of <i>lpOverlapped</i> is the identifier of the process that has exceeded its limit. The system does not send this message if the process has not yet reported its process identifier.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>JOB_OBJECT_MSG_PROCESS_MEMORY_LIMIT</td>
  * <td>
  * Indicates that a process associated with the job has exceeded its memory limit (if one is in effect). 
  * 
  * 
  * 
  * 
  * The value of <i>lpOverlapped</i> is the identifier of the process that has exceeded its limit. The system does not send this message if the process has not yet reported its process identifier.
  * 
  * </td>
  * </tr>
  * </table>
  *  
  * 
  * The following exit codes indicate an abnormal exit:
  * 
  * You must be cautious when using the JOB_OBJECT_MSG_NEW_PROCESS and JOB_OBJECT_MSG_EXIT_PROCESS messages, as race conditions may occur. For instance, if processes are actively starting and exiting within a job, and you are in the process of assigning a completion port to the job, you may miss messages for processes whose states change during the association of the completion port. For this reason, it is best to associate a completion port with a job when the job is inactive.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-jobobject_associate_completion_port
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOBOBJECT_ASSOCIATE_COMPLETION_PORT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The value to use in the <i>dwCompletionKey</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/postqueuedcompletionstatus">PostQueuedCompletionStatus</a> when messages are sent on behalf of the job.
     * @type {Pointer<Void>}
     */
    CompletionKey {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The completion port to use in the <i>CompletionPort</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/FileIO/postqueuedcompletionstatus">PostQueuedCompletionStatus</a> function when messages are sent on behalf of the job.
     * 
     * <b>Windows 8, Windows Server 2012, Windows 8.1, Windows Server 2012 R2, Windows 10 and Windows Server 2016:  </b>Specify <b>NULL</b> to remove the association between the current completion port and the job.
     * @type {Pointer<HANDLE>}
     */
    CompletionPort {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
