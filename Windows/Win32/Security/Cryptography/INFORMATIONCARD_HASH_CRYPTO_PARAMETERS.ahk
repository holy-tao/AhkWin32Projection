#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\INFORMATIONCARD_TRANSFORM_CRYPTO_PARAMETERS.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class INFORMATIONCARD_HASH_CRYPTO_PARAMETERS extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    hashSize {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {INFORMATIONCARD_TRANSFORM_CRYPTO_PARAMETERS}
     */
    transform{
        get {
            if(!this.HasProp("__transform"))
                this.__transform := INFORMATIONCARD_TRANSFORM_CRYPTO_PARAMETERS(4, this)
            return this.__transform
        }
    }
}
