#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_XML_DATA_BLOB.ahk
#Include .\CRYPT_XML_KEY_DSA_KEY_VALUE.ahk
#Include .\CRYPT_XML_KEY_RSA_KEY_VALUE.ahk
#Include .\CRYPT_XML_BLOB.ahk
#Include .\CRYPT_XML_KEY_ECDSA_KEY_VALUE.ahk

/**
 * Contains a single public key that may be useful in validating the signature.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_key_value
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_KEY_VALUE extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * Specifies the key value type.
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {CRYPT_XML_KEY_DSA_KEY_VALUE}
     */
    DSAKeyValue{
        get {
            if(!this.HasProp("__DSAKeyValue"))
                this.__DSAKeyValue := CRYPT_XML_KEY_DSA_KEY_VALUE(8, this)
            return this.__DSAKeyValue
        }
    }

    /**
     * @type {CRYPT_XML_KEY_RSA_KEY_VALUE}
     */
    RSAKeyValue{
        get {
            if(!this.HasProp("__RSAKeyValue"))
                this.__RSAKeyValue := CRYPT_XML_KEY_RSA_KEY_VALUE(8, this)
            return this.__RSAKeyValue
        }
    }

    /**
     * @type {CRYPT_XML_KEY_ECDSA_KEY_VALUE}
     */
    ECDSAKeyValue{
        get {
            if(!this.HasProp("__ECDSAKeyValue"))
                this.__ECDSAKeyValue := CRYPT_XML_KEY_ECDSA_KEY_VALUE(8, this)
            return this.__ECDSAKeyValue
        }
    }

    /**
     * @type {CRYPT_XML_BLOB}
     */
    Custom{
        get {
            if(!this.HasProp("__Custom"))
                this.__Custom := CRYPT_XML_BLOB(8, this)
            return this.__Custom
        }
    }
}
