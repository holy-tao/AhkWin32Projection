#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the types of process security identifier (SID) that can be used by tasks.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/ne-taskschd-task_processtokensid_type
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct TASK_PROCESSTOKENSID_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No changes will be made to the process token groups list.
     * @type {Integer (Int32)}
     */
    static TASK_PROCESSTOKENSID_NONE => 0

    /**
     * A task SID that is derived from the task name will be added to the process token groups list, and  the token default discretionary access control list (DACL) will be modified to allow only the task SID and local system full control and the account SID read control.
     * @type {Integer (Int32)}
     */
    static TASK_PROCESSTOKENSID_UNRESTRICTED => 1

    /**
     * A Task Scheduler will apply default settings to the task process.
     * @type {Integer (Int32)}
     */
    static TASK_PROCESSTOKENSID_DEFAULT => 2
}
