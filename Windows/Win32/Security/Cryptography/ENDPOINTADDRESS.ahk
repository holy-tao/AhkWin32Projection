#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
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
     * @type {PWSTR}
     */
    serviceUrl{
        get {
            if(!this.HasProp("__serviceUrl"))
                this.__serviceUrl := PWSTR(this.ptr + 0)
            return this.__serviceUrl
        }
    }

    /**
     * @type {PWSTR}
     */
    policyUrl{
        get {
            if(!this.HasProp("__policyUrl"))
                this.__policyUrl := PWSTR(this.ptr + 8)
            return this.__policyUrl
        }
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
