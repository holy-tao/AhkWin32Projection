#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include .\CRYPT_MASK_GEN_ALGORITHM.ahk

/**
 * Contains the parameters for an RSA PKCS
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crypt_rsa_ssa_pss_parameters
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_RSA_SSA_PSS_PARAMETERS extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that identifies the hash algorithm to use. If this is not set for encoding, the default algorithm is <b>szOID_OIWSEC_sha1</b>.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    HashAlgorithm{
        get {
            if(!this.HasProp("__HashAlgorithm"))
                this.__HashAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 0)
            return this.__HashAlgorithm
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_mask_gen_algorithm">CRYPT_MASK_GEN_ALGORITHM</a> structure that identifies the mask generation function to use. If this is not set for encoding, the default algorithm is <b>szOID_RSA_MGF1</b> with the mask generation hash algorithm defaulting to the hash algorithm.
     * @type {CRYPT_MASK_GEN_ALGORITHM}
     */
    MaskGenAlgorithm{
        get {
            if(!this.HasProp("__MaskGenAlgorithm"))
                this.__MaskGenAlgorithm := CRYPT_MASK_GEN_ALGORITHM(this.ptr + 24)
            return this.__MaskGenAlgorithm
        }
    }

    /**
     * The octet length of the salt. If this is not set for encoding, the default salt length is the length of the hash value.
     * @type {Integer}
     */
    dwSaltLength {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The trailer field number. If this is not set for encoding, the default is <b>PKCS_RSA_SSA_PSS_TRAILER_FIELD_BC</b>.
     * @type {Integer}
     */
    dwTrailerField {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }
}
