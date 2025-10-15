#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class INFORMATIONCARD_TRANSFORM_CRYPTO_PARAMETERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    inputBlockSize {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    outputBlockSize {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {BOOL}
     */
    canTransformMultipleBlocks{
        get {
            if(!this.HasProp("__canTransformMultipleBlocks"))
                this.__canTransformMultipleBlocks := BOOL(this.ptr + 8)
            return this.__canTransformMultipleBlocks
        }
    }

    /**
     * @type {BOOL}
     */
    canReuseTransform{
        get {
            if(!this.HasProp("__canReuseTransform"))
                this.__canReuseTransform := BOOL(this.ptr + 12)
            return this.__canReuseTransform
        }
    }
}
