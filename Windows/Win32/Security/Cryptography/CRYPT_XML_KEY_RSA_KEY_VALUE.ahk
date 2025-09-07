#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_XML_DATA_BLOB.ahk

/**
 * Defines an RSA key value. The CRYPT_XML_KEY_RSA_KEY_VALUE structure is used as element of the key value union in the CRYPT_XML_KEY_VALUE structure.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_key_rsa_key_value
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_KEY_RSA_KEY_VALUE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_data_blob">CRYPT_XML_DATA_BLOB</a> structure that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key</a> modulus data.
     * @type {CRYPT_XML_DATA_BLOB}
     */
    Modulus{
        get {
            if(!this.HasProp("__Modulus"))
                this.__Modulus := CRYPT_XML_DATA_BLOB(this.ptr + 0)
            return this.__Modulus
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_data_blob">CRYPT_XML_DATA_BLOB</a> structure that contains the public key exponent data.
     * @type {CRYPT_XML_DATA_BLOB}
     */
    Exponent{
        get {
            if(!this.HasProp("__Exponent"))
                this.__Exponent := CRYPT_XML_DATA_BLOB(this.ptr + 16)
            return this.__Exponent
        }
    }
}
