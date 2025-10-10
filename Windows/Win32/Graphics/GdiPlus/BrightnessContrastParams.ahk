#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A BrightnessContrastParams structure contains members that specify the nature of a brightness or contrast adjustment.
 * @see https://docs.microsoft.com/windows/win32/api//gdipluseffects/ns-gdipluseffects-brightnesscontrastparams
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class BrightnessContrastParams extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>INT</b>
     * 
     * Integer in the range -255 through 255 that specifies the brightness level. If the value is 0, the brightness remains the same. As the value moves from 0 to 255, the brightness of the image increases. As the value moves from 0 to -255, the brightness of the image decreases.
     * @type {Integer}
     */
    brightnessLevel {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>INT</b>
     * 
     * Integer in the range -100 through 100 that specifies the contrast level. If the value is 0, the contrast remains the same. As the value moves from 0 to 100, the contrast of the image increases. As the value moves from 0 to -100, the contrast of the image decreases.
     * @type {Integer}
     */
    contrastLevel {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
