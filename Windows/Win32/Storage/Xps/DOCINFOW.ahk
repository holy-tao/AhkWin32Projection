#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The DOCINFO structure contains the input and output file names and other information used by the StartDoc function. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The wingdi.h header defines DOCINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-docinfow
 * @namespace Windows.Win32.Storage.Xps
 * @charset Unicode
 */
export default struct DOCINFOW {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    cbSize : Int32 := this.Size

    /**
     * Pointer to a null-terminated string that specifies the name of the document.
     */
    lpszDocName : PWSTR

    /**
     * Pointer to a null-terminated string that specifies the name of an output file. If this pointer is <b>NULL</b>, the output will be sent to the device identified by the device context handle that was passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-startdoca">StartDoc</a> function.
     */
    lpszOutput : PWSTR

    /**
     * Pointer to a null-terminated string that specifies the type of data used to record the print job. The legal values for this member can be found by calling <a href="https://docs.microsoft.com/windows/desktop/printdocs/enumprintprocessordatatypes">EnumPrintProcessorDatatypes</a> and can include such values as raw, emf, or XPS_PASS. This member can be <b>NULL</b>. Note that the requested data type might be ignored.
     */
    lpszDatatype : PWSTR

    fwType : UInt32

}
