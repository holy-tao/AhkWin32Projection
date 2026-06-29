#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines how the Task Scheduler enumerates through registered tasks.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/ne-taskschd-task_enum_flags
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct TASK_ENUM_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Enumerates all tasks, including tasks that are hidden.
     * @type {Integer (Int32)}
     */
    static TASK_ENUM_HIDDEN => 1
}
