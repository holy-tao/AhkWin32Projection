#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Cryptography\CRYPT_INTEGER_BLOB.ahk
#Include .\SPC_SERIALIZED_OBJECT.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class SPC_LINK extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwLinkChoice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pwszUrl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
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
     * @type {Pointer<PWSTR>}
     */
    pwszFile {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
