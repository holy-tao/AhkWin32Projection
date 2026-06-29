#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines LUA elevation flags that specify with what privilege level the task will be run.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/ne-taskschd-task_runlevel_type
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct TASK_RUNLEVEL_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Tasks will be run with the least privileges.
     * @type {Integer (Int32)}
     */
    static TASK_RUNLEVEL_LUA => 0

    /**
     * Tasks will be run with the highest privileges.
     * @type {Integer (Int32)}
     */
    static TASK_RUNLEVEL_HIGHEST => 1
}
