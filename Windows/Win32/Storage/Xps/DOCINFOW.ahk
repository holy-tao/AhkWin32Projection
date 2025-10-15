#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The DOCINFO structure contains the input and output file names and other information used by the StartDoc function.
 * @remarks
 * 
  * > [!NOTE]
  * > The wingdi.h header defines DOCINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-docinfow
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 * @charset Unicode
 */
class DOCINFOW extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The size, in bytes, of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Pointer to a null-terminated string that specifies the name of the document.
     * @type {PWSTR}
     */
    lpszDocName{
        get {
            if(!this.HasProp("__lpszDocName"))
                this.__lpszDocName := PWSTR(this.ptr + 8)
            return this.__lpszDocName
        }
    }

    /**
     * Pointer to a null-terminated string that specifies the name of an output file. If this pointer is <b>NULL</b>, the output will be sent to the device identified by the device context handle that was passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-startdoca">StartDoc</a> function.
     * @type {PWSTR}
     */
    lpszOutput{
        get {
            if(!this.HasProp("__lpszOutput"))
                this.__lpszOutput := PWSTR(this.ptr + 16)
            return this.__lpszOutput
        }
    }

    /**
     * Pointer to a null-terminated string that specifies the type of data used to record the print job. The legal values for this member can be found by calling <a href="https://docs.microsoft.com/windows/desktop/printdocs/enumprintprocessordatatypes">EnumPrintProcessorDatatypes</a> and can include such values as raw, emf, or XPS_PASS. This member can be <b>NULL</b>. Note that the requested data type might be ignored.
     * @type {PWSTR}
     */
    lpszDatatype{
        get {
            if(!this.HasProp("__lpszDatatype"))
                this.__lpszDatatype := PWSTR(this.ptr + 24)
            return this.__lpszDatatype
        }
    }

    /**
     * 
     * @type {Integer}
     */
    fwType {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 40
    }
}
