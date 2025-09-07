#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PSTR.ahk
#Include ..\CRYPT_INTEGER_BLOB.ahk
#Include ..\CRYPT_ATTRIBUTE_TYPE_VALUE.ahk
#Include ..\CRYPT_ALGORITHM_IDENTIFIER.ahk

/**
 * Contains the digest of the hashed subject information.
 * @see https://learn.microsoft.com/windows/win32/api/mssip/ns-mssip-sip_indirect_data
 * @namespace Windows.Win32.Security.Cryptography.Sip
 * @version v4.0.30319
 */
class SIP_INDIRECT_DATA extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute_type_value">CRYPT_ATTRIBUTE_TYPE_VALUE</a> structure used to encode the attribute.
     * @type {CRYPT_ATTRIBUTE_TYPE_VALUE}
     */
    Data{
        get {
            if(!this.HasProp("__Data"))
                this.__Data := CRYPT_ATTRIBUTE_TYPE_VALUE(this.ptr + 0)
            return this.__Data
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains the digest algorithm to use to create the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a>.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    DigestAlgorithm{
        get {
            if(!this.HasProp("__DigestAlgorithm"))
                this.__DigestAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 24)
            return this.__DigestAlgorithm
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_HASH_BLOB</a> structure that contains the hash of the subject. For information about <b>CRYPT_HASH_BLOB</b>, see <b>CRYPT_INTEGER_BLOB</b>.
     * @type {CRYPT_INTEGER_BLOB}
     */
    Digest{
        get {
            if(!this.HasProp("__Digest"))
                this.__Digest := CRYPT_INTEGER_BLOB(this.ptr + 48)
            return this.__Digest
        }
    }
}
