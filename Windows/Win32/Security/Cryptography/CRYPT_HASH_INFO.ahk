#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_HASH_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
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
     * @type {CRYPT_INTEGER_BLOB}
     */
    Hash{
        get {
            if(!this.HasProp("__Hash"))
                this.__Hash := CRYPT_INTEGER_BLOB(this.ptr + 24)
            return this.__Hash
        }
    }
}
