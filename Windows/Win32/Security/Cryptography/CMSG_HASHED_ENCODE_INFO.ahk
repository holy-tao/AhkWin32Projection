#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\HCRYPTPROV_LEGACY.ahk" { HCRYPTPROV_LEGACY }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Used with hashed messages. It is passed to the CryptMsgOpenToEncode function if the CryptMsgOpenToEncode function's dwMsgType parameter is CMSG_ENVELOPED.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_hashed_encode_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_HASHED_ENCODE_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * This member is not used and should be set to <b>NULL</b>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>Specifies a handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) used to do the hash. The <i>hCryptProv</i> private keys are not used. 
     * 
     * 
     * This member's data type is <b>HCRYPTPROV</b>.
     * 
     * Unless there is a strong reason for passing in a specific cryptographic provider in <i>hCryptProv</i>, pass zero to use the default RSA or DSS provider to be acquired before doing hash, signature verification, or recipient encryption operations.
     */
    hCryptProv : HCRYPTPROV_LEGACY

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains the hash algorithm type and any associated additional parameters.
     */
    HashAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * This member is currently not used and must be set to <b>NULL</b>.
     */
    pvHashAuxInfo : IntPtr

}
