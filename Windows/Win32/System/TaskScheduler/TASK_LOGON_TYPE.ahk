#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines what logon technique is required to run a task.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/ne-taskschd-task_logon_type
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class TASK_LOGON_TYPE extends Win32Enum{

    /**
     * The logon method is not specified. Used for non-NT credentials.
     * @type {Integer (Int32)}
     */
    static TASK_LOGON_NONE => 0

    /**
     * Use a password for logging on the user. The password must be supplied at registration time.
     * @type {Integer (Int32)}
     */
    static TASK_LOGON_PASSWORD => 1

    /**
     * The service will log the user on using Service For User (S4U), and the task will run in a non-interactive desktop.  When an S4U logon is used, no password is stored by the system and there is no access to either the network or to encrypted files.
     * @type {Integer (Int32)}
     */
    static TASK_LOGON_S4U => 2

    /**
     * User must already be logged on. The task will be run only in an existing interactive session.
     * @type {Integer (Int32)}
     */
    static TASK_LOGON_INTERACTIVE_TOKEN => 3

    /**
     * Group activation. The <b>groupId</b> field specifies the group.
     * @type {Integer (Int32)}
     */
    static TASK_LOGON_GROUP => 4

    /**
     * Indicates that a Local System, Local Service, or Network Service account is being used as a security context to run the task.
     * @type {Integer (Int32)}
     */
    static TASK_LOGON_SERVICE_ACCOUNT => 5

    /**
     * Not in use; currently identical to TASK_LOGON_PASSWORD.
     * 
     * <b>Windows 10, version 1511, Windows 10, version 1507, Windows 8.1, Windows Server 2012 R2, Windows 8, Windows Server 2012, Windows Vista and Windows Server 2008:  </b>First use the interactive token.  If the user is not logged on (no interactive token is available), then the password is used.  The password must be specified when a task is registered. This flag is not recommended for new tasks because it is less reliable than TASK_LOGON_PASSWORD.
     * @type {Integer (Int32)}
     */
    static TASK_LOGON_INTERACTIVE_TOKEN_OR_PASSWORD => 6
}
