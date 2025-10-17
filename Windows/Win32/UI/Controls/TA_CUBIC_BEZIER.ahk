#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TA_TIMINGFUNCTION.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TA_CUBIC_BEZIER extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {TA_TIMINGFUNCTION}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := TA_TIMINGFUNCTION(0, this)
            return this.__header
        }
    }

    /**
     * @type {Float}
     */
    rX0 {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * @type {Float}
     */
    rY0 {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * @type {Float}
     */
    rX1 {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * @type {Float}
     */
    rY1 {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }
}
