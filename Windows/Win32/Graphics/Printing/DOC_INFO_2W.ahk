#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The DOC\_INFO\_2 structure describes a document that will be printed.
 * @see https://learn.microsoft.com/windows/win32/printdocs/doc-info-2
 * @namespace Windows.Win32.Graphics.Printing
 * @charset Unicode
 */
export default struct DOC_INFO_2W {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that specifies the name of the document.
     */
    pDocName : PWSTR

    /**
     * Pointer to a null-terminated string that specifies the name of an output file.
     */
    pOutputFile : PWSTR

    /**
     * Pointer to a null-terminated string that identifies the type of data used to record the document.
     */
    pDatatype : PWSTR

    /**
     * Informs the print spooler of the nature of the data to follow. If this value is zero, the print spooler treats the data sent by subsequent calls to [**WritePrinter**](writeprinter.md) as a normal print job (whether or not it is spooled depends on the printer property). If this value is DI\_CHANNEL, only a communications channel is opened. In this case, the data passed into subsequent calls to **WritePrinter** is sent to the printer or subsequent calls to [**ReadPrinter**](readprinter.md) retrieve data from the printer. This mode remains effective until [**EndDoc**](/windows/desktop/api/Wingdi/nf-wingdi-enddoc) is called.
     */
    dwMode : UInt32

    /**
     * Reserved for internal use; should be zero.
     */
    JobId : UInt32

}
