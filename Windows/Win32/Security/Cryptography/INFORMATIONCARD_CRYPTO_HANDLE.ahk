#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HandleType.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class INFORMATIONCARD_CRYPTO_HANDLE extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {HandleType}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    expiration {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    cryptoParameters {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
