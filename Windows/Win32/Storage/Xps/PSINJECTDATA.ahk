#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PSINJECTDATA structure is a header for the input buffer used with the POSTSCRIPT_INJECTION printer escape function.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-psinjectdata
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class PSINJECTDATA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The number of bytes of raw data to be injected. The raw data begins immediately following this structure. This size does not include the size of the <b>PSINJECTDATA</b> structure.
     * @type {Integer}
     */
    DataBytes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    InjectionPoint {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * The page number (starting from 1) to which the injection data is applied. Specify zero to apply the injection data to all pages. This member is meaningful only for page level injection points starting from PSINJECT_PAGENUMBER. For other injection points, set <b>PageNumber</b> to zero.
     * @type {Integer}
     */
    PageNumber {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
