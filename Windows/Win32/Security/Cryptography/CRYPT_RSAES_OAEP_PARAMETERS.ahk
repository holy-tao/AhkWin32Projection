#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import ".\CRYPT_PSOURCE_ALGORITHM.ahk" { CRYPT_PSOURCE_ALGORITHM }
#Import ".\CRYPT_MASK_GEN_ALGORITHM.ahk" { CRYPT_MASK_GEN_ALGORITHM }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains the parameters for an RSAES-OAEP key encryption.
 * @remarks
 * RSAES-OAEP is normally used for encrypting AES symmetric keys. Normally, only the hash algorithm <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) will need to be set for encoding. For decoding, all the members are explicitly set.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_rsaes_oaep_parameters
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_RSAES_OAEP_PARAMETERS {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that identifies the hash algorithm to use. If this is not set for encoding, the default algorithm is <b>szOID_OIWSEC_sha1</b>.
     */
    HashAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_mask_gen_algorithm">CRYPT_MASK_GEN_ALGORITHM</a> structure that identifies the mask generation function to use. If this is not set for encoding, the default algorithm is <b>szOID_RSA_MGF1</b> with the mask generation hash algorithm defaulting to the algorithm specified by the <b>HashAlgorithm</b> member.
     */
    MaskGenAlgorithm : CRYPT_MASK_GEN_ALGORITHM

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_psource_algorithm">CRYPT_PSOURCE_ALGORITHM</a> structure that contains the source of, and possibly the value of, the label to be used. If this is not set for encoding, the default algorithm is <b>szOID_RSA_PSPECIFIED</b> with no OCTET bytes.
     */
    PSourceAlgorithm : CRYPT_PSOURCE_ALGORITHM

}
