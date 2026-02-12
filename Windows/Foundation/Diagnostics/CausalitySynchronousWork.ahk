#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the relationship between a work item and an asynchronous operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.causalitysynchronouswork
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class CausalitySynchronousWork extends Win32Enum{

    /**
     * The work item being scheduled is running due to the completion of the asynchronous operation.
     * @type {Integer (Int32)}
     */
    static CompletionNotification => 0

    /**
     * The work item being scheduled is running due to reaching a milestone within the asynchronous operation.
     * @type {Integer (Int32)}
     */
    static ProgressNotification => 1

    /**
     * The work item being scheduled is part of the actual work of the asynchronous operation, like opening a file.
     * @type {Integer (Int32)}
     */
    static Execution => 2
}
