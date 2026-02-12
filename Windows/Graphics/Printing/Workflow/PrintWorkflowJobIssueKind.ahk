#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the kind of issue that was detected in a printer job operation.
 * @remarks
 * This enumeration is used by the [JobIssueKind](printworkflowjobissuedetectedeventargs_jobissuekind.md) property of the [PrintWorkflowJobIssueDetectedEventArgs](printworkflowjobissuedetectedeventargs.md) object passed into the handler for the[PrintWorkflowJobBackgroundSession.JobIssueDetected](printworkflowjobbackgroundsession_jobissuedetected.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowjobissuekind
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowJobIssueKind extends Win32Enum{

    /**
     * Other.
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * Attention required.
     * @type {Integer (Int32)}
     */
    static AttentionRequired => 1

    /**
     * Door open.
     * @type {Integer (Int32)}
     */
    static DoorOpen => 2

    /**
     * Marker supply low.
     * @type {Integer (Int32)}
     */
    static MarkerSupplyLow => 3

    /**
     * Marker supply low.
     * @type {Integer (Int32)}
     */
    static MarkerSupplyEmpty => 4

    /**
     * Media jam.
     * @type {Integer (Int32)}
     */
    static MediaJam => 5

    /**
     * Media empty.
     * @type {Integer (Int32)}
     */
    static MediaEmpty => 6

    /**
     * Media low.
     * @type {Integer (Int32)}
     */
    static MediaLow => 7

    /**
     * Output area almost full.
     * @type {Integer (Int32)}
     */
    static OutputAreaAlmostFull => 8

    /**
     * Output area full.
     * @type {Integer (Int32)}
     */
    static OutputAreaFull => 9

    /**
     * Job printing error.
     * @type {Integer (Int32)}
     */
    static JobPrintingError => 10
}
