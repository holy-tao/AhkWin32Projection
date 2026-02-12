#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Defines the priority levels that can be given to work assigned to a [DispatcherQueue](dispatcherqueue.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.dispatcherqueuepriority
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class DispatcherQueuePriority extends Win32Enum{

    /**
     * **Low** priority work will be scheduled when there isn't any other work to process. Work at **Low** priority can be preempted by new incoming **High** and **Normal** priority tasks.
     * @type {Integer (Int32)}
     */
    static Low => -10

    /**
     * Work will be dispatched once all **High** priority tasks are dispatched. If a new **High** priority work is scheduled, all new **High** priority tasks are processed before resuming **Normal** tasks. This is the default priority.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Work scheduled at **High** priority will be dispatched first, along with other **High** priority System tasks, before processing **Normal** or **Low** priority work.
     * @type {Integer (Int32)}
     */
    static High => 10
}
