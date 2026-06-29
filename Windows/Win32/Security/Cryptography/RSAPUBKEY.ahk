#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RSAPUBKEY structure contains information specific to the particular public key contained in the key BLOB.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-rsapubkey
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct RSAPUBKEY {
    #StructPack 4

    /**
     * Set to RSA1 (0x31415352) for public keys and to RSA2 (0x32415352) for private keys. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  The hexadecimal values are the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">ASCII</a> encoding of RSA1 and RSA2.</div>
     * <div> </div>
     */
    magic : UInt32

    /**
     * Number of bits in the modulus. In practice, this must always be a multiple of eight.
     */
    bitlen : UInt32

    /**
     * The public exponent.
     */
    pubexp : UInt32

}
