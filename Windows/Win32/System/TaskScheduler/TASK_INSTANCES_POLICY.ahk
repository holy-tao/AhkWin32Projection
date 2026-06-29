#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines how the Task Scheduler handles existing instances of the task when it starts a new instance of the task.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/ne-taskschd-task_instances_policy
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct TASK_INSTANCES_POLICY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Starts new instance while an existing instance is running.
     * @type {Integer (Int32)}
     */
    static TASK_INSTANCES_PARALLEL => 0

    /**
     * Starts a new instance of the task after all other instances of the task are complete.
     * @type {Integer (Int32)}
     */
    static TASK_INSTANCES_QUEUE => 1

    /**
     * Does not start a new instance if an existing instance of the task is running.
     * @type {Integer (Int32)}
     */
    static TASK_INSTANCES_IGNORE_NEW => 2

    /**
     * Stops an existing instance of the task before it starts a new instance.
     * @type {Integer (Int32)}
     */
    static TASK_INSTANCES_STOP_EXISTING => 3
}
