#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Registry\HKEY.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_REGISTRY_STORE_CLIENT_GPT_PARA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {HKEY}
     */
    hKeyBase{
        get {
            if(!this.HasProp("__hKeyBase"))
                this.__hKeyBase := HKEY(0, this)
            return this.__hKeyBase
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszRegPath {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
