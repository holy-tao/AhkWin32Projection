#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }
#Import ".\EXTLOGFONTW.ahk" { EXTLOGFONTW }
#Import ".\FONT_CHARSET.ahk" { FONT_CHARSET }
#Import ".\FONT_CLIP_PRECISION.ahk" { FONT_CLIP_PRECISION }
#Import ".\FONT_OUTPUT_PRECISION.ahk" { FONT_OUTPUT_PRECISION }
#Import ".\FONT_QUALITY.ahk" { FONT_QUALITY }
#Import ".\LOGFONTW.ahk" { LOGFONTW }
#Import ".\PANOSE.ahk" { PANOSE }
#Import ".\PAN_ARM_STYLE.ahk" { PAN_ARM_STYLE }
#Import ".\PAN_CONTRAST.ahk" { PAN_CONTRAST }
#Import ".\PAN_FAMILY_TYPE.ahk" { PAN_FAMILY_TYPE }
#Import ".\PAN_LETT_FORM.ahk" { PAN_LETT_FORM }
#Import ".\PAN_MIDLINE.ahk" { PAN_MIDLINE }
#Import ".\PAN_PROPORTION.ahk" { PAN_PROPORTION }
#Import ".\PAN_SERIF_STYLE.ahk" { PAN_SERIF_STYLE }
#Import ".\PAN_STROKE_VARIATION.ahk" { PAN_STROKE_VARIATION }
#Import ".\PAN_WEIGHT.ahk" { PAN_WEIGHT }
#Import ".\PAN_XHEIGHT.ahk" { PAN_XHEIGHT }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The EMREXTCREATEFONTINDIRECTW structure contains members for the CreateFontIndirect enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrextcreatefontindirectw
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMREXTCREATEFONTINDIRECTW {
    #StructPack 4

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
