#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies how long the Task Scheduler will attempt to restart the task.
 * @remarks
 * If this element is specified, the [**Count**](taskschedulerschema-count-restarttype-element.md) element must also be specified to tell the Task Scheduler how many times it should try to restart the task.
 * 
 * For C++ development, see [**RestartInterval Property of ITaskSettings**](/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_restartinterval).
 * 
 * For script development, see [**TaskSettings.RestartInterval**](tasksettings-restartinterval.md).
 * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-interval-restarttype-element
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class Interval extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
