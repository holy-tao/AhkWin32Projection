#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include .\ENHANCED_METAFILE_RECORD_TYPE.ahk
#Include .\EXTLOGFONTW.ahk
#Include .\LOGFONTW.ahk
#Include .\FONT_CHARSET.ahk
#Include .\FONT_OUTPUT_PRECISION.ahk
#Include .\FONT_CLIP_PRECISION.ahk
#Include .\FONT_QUALITY.ahk
#Include .\PANOSE.ahk
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
 * The EMREXTCREATEFONTINDIRECTW structure contains members for the CreateFontIndirect enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrextcreatefontindirectw
 * @namespace Windows.Win32.Graphics.Gdi
 */
class EMREXTCREATEFONTINDIRECTW extends Win32Struct {
    static sizeof => 332

    static packingSize => 4

    /**
     * The base structure for all record types.
     * @type {EMR}
     */
    emr {
        get {
            if(!this.HasProp("__emr"))
                this.__emr := EMR(0, this)
            return this.__emr
        }
    }

    /**
     * Index to the font in handle table.
     * @type {Integer}
     */
    ihFont {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Logical font.
     * @type {EXTLOGFONTW}
     */
    elfw {
        get {
            if(!this.HasProp("__elfw"))
                this.__elfw := EXTLOGFONTW(12, this)
            return this.__elfw
        }
    }
}
