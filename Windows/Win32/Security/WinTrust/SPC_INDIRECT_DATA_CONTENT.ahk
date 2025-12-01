#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Cryptography\CRYPT_INTEGER_BLOB.ahk
#Include ..\Cryptography\CRYPT_ATTRIBUTE_TYPE_VALUE.ahk
#Include ..\Cryptography\CRYPT_ALGORITHM_IDENTIFIER.ahk

/**
 * Is used in Authenticode signatures to store the digest and other attributes of the signed file.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-spc_indirect_data_content
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class SPC_INDIRECT_DATA_CONTENT extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute_type_value">CRYPT_ATTRIBUTE_TYPE_VALUE</a> that contains attributes of the digested file.
     * @type {CRYPT_ATTRIBUTE_TYPE_VALUE}
     */
    Data{
        get {
            if(!this.HasProp("__Data"))
                this.__Data := CRYPT_ATTRIBUTE_TYPE_VALUE(0, this)
            return this.__Data
        }
    }

    /**
     * Specifies the digest algorithm used to hash the file.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    DigestAlgorithm{
        get {
            if(!this.HasProp("__DigestAlgorithm"))
                this.__DigestAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(24, this)
            return this.__DigestAlgorithm
        }
    }

    /**
     * The Authenticode digest value of the file using the algorithm specified in the  <i>DigestAlgorithm</i> parameter.
     * @type {CRYPT_INTEGER_BLOB}
     */
    Digest{
        get {
            if(!this.HasProp("__Digest"))
                this.__Digest := CRYPT_INTEGER_BLOB(48, this)
            return this.__Digest
        }
    }
}
