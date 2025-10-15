#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class INFORMATIONCARD_ASYMMETRIC_CRYPTO_PARAMETERS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    keySize {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    keyExchangeAlgorithm{
        get {
            if(!this.HasProp("__keyExchangeAlgorithm"))
                this.__keyExchangeAlgorithm := PWSTR(this.ptr + 8)
            return this.__keyExchangeAlgorithm
        }
    }

    /**
     * @type {PWSTR}
     */
    signatureAlgorithm{
        get {
            if(!this.HasProp("__signatureAlgorithm"))
                this.__signatureAlgorithm := PWSTR(this.ptr + 16)
            return this.__signatureAlgorithm
        }
    }
}
