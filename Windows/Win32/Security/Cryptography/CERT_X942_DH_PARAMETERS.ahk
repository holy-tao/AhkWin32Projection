#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CERT_X942_DH_VALIDATION_PARAMS.ahk" { CERT_X942_DH_VALIDATION_PARAMS }

/**
 * Contains parameters associated with a Diffie-Hellman public key algorithm.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_x942_dh_parameters
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_X942_DH_PARAMETERS {
    #StructPack 8

    /**
     * Prime modulus P. The most significant bit of the most significant byte must always be set to 1.
     */
    p : CRYPT_INTEGER_BLOB

    /**
     * Generator G. Must be the same length as <b>p</b> (must be padded with 0x00 bytes if it is less).
     */
    g : CRYPT_INTEGER_BLOB

    /**
     * Prime Q. 
     * 
     * 
     * 
     * 
     * A factor of p–1. The most significant bit of the most significant byte must be set to 1.
     */
    q : CRYPT_INTEGER_BLOB

    /**
     * Optional subgroup factor.
     */
    j : CRYPT_INTEGER_BLOB

    /**
     * Optional pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_x942_dh_validation_params">CERT_X942_DH_VALIDATION_PARAMS</a> structure. If the <b>cbData</b> member of the q BLOB is zero, all of the members of <b>pValidationParams</b> must be zero.
     */
    pValidationParams : CERT_X942_DH_VALIDATION_PARAMS.Ptr

}
