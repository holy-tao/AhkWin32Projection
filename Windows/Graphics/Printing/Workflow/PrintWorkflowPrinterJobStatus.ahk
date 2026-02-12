#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that describe the status of the current print workflow printer job.
 * @remarks
 * For more information, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowprinterjobstatus
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowPrinterJobStatus extends Win32Enum{

    /**
     * The current session encountered an error.
     * @type {Integer (Int32)}
     */
    static Error => 0

    /**
     * The current session has been aborted.
     * @type {Integer (Int32)}
     */
    static Aborted => 1

    /**
     * The current session is in progress.
     * @type {Integer (Int32)}
     */
    static InProgress => 2

    /**
     * The current session has completed.
     * @type {Integer (Int32)}
     */
    static Completed => 3
}
