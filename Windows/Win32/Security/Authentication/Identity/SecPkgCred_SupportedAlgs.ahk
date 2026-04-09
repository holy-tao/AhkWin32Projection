#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\Cryptography\ALG_ID.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SecPkgCred_SupportedAlgs extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cSupportedAlgs {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<ALG_ID>}
     */
    palgSupportedAlgs {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
