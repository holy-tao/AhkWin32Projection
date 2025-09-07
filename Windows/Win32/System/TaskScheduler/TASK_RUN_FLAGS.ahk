#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines how a task is run.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/ne-taskschd-task_run_flags
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class TASK_RUN_FLAGS{

    /**
     * The task is run with all flags ignored.
     * @type {Integer (Int32)}
     */
    static TASK_RUN_NO_FLAGS => 0

    /**
     * The task is run as the user who is calling the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iregisteredtask-run">Run</a> method.
     * @type {Integer (Int32)}
     */
    static TASK_RUN_AS_SELF => 1

    /**
     * The task is run regardless of constraints such as "do not run on batteries" or "run only if idle".
     * @type {Integer (Int32)}
     */
    static TASK_RUN_IGNORE_CONSTRAINTS => 2

    /**
     * The task is run using a terminal server session identifier.
     * @type {Integer (Int32)}
     */
    static TASK_RUN_USE_SESSION_ID => 4

    /**
     * The task is run using a security identifier.
     * @type {Integer (Int32)}
     */
    static TASK_RUN_USER_SID => 8
}
