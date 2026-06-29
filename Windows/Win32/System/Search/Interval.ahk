#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct Interval {
    #StructPack 1

}
