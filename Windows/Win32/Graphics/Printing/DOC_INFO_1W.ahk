#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The DOC\_INFO\_1 structure describes a document that will be printed.
 * @see https://learn.microsoft.com/windows/win32/printdocs/doc-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @charset Unicode
 */
export default struct DOC_INFO_1W {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that specifies the name of the document.
     */
    pDocName : PWSTR

    /**
     * Pointer to a null-terminated string that specifies the name of an output file. To print to a printer, set this to **NULL**.
     */
    pOutputFile : PWSTR

    /**
     * Pointer to a null-terminated string that identifies the type of data used to record the document.
     */
    pDatatype : PWSTR

}
