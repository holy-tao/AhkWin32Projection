#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CERT_ISSUER_SERIAL_NUMBER.ahk

/**
 * Is used as a flexible means of uniquely identifying a certificate.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_id
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_ID extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    dwIdChoice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {CERT_ISSUER_SERIAL_NUMBER}
     */
    IssuerSerialNumber{
        get {
            if(!this.HasProp("__IssuerSerialNumber"))
                this.__IssuerSerialNumber := CERT_ISSUER_SERIAL_NUMBER(8, this)
            return this.__IssuerSerialNumber
        }
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    KeyId{
        get {
            if(!this.HasProp("__KeyId"))
                this.__KeyId := CRYPT_INTEGER_BLOB(8, this)
            return this.__KeyId
        }
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    HashId{
        get {
            if(!this.HasProp("__HashId"))
                this.__HashId := CRYPT_INTEGER_BLOB(8, this)
            return this.__HashId
        }
    }
}
