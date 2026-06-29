#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PAN_LETT_FORM.ahk" { PAN_LETT_FORM }
#Import ".\EMR.ahk" { EMR }
#Import ".\FONT_CLIP_PRECISION.ahk" { FONT_CLIP_PRECISION }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }
#Import ".\PAN_MIDLINE.ahk" { PAN_MIDLINE }
#Import ".\PAN_PROPORTION.ahk" { PAN_PROPORTION }
#Import ".\FONT_QUALITY.ahk" { FONT_QUALITY }
#Import ".\LOGFONTW.ahk" { LOGFONTW }
#Import ".\PANOSE.ahk" { PANOSE }
#Import ".\PAN_FAMILY_TYPE.ahk" { PAN_FAMILY_TYPE }
#Import ".\PAN_XHEIGHT.ahk" { PAN_XHEIGHT }
#Import ".\FONT_OUTPUT_PRECISION.ahk" { FONT_OUTPUT_PRECISION }
#Import ".\FONT_CHARSET.ahk" { FONT_CHARSET }
#Import ".\PAN_SERIF_STYLE.ahk" { PAN_SERIF_STYLE }
#Import ".\PAN_CONTRAST.ahk" { PAN_CONTRAST }
#Import ".\EXTLOGFONTW.ahk" { EXTLOGFONTW }
#Import ".\PAN_STROKE_VARIATION.ahk" { PAN_STROKE_VARIATION }
#Import ".\PAN_ARM_STYLE.ahk" { PAN_ARM_STYLE }
#Import ".\PAN_WEIGHT.ahk" { PAN_WEIGHT }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The EMREXTCREATEFONTINDIRECTW structure contains members for the CreateFontIndirect enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrextcreatefontindirectw
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMREXTCREATEFONTINDIRECTW {
    #StructPack 8

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * Index to the font in handle table.
     */
    ihFont : UInt32

    /**
     * Logical font.
     */
    elfw : EXTLOGFONTW

}
