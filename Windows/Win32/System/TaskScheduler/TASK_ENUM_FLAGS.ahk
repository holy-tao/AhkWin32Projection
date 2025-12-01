#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines how the Task Scheduler enumerates through registered tasks.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/ne-taskschd-task_enum_flags
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class TASK_ENUM_FLAGS extends Win32Enum{

    /**
     * Enumerates all tasks, including tasks that are hidden.
     * @type {Integer (Int32)}
     */
    static TASK_ENUM_HIDDEN => 1
}
