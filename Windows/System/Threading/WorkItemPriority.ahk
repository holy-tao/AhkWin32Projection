#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the priority of a work item relative to other work items in the thread pool.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.threading.workitempriority
 * @namespace Windows.System.Threading
 * @version WindowsRuntime 1.4
 */
class WorkItemPriority extends Win32Enum{

    /**
     * The work item should run at low priority.
     * @type {Integer (Int32)}
     */
    static Low => -1

    /**
     * The work item should run at normal priority. This is the default value.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * The work item should run at high priority.
     * @type {Integer (Int32)}
     */
    static High => 1
}
