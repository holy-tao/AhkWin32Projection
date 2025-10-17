#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include .\CRYPT_MASK_GEN_ALGORITHM.ahk
#Include .\CRYPT_PSOURCE_ALGORITHM.ahk

/**
 * Contains the parameters for an RSAES-OAEP key encryption.
 * @remarks
 * 
  * RSAES-OAEP is normally used for encrypting AES symmetric keys. Normally, only the hash algorithm <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) will need to be set for encoding. For decoding, all the members are explicitly set.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crypt_rsaes_oaep_parameters
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_RSAES_OAEP_PARAMETERS extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that identifies the hash algorithm to use. If this is not set for encoding, the default algorithm is <b>szOID_OIWSEC_sha1</b>.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    HashAlgorithm{
        get {
            if(!this.HasProp("__HashAlgorithm"))
                this.__HashAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(0, this)
            return this.__HashAlgorithm
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_mask_gen_algorithm">CRYPT_MASK_GEN_ALGORITHM</a> structure that identifies the mask generation function to use. If this is not set for encoding, the default algorithm is <b>szOID_RSA_MGF1</b> with the mask generation hash algorithm defaulting to the algorithm specified by the <b>HashAlgorithm</b> member.
     * @type {CRYPT_MASK_GEN_ALGORITHM}
     */
    MaskGenAlgorithm{
        get {
            if(!this.HasProp("__MaskGenAlgorithm"))
                this.__MaskGenAlgorithm := CRYPT_MASK_GEN_ALGORITHM(24, this)
            return this.__MaskGenAlgorithm
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_psource_algorithm">CRYPT_PSOURCE_ALGORITHM</a> structure that contains the source of, and possibly the value of, the label to be used. If this is not set for encoding, the default algorithm is <b>szOID_RSA_PSPECIFIED</b> with no OCTET bytes.
     * @type {CRYPT_PSOURCE_ALGORITHM}
     */
    PSourceAlgorithm{
        get {
            if(!this.HasProp("__PSourceAlgorithm"))
                this.__PSourceAlgorithm := CRYPT_PSOURCE_ALGORITHM(56, this)
            return this.__PSourceAlgorithm
        }
    }
}
