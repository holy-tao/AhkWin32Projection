#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the types of process security identifier (SID) that can be used by tasks.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/ne-taskschd-task_processtokensid_type
 * @namespace Windows.Win32.System.TaskScheduler
 */
class TASK_PROCESSTOKENSID_TYPE extends Win32Enum {

    /**
     * No changes will be made to the process token groups list.
     * Native name: TASK_PROCESSTOKENSID_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * A task SID that is derived from the task name will be added to the process token groups list, and  the token default discretionary access control list (DACL) will be modified to allow only the task SID and local system full control and the account SID read control.
     * Native name: TASK_PROCESSTOKENSID_UNRESTRICTED
     * @type {Integer (Int32)}
     */
    static UNRESTRICTED => 1

    /**
     * A Task Scheduler will apply default settings to the task process.
     * Native name: TASK_PROCESSTOKENSID_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 2
}
