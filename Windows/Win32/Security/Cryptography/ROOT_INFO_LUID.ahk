#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a locally unique identifier (LUID) for Cryptographic Smart Card Root Information.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-root_info_luid
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class ROOT_INFO_LUID extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Low-order bits.
     * @type {Integer}
     */
    LowPart {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * High-order bits.
     * @type {Integer}
     */
    HighPart {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
