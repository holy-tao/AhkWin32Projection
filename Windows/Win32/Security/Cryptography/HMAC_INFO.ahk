#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The HMAC_INFO structure specifies the hash algorithm and the inner and outer strings that are to be used to calculate the HMAC hash.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-hmac_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class HMAC_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Specifies the hash algorithm to be used.
     * @type {Integer}
     */
    HashAlgid {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to the inner string to be used in the HMAC calculation. The default inner string is defined as the byte 0x36 repeated 64 times.
     * @type {Pointer<Integer>}
     */
    pbInnerString {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The count of bytes in <b>pbInnerString</b>. The CSP uses the default inner string if <b>cbInnerString</b> is equal to zero.
     * @type {Integer}
     */
    cbInnerString {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to the outer string to be used in the HMAC calculation. The default outer string is defined as the byte 0x5C repeated 64 times.
     * @type {Pointer<Integer>}
     */
    pbOuterString {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The count of bytes in <b>pbOuterString</b>. The CSP uses the default outer string if <b>cbOuterString</b> is equal to zero.
     * @type {Integer}
     */
    cbOuterString {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
