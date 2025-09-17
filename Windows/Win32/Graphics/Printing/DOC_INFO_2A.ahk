#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DOC\_INFO\_2 structure describes a document that will be printed.
 * @see https://learn.microsoft.com/windows/win32/printdocs/doc-info-2
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class DOC_INFO_2A extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that specifies the name of the document.
     * @type {Pointer<Byte>}
     */
    pDocName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a null-terminated string that specifies the name of an output file.
     * @type {Pointer<Byte>}
     */
    pOutputFile {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a null-terminated string that identifies the type of data used to record the document.
     * @type {Pointer<Byte>}
     */
    pDatatype {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Informs the print spooler of the nature of the data to follow. If this value is zero, the print spooler treats the data sent by subsequent calls to [**WritePrinter**](writeprinter.md) as a normal print job (whether or not it is spooled depends on the printer property). If this value is DI\_CHANNEL, only a communications channel is opened. In this case, the data passed into subsequent calls to **WritePrinter** is sent to the printer or subsequent calls to [**ReadPrinter**](readprinter.md) retrieve data from the printer. This mode remains effective until [**EndDoc**](/windows/desktop/api/Wingdi/nf-wingdi-enddoc) is called.
     * @type {Integer}
     */
    dwMode {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved for internal use; should be zero.
     * @type {Integer}
     */
    JobId {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
