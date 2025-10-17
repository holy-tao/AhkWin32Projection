#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_KEY_PROV_INFO.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_CHAIN extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cCerts {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<CRYPT_INTEGER_BLOB>}
     */
    certs {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {CRYPT_KEY_PROV_INFO}
     */
    keyLocatorInfo{
        get {
            if(!this.HasProp("__keyLocatorInfo"))
                this.__keyLocatorInfo := CRYPT_KEY_PROV_INFO(16, this)
            return this.__keyLocatorInfo
        }
    }
}
