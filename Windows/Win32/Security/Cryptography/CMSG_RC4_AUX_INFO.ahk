#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CMSG_RC4_AUX_INFO structure contains the bit length of the key for RC4 encryption algorithms. The pvEncryptionAuxInfo member in CMSG_ENVELOPED_ENCODE_INFO can be set to point to an instance of this structure.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cmsg_rc4_aux_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_RC4_AUX_INFO extends Win32Struct
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
     * Determines the RC4 <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">salt length</a>. If set to CMSG_RC4_NO_SALT_FLAG, no salt is generated. For any other value, (128 - the length set) /8 bytes of salt are generated and encoded as an OCTET STRING in the algorithm parameters field.
     * @type {Integer}
     */
    dwBitLen {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 8
    }
}
