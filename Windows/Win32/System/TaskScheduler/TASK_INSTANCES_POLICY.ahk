#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines how the Task Scheduler handles existing instances of the task when it starts a new instance of the task.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/ne-taskschd-task_instances_policy
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class TASK_INSTANCES_POLICY{

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
