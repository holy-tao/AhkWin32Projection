#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import ".\CRYPT_MASK_GEN_ALGORITHM.ahk" { CRYPT_MASK_GEN_ALGORITHM }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains the parameters for an RSA PKCS
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_rsa_ssa_pss_parameters
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_RSA_SSA_PSS_PARAMETERS {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that identifies the hash algorithm to use. If this is not set for encoding, the default algorithm is <b>szOID_OIWSEC_sha1</b>.
     */
    HashAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_mask_gen_algorithm">CRYPT_MASK_GEN_ALGORITHM</a> structure that identifies the mask generation function to use. If this is not set for encoding, the default algorithm is <b>szOID_RSA_MGF1</b> with the mask generation hash algorithm defaulting to the hash algorithm.
     */
    MaskGenAlgorithm : CRYPT_MASK_GEN_ALGORITHM

    /**
     * The octet length of the salt. If this is not set for encoding, the default salt length is the length of the hash value.
     */
    dwSaltLength : UInt32

    /**
     * The trailer field number. If this is not set for encoding, the default is <b>PKCS_RSA_SSA_PSS_TRAILER_FIELD_BC</b>.
     */
    dwTrailerField : UInt32

}
