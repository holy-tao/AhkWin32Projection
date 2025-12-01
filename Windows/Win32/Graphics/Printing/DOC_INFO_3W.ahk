#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DOC\_INFO\_3 structure describes a document that will be printed.
 * @remarks
 * The DI\_MEMORYMAP\_WRITE setting in **DOC\_INFO\_3** is an optimization. This allows GDI to map spool files in the application and speed up the recording.
 * @see https://learn.microsoft.com/windows/win32/printdocs/doc-info-3
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class DOC_INFO_3W extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that specifies the name of the document.
     * @type {PWSTR}
     */
    pDocName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a null-terminated string that specifies the name of an output file.
     * @type {PWSTR}
     */
    pOutputFile {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a null-terminated string that identifies the type of data used to record the document.
     * @type {PWSTR}
     */
    pDatatype {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Flags. Currently, it can be **NULL** or the following.
     * 
     * 
     * 
     * | Flag                 | Meaning                                                                                                                                          |
     * |----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
     * | DI\_MEMORYMAP\_WRITE | Causes [**StartDocPrinter**](startdocprinter.md) to not use [**AddJob**](addjob.md) and [**ScheduleJob**](schedulejob.md) for local printing. |
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
