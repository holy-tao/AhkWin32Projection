#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DATATYPES\_INFO\_1 structure contains information about the data type used to record a print job.
 * @see https://learn.microsoft.com/windows/win32/printdocs/datatypes-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class DATATYPES_INFO_1A extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that identifies the data type used to record a print job.
     * @type {Pointer<Byte>}
     */
    pName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
