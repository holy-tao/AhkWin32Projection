#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how attributes supplied by the Printer Support App should be merged with PrintTicket attributes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.workflow.printworkflowattributesmergepolicy
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class PrintWorkflowAttributesMergePolicy extends Win32Enum{

    /**
     * PSA attributes are merged with the attributes derived from PrintTicket, preferring the Print Ticket over PSA for the attributes with the same name.
     * @type {Integer (Int32)}
     */
    static MergePreferPrintTicketOnConflict => 0

    /**
     * PSA attributes are merged with the attributes derived from PrintTicket, preferring the PSA over Print Ticket for the attributes with the same name.
     * @type {Integer (Int32)}
     */
    static MergePreferPsaOnConflict => 1

    /**
     * The PSA provides a new set of attributes which are not merged with the attributes derived from PrintTicket.
     * @type {Integer (Int32)}
     */
    static DoNotMergeWithPrintTicket => 2
}
