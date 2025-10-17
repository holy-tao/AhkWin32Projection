#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\Effect.ahk

/**
 * The HueSaturationLightness class enables you to change the hue, saturation, and lightness of a bitmap.
 * @see https://docs.microsoft.com/windows/win32/api//gdipluseffects/nl-gdipluseffects-huesaturationlightness
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class HueSaturationLightness extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Effect}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := Effect(0, this)
            return this.__Base
        }
    }
}
