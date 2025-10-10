#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_XML_DATA_BLOB.ahk

/**
 * Defines a Digital Signature Algorithm (DSA) key value. The CRYPT_XML_KEY_DSA_KEY_VALUE structure is used as an element of the key value union in the CRYPT_XML_KEY_VALUE structure.
 * @see https://docs.microsoft.com/windows/win32/api//cryptxml/ns-cryptxml-crypt_xml_key_dsa_key_value
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_KEY_DSA_KEY_VALUE extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * Defines the  P part of the DSA key.
     * @type {CRYPT_XML_DATA_BLOB}
     */
    P{
        get {
            if(!this.HasProp("__P"))
                this.__P := CRYPT_XML_DATA_BLOB(this.ptr + 0)
            return this.__P
        }
    }

    /**
     * Defines the  Q part of the DSA key.
     * @type {CRYPT_XML_DATA_BLOB}
     */
    Q{
        get {
            if(!this.HasProp("__Q"))
                this.__Q := CRYPT_XML_DATA_BLOB(this.ptr + 16)
            return this.__Q
        }
    }

    /**
     * Defines the  G part of the DSA key.
     * @type {CRYPT_XML_DATA_BLOB}
     */
    G{
        get {
            if(!this.HasProp("__G"))
                this.__G := CRYPT_XML_DATA_BLOB(this.ptr + 32)
            return this.__G
        }
    }

    /**
     * Defines the Y  part of the DSA key.
     * @type {CRYPT_XML_DATA_BLOB}
     */
    Y{
        get {
            if(!this.HasProp("__Y"))
                this.__Y := CRYPT_XML_DATA_BLOB(this.ptr + 48)
            return this.__Y
        }
    }

    /**
     * Defines the J part of the DSA key.
     * @type {CRYPT_XML_DATA_BLOB}
     */
    J{
        get {
            if(!this.HasProp("__J"))
                this.__J := CRYPT_XML_DATA_BLOB(this.ptr + 64)
            return this.__J
        }
    }

    /**
     * The seed value, in big-endian format.
     * @type {CRYPT_XML_DATA_BLOB}
     */
    Seed{
        get {
            if(!this.HasProp("__Seed"))
                this.__Seed := CRYPT_XML_DATA_BLOB(this.ptr + 80)
            return this.__Seed
        }
    }

    /**
     * The count value, in big-endian format.
     * @type {CRYPT_XML_DATA_BLOB}
     */
    Counter{
        get {
            if(!this.HasProp("__Counter"))
                this.__Counter := CRYPT_XML_DATA_BLOB(this.ptr + 96)
            return this.__Counter
        }
    }
}
