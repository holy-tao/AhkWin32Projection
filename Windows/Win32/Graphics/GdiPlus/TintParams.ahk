#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A TintParams structure contains members that specify the nature of a tint adjustment to a bitmap.
 * @see https://docs.microsoft.com/windows/win32/api//gdipluseffects/ns-gdipluseffects-tintparams
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class TintParams extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>INT</b>
     * 
     * Integer in the range -180 through 180 that specifies the hue to be strengthened or weakened. A value of 0 specifies blue. A positive value specifies a clockwise angle on the color wheel. For example, positive 60 specifies cyan and positive 120 specifies green. A negative value specifies a counter-clockwise angle on the color wheel. For example, negative 60 specifies magenta and negative 120 specifies red.
     * @type {Integer}
     */
    hue {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>INT</b>
     * 
     * Integer in the range -100 through 100 that specifies how much the hue (given by the <b>hue</b> parameter) is strengthened or weakened. A value of 0 specifies no change. Positive values specify that the hue is strengthened and negative values specify that the hue is weakened.
     * @type {Integer}
     */
    amount {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
