#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_XML_DATA_BLOB.ahk
#Include .\CRYPT_XML_KEY_DSA_KEY_VALUE.ahk
#Include .\CRYPT_XML_KEY_RSA_KEY_VALUE.ahk
#Include .\CRYPT_XML_BLOB.ahk
#Include .\CRYPT_XML_KEY_ECDSA_KEY_VALUE.ahk
#Include .\CRYPT_XML_KEY_VALUE.ahk
#Include .\CRYPT_XML_X509DATA.ahk

/**
 * Encapsulates key information data that corresponds to a KeyInfo element. The KeyInfo element enables the recipient to obtain the key needed to validate the signature.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_key_info_item
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_KEY_INFO_ITEM extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the key information type encapsulated in this structure.
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    wszKeyName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {CRYPT_XML_KEY_VALUE}
     */
    KeyValue{
        get {
            if(!this.HasProp("__KeyValue"))
                this.__KeyValue := CRYPT_XML_KEY_VALUE(this.ptr + 8)
            return this.__KeyValue
        }
    }

    /**
     * @type {CRYPT_XML_BLOB}
     */
    RetrievalMethod{
        get {
            if(!this.HasProp("__RetrievalMethod"))
                this.__RetrievalMethod := CRYPT_XML_BLOB(this.ptr + 8)
            return this.__RetrievalMethod
        }
    }

    /**
     * @type {CRYPT_XML_X509DATA}
     */
    X509Data{
        get {
            if(!this.HasProp("__X509Data"))
                this.__X509Data := CRYPT_XML_X509DATA(this.ptr + 8)
            return this.__X509Data
        }
    }

    /**
     * @type {CRYPT_XML_BLOB}
     */
    Custom{
        get {
            if(!this.HasProp("__Custom"))
                this.__Custom := CRYPT_XML_BLOB(this.ptr + 8)
            return this.__Custom
        }
    }
}
