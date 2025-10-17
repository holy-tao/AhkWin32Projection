#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Cryptography\CRYPT_BIT_BLOB.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class SPC_PE_IMAGE_DATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {CRYPT_BIT_BLOB}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := CRYPT_BIT_BLOB(0, this)
            return this.__Flags
        }
    }

    /**
     * @type {Pointer<SPC_LINK>}
     */
    pFile {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
