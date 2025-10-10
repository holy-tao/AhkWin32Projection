#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the bit length of the key for RC2 encryption algorithms.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cmsg_rc2_aux_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_RC2_AUX_INFO extends Win32Struct
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
     * Specifies the RC2 effective key length. Currently 40-, 64-, and 128-bit lengths are supported. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  This value is the actual key bit length to be used. The values of the <b>dwVersion</b> member of a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_rc2_cbc_parameters">CRYPT_RC2_CBC_PARAMETERS</a> structure to indicate the use of a specific key length is not that specific key length. For example, the <b>dwVersion</b> value that indicates the use of a 128-bit key length is CRYPT_RC2_128BIT_VERSION, which is defined as 58, not 128 bits.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  If <b>dwBitLen</b> is set to CMSG_SP3_COMPATIBLE_ENCRYPT_FLAG, SP3 compatible encryption is done and the 40-bit default length is ignored.</div>
     * <div> </div>
     * @type {Integer}
     */
    dwBitLen {
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
