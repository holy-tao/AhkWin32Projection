#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
     * @type {PWSTR}
     */
    pDocName{
        get {
            if(!this.HasProp("__pDocName"))
                this.__pDocName := PWSTR(this.ptr + 0)
            return this.__pDocName
        }
    }

    /**
     * Pointer to a null-terminated string that specifies the name of an output file. To print to a printer, set this to **NULL**.
     * @type {PWSTR}
     */
    pOutputFile{
        get {
            if(!this.HasProp("__pOutputFile"))
                this.__pOutputFile := PWSTR(this.ptr + 8)
            return this.__pOutputFile
        }
    }

    /**
     * Pointer to a null-terminated string that identifies the type of data used to record the document.
     * @type {PWSTR}
     */
    pDatatype{
        get {
            if(!this.HasProp("__pDatatype"))
                this.__pDatatype := PWSTR(this.ptr + 16)
            return this.__pDatatype
        }
    }
}
