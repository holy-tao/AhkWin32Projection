#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CurveAdjustments.ahk
#Include .\CurveChannel.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class ColorCurveParams extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {CurveAdjustments}
     */
    adjustment {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {CurveChannel}
     */
    channel {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    adjustValue {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
