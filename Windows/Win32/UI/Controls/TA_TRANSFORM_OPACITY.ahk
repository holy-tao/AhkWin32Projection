#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TA_TRANSFORM.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TA_TRANSFORM_OPACITY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {TA_TRANSFORM}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := TA_TRANSFORM(0, this)
            return this.__header
        }
    }

    /**
     * @type {Float}
     */
    rOpacity {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * @type {Float}
     */
    rInitialOpacity {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }
}
