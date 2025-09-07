#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the scope of a print ticket.
 * @see https://learn.microsoft.com/windows/win32/api/prntvpt/ne-prntvpt-eprintticketscope
 * @namespace Windows.Win32.Graphics.Printing.PrintTicket
 * @version v4.0.30319
 */
class EPrintTicketScope{

    /**
     * The print ticket applies only to a single page.
     * @type {Integer (Int32)}
     */
    static kPTPageScope => 0

    /**
     * The print ticket applies to the whole document.
     * @type {Integer (Int32)}
     */
    static kPTDocumentScope => 1

    /**
     * The print ticket applies to all documents in the print job.
     * @type {Integer (Int32)}
     */
    static kPTJobScope => 2
}
