#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the different states that a registered task can be in.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/ne-taskschd-task_state
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct TASK_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The state of the task is unknown.
     * @type {Integer (Int32)}
     */
    static TASK_STATE_UNKNOWN => 0

    /**
     * The task is registered but is disabled and no instances of the task are queued or running. The task cannot be run until it is enabled.
     * @type {Integer (Int32)}
     */
    static TASK_STATE_DISABLED => 1

    /**
     * Instances of the task are queued.
     * @type {Integer (Int32)}
     */
    static TASK_STATE_QUEUED => 2

    /**
     * The task is ready to be executed, but no instances are queued or running.
     * @type {Integer (Int32)}
     */
    static TASK_STATE_READY => 3

    /**
     * One or more instances of the task is running.
     * @type {Integer (Int32)}
     */
    static TASK_STATE_RUNNING => 4
}
