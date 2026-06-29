#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the scope of a print ticket.
 * @see https://learn.microsoft.com/windows/win32/api/prntvpt/ne-prntvpt-eprintticketscope
 * @namespace Windows.Win32.Graphics.Printing.PrintTicket
 */
export default struct EPrintTicketScope {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
