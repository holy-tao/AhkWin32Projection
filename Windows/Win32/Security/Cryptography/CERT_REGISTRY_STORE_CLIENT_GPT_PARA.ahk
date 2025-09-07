#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Registry\HKEY.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
                this.__hKeyBase := HKEY(this.ptr + 0)
            return this.__hKeyBase
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszRegPath{
        get {
            if(!this.HasProp("__pwszRegPath"))
                this.__pwszRegPath := PWSTR(this.ptr + 8)
            return this.__pwszRegPath
        }
    }
}
