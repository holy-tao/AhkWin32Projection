#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies how work items should be run.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.threading.workitemoptions
 * @namespace Windows.System.Threading
 * @version WindowsRuntime 1.4
 */
class WorkItemOptions extends Win32BitflagEnum{

    /**
     * The work item should be run when the thread pool has an available worker thread.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The work items should be run simultaneously with other work items sharing a processor.
     * @type {Integer (UInt32)}
     */
    static TimeSliced => 1
}
