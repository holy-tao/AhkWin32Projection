#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PANOSE structure describes the PANOSE font-classification values for a TrueType font. These characteristics are then used to associate the font with other fonts of similar appearance but different names.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-panose
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class PANOSE extends Win32Struct
{
    static sizeof => 10

    static packingSize => 1

    /**
     * 
     * @type {Integer}
     */
    bFamilyType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    bSerifStyle {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * 
     * @type {Integer}
     */
    bWeight {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * 
     * @type {Integer}
     */
    bProportion {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * 
     * @type {Integer}
     */
    bContrast {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    bStrokeVariation {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * 
     * @type {Integer}
     */
    bArmStyle {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * 
     * @type {Integer}
     */
    bLetterform {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * 
     * @type {Integer}
     */
    bMidline {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    bXHeight {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }
}
