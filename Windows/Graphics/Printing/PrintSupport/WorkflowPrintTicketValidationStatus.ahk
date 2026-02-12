#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that represent the validation status for a print ticket.
 * @remarks
 * For more information, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.workflowprintticketvalidationstatus
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class WorkflowPrintTicketValidationStatus extends Win32Enum{

    /**
     * The print ticket was modified to resolve conflicts.
     * @type {Integer (Int32)}
     */
    static Resolved => 0

    /**
     * The print ticket options conflict and could not be resolved.
     * @type {Integer (Int32)}
     */
    static Conflicting => 1

    /**
     * The print ticket has invalid XML or an invalid namespace.
     * @type {Integer (Int32)}
     */
    static Invalid => 2
}
