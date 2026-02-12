#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that describe the selection type of a print ticket feature. This indicates whether the user can select only one option or multiple for a feature.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printticket.printticketfeatureselectiontype
 * @namespace Windows.Graphics.Printing.PrintTicket
 * @version WindowsRuntime 1.4
 */
class PrintTicketFeatureSelectionType extends Win32Enum{

    /**
     * The user must select one option for the print feature.
     * @type {Integer (Int32)}
     */
    static PickOne => 0

    /**
     * The user can select multiple options for the print feature.
     * @type {Integer (Int32)}
     */
    static PickMany => 1
}
