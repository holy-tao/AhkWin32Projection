#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Cryptography\CRYPT_INTEGER_BLOB.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class CAT_NAMEVALUE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<Ptr>}
     */
    pwszTag {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    fdwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    Value{
        get {
            if(!this.HasProp("__Value"))
                this.__Value := CRYPT_INTEGER_BLOB(this.ptr + 16)
            return this.__Value
        }
    }
}
