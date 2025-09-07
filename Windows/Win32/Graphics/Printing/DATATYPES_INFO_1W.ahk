#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The DATATYPES\_INFO\_1 structure contains information about the data type used to record a print job.
 * @see https://learn.microsoft.com/windows/win32/printdocs/datatypes-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class DATATYPES_INFO_1W extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that identifies the data type used to record a print job.
     * @type {PWSTR}
     */
    pName{
        get {
            if(!this.HasProp("__pName"))
                this.__pName := PWSTR(this.ptr + 0)
            return this.__pName
        }
    }
}
