#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PAN_FAMILY_TYPE.ahk
#Include .\PAN_SERIF_STYLE.ahk
#Include .\PAN_WEIGHT.ahk
#Include .\PAN_PROPORTION.ahk
#Include .\PAN_CONTRAST.ahk
#Include .\PAN_STROKE_VARIATION.ahk
#Include .\PAN_ARM_STYLE.ahk
#Include .\PAN_LETT_FORM.ahk
#Include .\PAN_MIDLINE.ahk
#Include .\PAN_XHEIGHT.ahk

/**
 * The PANOSE structure describes the PANOSE font-classification values for a TrueType font. These characteristics are then used to associate the font with other fonts of similar appearance but different names.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-panose
 * @namespace Windows.Win32.Graphics.Gdi
 */
class PANOSE extends Win32Struct {
    static sizeof => 10

    static packingSize => 1

    /**
     * @type {PAN_FAMILY_TYPE}
     */
    bFamilyType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {PAN_SERIF_STYLE}
     */
    bSerifStyle {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {PAN_WEIGHT}
     */
    bWeight {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {PAN_PROPORTION}
     */
    bProportion {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {PAN_CONTRAST}
     */
    bContrast {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {PAN_STROKE_VARIATION}
     */
    bStrokeVariation {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {PAN_ARM_STYLE}
     */
    bArmStyle {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {PAN_LETT_FORM}
     */
    bLetterform {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * @type {PAN_MIDLINE}
     */
    bMidline {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {PAN_XHEIGHT}
     */
    bXHeight {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }
}
