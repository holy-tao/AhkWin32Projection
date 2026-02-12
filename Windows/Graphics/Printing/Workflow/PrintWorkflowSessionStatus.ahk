#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that describe the status of the current print workflow session.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowsessionstatus
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowSessionStatus extends Win32Enum{

    /**
     * The current session has started.
     * @type {Integer (Int32)}
     */
    static Started => 0

    /**
     * The current session has completed.
     * @type {Integer (Int32)}
     */
    static Completed => 1

    /**
     * The current session has been aborted.
     * @type {Integer (Int32)}
     */
    static Aborted => 2

    /**
     * The current session has been closed.
     * @type {Integer (Int32)}
     */
    static Closed => 3

    /**
     * Page description language (PDL) data is available for modification after driver rendering is complete.
     * @type {Integer (Int32)}
     */
    static PdlDataAvailableForModification => 4
}
