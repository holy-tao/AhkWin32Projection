#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The COLORADJUSTMENT structure defines the color adjustment values used by the StretchBlt and StretchDIBits functions when the stretch mode is HALFTONE. You can set the color adjustment values by calling the SetColorAdjustment function.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-coloradjustment
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class COLORADJUSTMENT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 2

    /**
     * The size, in bytes, of the structure.
     * @type {Integer}
     */
    caSize {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    caFlags {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * 
     * @type {Integer}
     */
    caIlluminantIndex {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Specifies the <i>n</i><sup>th</sup> power gamma-correction value for the red primary of the source colors. The value must be in the range from 2500 to 65,000. A value of 10,000 means no gamma correction.
     * @type {Integer}
     */
    caRedGamma {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Specifies the <i>n</i><sup>th</sup> power gamma-correction value for the green primary of the source colors. The value must be in the range from 2500 to 65,000. A value of 10,000 means no gamma correction.
     * @type {Integer}
     */
    caGreenGamma {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Specifies the <i>n</i><sup>th</sup> power gamma-correction value for the blue primary of the source colors. The value must be in the range from 2500 to 65,000. A value of 10,000 means no gamma correction.
     * @type {Integer}
     */
    caBlueGamma {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * The black reference for the source colors. Any colors that are darker than this are treated as black. The value must be in the range from 0 to 4000.
     * @type {Integer}
     */
    caReferenceBlack {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * The white reference for the source colors. Any colors that are lighter than this are treated as white. The value must be in the range from 6000 to 10,000.
     * @type {Integer}
     */
    caReferenceWhite {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * The amount of contrast to be applied to the source object. The value must be in the range from -100 to 100. A value of 0 means no contrast adjustment.
     * @type {Integer}
     */
    caContrast {
        get => NumGet(this, 16, "short")
        set => NumPut("short", value, this, 16)
    }

    /**
     * The amount of brightness to be applied to the source object. The value must be in the range from -100 to 100. A value of 0 means no brightness adjustment.
     * @type {Integer}
     */
    caBrightness {
        get => NumGet(this, 18, "short")
        set => NumPut("short", value, this, 18)
    }

    /**
     * The amount of colorfulness to be applied to the source object. The value must be in the range from -100 to 100. A value of 0 means no colorfulness adjustment.
     * @type {Integer}
     */
    caColorfulness {
        get => NumGet(this, 20, "short")
        set => NumPut("short", value, this, 20)
    }

    /**
     * The amount of red or green tint adjustment to be applied to the source object. The value must be in the range from -100 to 100. Positive numbers adjust toward red and negative numbers adjust toward green. Zero means no tint adjustment.
     * @type {Integer}
     */
    caRedGreenTint {
        get => NumGet(this, 22, "short")
        set => NumPut("short", value, this, 22)
    }
}
