#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Registry\HKEY.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
                this.__hKey := HKEY(this.ptr + 0)
            return this.__hKey
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszStoreDirectory{
        get {
            if(!this.HasProp("__pwszStoreDirectory"))
                this.__pwszStoreDirectory := PWSTR(this.ptr + 8)
            return this.__pwszStoreDirectory
        }
    }
}
