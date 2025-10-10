#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SharpenParams structure contains members that specify the nature of a sharpening adjustment to a bitmap.
 * @see https://docs.microsoft.com/windows/win32/api//gdipluseffects/ns-gdipluseffects-sharpenparams
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class SharpenParams extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>REAL</b>
     * 
     * Real number that specifies the sharpening radius (the radius of the convolution kernel) in pixels. The radius must be in the range 0 through 255. As the radius increases, more surrounding pixels are involved in calculating the new value of a given pixel.
     * @type {Float}
     */
    radius {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: <b>REAL</b>
     * 
     * Real number in the range 0 through 100 that specifies the amount of sharpening to be applied. A value of 0 specifies no sharpening. As the value of <b>amount</b> increases, the sharpness increases.
     * @type {Float}
     */
    amount {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
