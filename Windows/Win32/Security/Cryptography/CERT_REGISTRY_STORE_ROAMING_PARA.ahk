#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Registry\HKEY.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_REGISTRY_STORE_ROAMING_PARA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {HKEY}
     */
    hKey{
        get {
            if(!this.HasProp("__hKey"))
                this.__hKey := HKEY(0, this)
            return this.__hKey
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszStoreDirectory {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
