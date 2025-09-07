#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DOC\_INFO\_1 structure describes a document that will be printed.
 * @see https://learn.microsoft.com/windows/win32/printdocs/doc-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class DOC_INFO_1W extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that specifies the name of the document.
     * @type {Pointer<Ptr>}
     */
    pDocName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a null-terminated string that specifies the name of an output file. To print to a printer, set this to **NULL**.
     * @type {Pointer<Ptr>}
     */
    pOutputFile {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a null-terminated string that identifies the type of data used to record the document.
     * @type {Pointer<Ptr>}
     */
    pDatatype {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
