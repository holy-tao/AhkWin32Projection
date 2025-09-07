#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TA_TRANSFORM.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TA_TRANSFORM_CLIP extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {TA_TRANSFORM}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := TA_TRANSFORM(this.ptr + 0)
            return this.__header
        }
    }

    /**
     * @type {Float}
     */
    rLeft {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * @type {Float}
     */
    rTop {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * @type {Float}
     */
    rRight {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }

    /**
     * @type {Float}
     */
    rBottom {
        get => NumGet(this, 32, "float")
        set => NumPut("float", value, this, 32)
    }

    /**
     * @type {Float}
     */
    rInitialLeft {
        get => NumGet(this, 36, "float")
        set => NumPut("float", value, this, 36)
    }

    /**
     * @type {Float}
     */
    rInitialTop {
        get => NumGet(this, 40, "float")
        set => NumPut("float", value, this, 40)
    }

    /**
     * @type {Float}
     */
    rInitialRight {
        get => NumGet(this, 44, "float")
        set => NumPut("float", value, this, 44)
    }

    /**
     * @type {Float}
     */
    rInitialBottom {
        get => NumGet(this, 48, "float")
        set => NumPut("float", value, this, 48)
    }
}
