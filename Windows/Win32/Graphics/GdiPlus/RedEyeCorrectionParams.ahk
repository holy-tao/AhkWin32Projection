#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A RedEyeCorrectionParams structure contains members that specify the areas of a bitmap to which a red-eye correction is applied.
 * @see https://docs.microsoft.com/windows/win32/api//gdipluseffects/ns-gdipluseffects-redeyecorrectionparams
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class RedEyeCorrectionParams extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>UINT</b>
     * 
     * Integer that specifies the number of <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structures in the <b>areas</b> array.
     * @type {Integer}
     */
    numberOfAreas {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>RECT*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structures, each of which specifies an area of the bitmap to which red eye correction should be applied.
     * @type {Pointer<RECT>}
     */
    areas {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
