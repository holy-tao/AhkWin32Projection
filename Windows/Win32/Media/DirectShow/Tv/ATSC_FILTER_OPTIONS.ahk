#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The ATSC_FILTER_OPTIONS structure specifies additional criteria for matching ATSC section headers.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-atsc_filter_options
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ATSC_FILTER_OPTIONS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * If this flag is <b>TRUE</b>, the ETM_id field in the header must match the value of the <b>EtmId</b> structure member. Otherwise, the ETM_id field is ignored.
     * @type {BOOL}
     */
    fSpecifyEtmId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies a value for the ETM_id field.
     * @type {Integer}
     */
    EtmId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
