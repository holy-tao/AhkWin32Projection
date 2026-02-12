#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides values for the completion status of the print workflow job UI that is shown by calling the [LaunchAndCompleteUIAsync](printworkflowuilauncher_launchandcompleteuiasync_1066310702.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowuicompletionstatus
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowUICompletionStatus extends Win32Enum{

    /**
     * The print workflow job UI successfully completed.
     * @type {Integer (Int32)}
     */
    static Completed => 0

    /**
     * The print workflow job UI failed to launch.
     * @type {Integer (Int32)}
     */
    static LaunchFailed => 1

    /**
     * The print workflow job failed.
     * @type {Integer (Int32)}
     */
    static JobFailed => 2

    /**
     * The user canceled the print workflow job UI.
     * @type {Integer (Int32)}
     */
    static UserCanceled => 3
}
