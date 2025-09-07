#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_OTHER_NAME extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    pszObjId{
        get {
            if(!this.HasProp("__pszObjId"))
                this.__pszObjId := PSTR(this.ptr + 0)
            return this.__pszObjId
        }
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    Value{
        get {
            if(!this.HasProp("__Value"))
                this.__Value := CRYPT_INTEGER_BLOB(this.ptr + 8)
            return this.__Value
        }
    }
}
