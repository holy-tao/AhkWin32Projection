#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines LUA elevation flags that specify with what privilege level the task will be run.
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/ne-taskschd-task_runlevel_type
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class TASK_RUNLEVEL_TYPE{

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
