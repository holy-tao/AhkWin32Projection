#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines LUA elevation flags that specify with what privilege level the task will be run.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/ne-taskschd-task_runlevel_type
 * @namespace Windows.Win32.System.TaskScheduler
 */
class TASK_RUNLEVEL_TYPE extends Win32Enum {

    /**
     * Tasks will be run with the least privileges.
     * Native name: TASK_RUNLEVEL_LUA
     * @type {Integer (Int32)}
     */
    static LUA => 0

    /**
     * Tasks will be run with the highest privileges.
     * Native name: TASK_RUNLEVEL_HIGHEST
     * @type {Integer (Int32)}
     */
    static HIGHEST => 1
}
