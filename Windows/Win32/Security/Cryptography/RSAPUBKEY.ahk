#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RSAPUBKEY structure contains information specific to the particular public key contained in the key BLOB.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-rsapubkey
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class RSAPUBKEY extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Set to RSA1 (0x31415352) for public keys and to RSA2 (0x32415352) for private keys. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  The hexadecimal values are the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">ASCII</a> encoding of RSA1 and RSA2.</div>
     * <div> </div>
     * @type {Integer}
     */
    magic {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of bits in the modulus. In practice, this must always be a multiple of eight.
     * @type {Integer}
     */
    bitlen {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The public exponent.
     * @type {Integer}
     */
    pubexp {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
