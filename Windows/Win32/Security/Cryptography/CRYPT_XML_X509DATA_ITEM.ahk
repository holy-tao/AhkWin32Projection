#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_XML_ISSUER_SERIAL.ahk
#Include .\CRYPT_XML_DATA_BLOB.ahk
#Include .\CRYPT_XML_BLOB.ahk

/**
 * Represents X.509 data that is to be encoded in an X509Data named element.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_x509data_item
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_X509DATA_ITEM extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the data item type.
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {CRYPT_XML_ISSUER_SERIAL}
     */
    IssuerSerial{
        get {
            if(!this.HasProp("__IssuerSerial"))
                this.__IssuerSerial := CRYPT_XML_ISSUER_SERIAL(this.ptr + 8)
            return this.__IssuerSerial
        }
    }

    /**
     * @type {CRYPT_XML_DATA_BLOB}
     */
    SKI{
        get {
            if(!this.HasProp("__SKI"))
                this.__SKI := CRYPT_XML_DATA_BLOB(this.ptr + 8)
            return this.__SKI
        }
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    wszSubjectName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {CRYPT_XML_DATA_BLOB}
     */
    Certificate{
        get {
            if(!this.HasProp("__Certificate"))
                this.__Certificate := CRYPT_XML_DATA_BLOB(this.ptr + 8)
            return this.__Certificate
        }
    }

    /**
     * @type {CRYPT_XML_DATA_BLOB}
     */
    CRL{
        get {
            if(!this.HasProp("__CRL"))
                this.__CRL := CRYPT_XML_DATA_BLOB(this.ptr + 8)
            return this.__CRL
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
