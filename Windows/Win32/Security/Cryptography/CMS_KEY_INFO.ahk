#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Not used.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cms_key_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMS_KEY_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * One of the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/alg-id">ALG_ID</a> values that identifies the algorithm for the key to be converted.
     * @type {Integer}
     */
    Algid {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The address of a buffer that contains additional public information. This member is optional and can be <b>NULL</b> if this is not needed.
     * @type {Pointer<Integer>}
     */
    pbOID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size, in bytes, of the <b>pbOID</b> buffer. This member should be zero if <b>pbOID</b> is not used.
     * @type {Integer}
     */
    cbOID {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
