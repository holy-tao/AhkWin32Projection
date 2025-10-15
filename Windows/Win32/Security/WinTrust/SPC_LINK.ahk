#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\Cryptography\CRYPT_INTEGER_BLOB.ahk
#Include .\SPC_SERIALIZED_OBJECT.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class SPC_LINK extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwLinkChoice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pwszUrl{
        get {
            if(!this.HasProp("__pwszUrl"))
                this.__pwszUrl := PWSTR(this.ptr + 8)
            return this.__pwszUrl
        }
    }

    /**
     * @type {SPC_SERIALIZED_OBJECT}
     */
    Moniker{
        get {
            if(!this.HasProp("__Moniker"))
                this.__Moniker := SPC_SERIALIZED_OBJECT(this.ptr + 8)
            return this.__Moniker
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszFile{
        get {
            if(!this.HasProp("__pwszFile"))
                this.__pwszFile := PWSTR(this.ptr + 8)
            return this.__pwszFile
        }
    }
}
