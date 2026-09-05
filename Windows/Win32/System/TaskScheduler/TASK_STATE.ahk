#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the different states that a registered task can be in.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/ne-taskschd-task_state
 * @namespace Windows.Win32.System.TaskScheduler
 */
class TASK_STATE extends Win32Enum {

    /**
     * The state of the task is unknown.
     * Native name: TASK_STATE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * The task is registered but is disabled and no instances of the task are queued or running. The task cannot be run until it is enabled.
     * Native name: TASK_STATE_DISABLED
     * @type {Integer (Int32)}
     */
    static DISABLED => 1

    /**
     * Instances of the task are queued.
     * Native name: TASK_STATE_QUEUED
     * @type {Integer (Int32)}
     */
    static QUEUED => 2

    /**
     * The task is ready to be executed, but no instances are queued or running.
     * Native name: TASK_STATE_READY
     * @type {Integer (Int32)}
     */
    static READY => 3

    /**
     * One or more instances of the task is running.
     * Native name: TASK_STATE_RUNNING
     * @type {Integer (Int32)}
     */
    static RUNNING => 4
}
