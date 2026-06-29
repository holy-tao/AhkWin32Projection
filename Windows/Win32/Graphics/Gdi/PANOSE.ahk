#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PAN_LETT_FORM.ahk" { PAN_LETT_FORM }
#Import ".\PAN_MIDLINE.ahk" { PAN_MIDLINE }
#Import ".\PAN_PROPORTION.ahk" { PAN_PROPORTION }
#Import ".\PAN_FAMILY_TYPE.ahk" { PAN_FAMILY_TYPE }
#Import ".\PAN_XHEIGHT.ahk" { PAN_XHEIGHT }
#Import ".\PAN_SERIF_STYLE.ahk" { PAN_SERIF_STYLE }
#Import ".\PAN_CONTRAST.ahk" { PAN_CONTRAST }
#Import ".\PAN_STROKE_VARIATION.ahk" { PAN_STROKE_VARIATION }
#Import ".\PAN_ARM_STYLE.ahk" { PAN_ARM_STYLE }
#Import ".\PAN_WEIGHT.ahk" { PAN_WEIGHT }

/**
 * The PANOSE structure describes the PANOSE font-classification values for a TrueType font. These characteristics are then used to associate the font with other fonts of similar appearance but different names.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-panose
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct PANOSE {
    #StructPack 8

    bFamilyType : PAN_FAMILY_TYPE

    bSerifStyle : PAN_SERIF_STYLE

    bWeight : PAN_WEIGHT

    bProportion : PAN_PROPORTION

    bContrast : PAN_CONTRAST

    bStrokeVariation : PAN_STROKE_VARIATION

    bArmStyle : PAN_ARM_STYLE

    bLetterform : PAN_LETT_FORM

    bMidline : PAN_MIDLINE

    bXHeight : PAN_XHEIGHT

}
