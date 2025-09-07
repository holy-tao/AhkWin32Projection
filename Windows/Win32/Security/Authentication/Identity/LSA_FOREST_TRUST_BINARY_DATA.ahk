#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains binary data used in Local Security Authority forest trust operations.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_binary_data
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_FOREST_TRUST_BINARY_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an array of type <b>UCHAR</b> that contains the binary data. The buffer can contain at most 128 KB of data.
     * @type {Pointer<Byte>}
     */
    Buffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
