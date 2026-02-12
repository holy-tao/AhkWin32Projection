#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate why a print workflow was canceled by using the [AbortPrintFlow](printworkflowconfiguration_abortprintflow_1834733795.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobabortreason
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowJobAbortReason extends Win32Enum{

    /**
     * The print job failed.
     * @type {Integer (Int32)}
     */
    static JobFailed => 0

    /**
     * The user canceled the print job.
     * @type {Integer (Int32)}
     */
    static UserCanceled => 1
}
