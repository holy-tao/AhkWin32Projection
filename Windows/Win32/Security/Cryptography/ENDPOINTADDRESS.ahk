#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class ENDPOINTADDRESS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<Ptr>}
     */
    serviceUrl {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    policyUrl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    rawCertificate{
        get {
            if(!this.HasProp("__rawCertificate"))
                this.__rawCertificate := CRYPT_INTEGER_BLOB(this.ptr + 16)
            return this.__rawCertificate
        }
    }
}
