#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CMSG_RC4_AUX_INFO structure contains the bit length of the key for RC4 encryption algorithms. The pvEncryptionAuxInfo member in CMSG_ENVELOPED_ENCODE_INFO can be set to point to an instance of this structure.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_rc4_aux_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_RC4_AUX_INFO {
    #StructPack 4

    /**
     * Size of this structure in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Determines the RC4 <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">salt length</a>. If set to CMSG_RC4_NO_SALT_FLAG, no salt is generated. For any other value, (128 - the length set) /8 bytes of salt are generated and encoded as an OCTET STRING in the algorithm parameters field.
     */
    dwBitLen : UInt32

}
