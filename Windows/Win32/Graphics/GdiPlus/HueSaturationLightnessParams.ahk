#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The HueSaturationLightnessParams structure contains members that specify hue, saturation and lightness adjustments to a bitmap.
 * @see https://docs.microsoft.com/windows/win32/api//gdipluseffects/ns-gdipluseffects-huesaturationlightnessparams
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class HueSaturationLightnessParams extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b>INT</b>
     * 
     * Integer in the range -180 through 180 that specifies the change in hue. A value of 0 specifies no change. Positive values specify counterclockwise rotation on the color wheel. Negative values specify clockwise rotation on the color wheel.
     * @type {Integer}
     */
    hueLevel {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>INT</b>
     * 
     * Integer in the range -100 through 100 that specifies the change in saturation. A value of 0 specifies no change. Positive values specify increased saturation and negative values specify decreased saturation.
     * @type {Integer}
     */
    saturationLevel {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>INT</b>
     * 
     * Integer in the range -100 through 100 that specifies the change in lightness. A value of 0 specifies no change. Positive values specify increased lightness and negative values specify decreased lightness.
     * @type {Integer}
     */
    lightnessLevel {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
