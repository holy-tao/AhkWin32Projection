#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that describe the status of a print workflow session.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowsubmittedstatus
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowSubmittedStatus extends Win32Enum{

    /**
     * The session was successful: continue to printing
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * The session was cancelled: abort the printing process.
     * @type {Integer (Int32)}
     */
    static Canceled => 1

    /**
     * The session failed: abort the printing process.
     * @type {Integer (Int32)}
     */
    static Failed => 2
}
