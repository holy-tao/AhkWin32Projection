#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_XML_DATA_BLOB.ahk
#Include .\CRYPT_XML_BLOB.ahk

/**
 * Defines an Elliptic Curve Digital Signature Algorithm (ECDSA) key value. The CRYPT_XML_KEY_ECDSA_KEY_VALUE structure is used as an element of the key value union in the CRYPT_XML_KEY_VALUE structure.
 * @see https://docs.microsoft.com/windows/win32/api//cryptxml/ns-cryptxml-crypt_xml_key_ecdsa_key_value
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_KEY_ECDSA_KEY_VALUE extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * A pointer to a null-terminated Unicode string that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) of the named curve.
     * @type {Pointer<Char>}
     */
    wszNamedCurve {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Defines the X value of an ECDSA curve.
     * @type {CRYPT_XML_DATA_BLOB}
     */
    X{
        get {
            if(!this.HasProp("__X"))
                this.__X := CRYPT_XML_DATA_BLOB(this.ptr + 8)
            return this.__X
        }
    }

    /**
     * Defines the Y value of an ECDSA curve.
     * @type {CRYPT_XML_DATA_BLOB}
     */
    Y{
        get {
            if(!this.HasProp("__Y"))
                this.__Y := CRYPT_XML_DATA_BLOB(this.ptr + 24)
            return this.__Y
        }
    }

    /**
     * A   <b>CRYPT_XML_BLOB</b> value that defines the encoded parameters of an ECDSA curve.
     * @type {CRYPT_XML_BLOB}
     */
    ExplicitPara{
        get {
            if(!this.HasProp("__ExplicitPara"))
                this.__ExplicitPara := CRYPT_XML_BLOB(this.ptr + 40)
            return this.__ExplicitPara
        }
    }
}
