#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information needed for SP3 compatible encryption.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cmsg_sp3_compatible_aux_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_SP3_COMPATIBLE_AUX_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Size of this structure in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Setting CMSG_SP3_COMPATIBLE_ENCRYPT_FLAG enables SP3 compatible encryption. Zero <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">salt</a> instead of no salt and the encryption algorithm parameters are <b>NULL</b> instead of containing encoded RC2 parameters or encoded IV octet string. The encrypted <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">symmetric key</a> is encoded <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">little-endian</a> instead of <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">big-endian</a> form.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 8
    }
}
