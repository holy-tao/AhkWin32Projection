#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a key container parameter.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_key_prov_param
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_KEY_PROV_PARAM extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Identifies the parameter. For possible values, see the <i>dwParam</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptsetprovparam">CryptSetProvParam</a> function.
     * @type {Integer}
     */
    dwParam {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The address of a buffer that contains the parameter data. For more information, see the <i>pbData</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptsetprovparam">CryptSetProvParam</a> function.
     * @type {Pointer<Integer>}
     */
    pbData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size, in bytes, of the <b>pbData</b> buffer.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * This member is reserved for future use and is zero.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
