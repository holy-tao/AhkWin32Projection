#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\LOGFONTW.ahk

/**
 * The ENUMLOGFONT structure defines the attributes of a font, the complete name of a font, and the style of a font. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The wingdi.h header defines ENUMLOGFONT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-enumlogfontw
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 * @charset Unicode
 */
class ENUMLOGFONTW extends Win32Struct
{
    static sizeof => 288

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure that defines the attributes of a font.
     * @type {LOGFONTW}
     */
    elfLogFont{
        get {
            if(!this.HasProp("__elfLogFont"))
                this.__elfLogFont := LOGFONTW(0, this)
            return this.__elfLogFont
        }
    }

    /**
     * A unique name for the font. For example, ABCD Font Company TrueType Bold Italic Sans Serif.
     * @type {String}
     */
    elfFullName {
        get => StrGet(this.ptr + 92, 63, "UTF-16")
        set => StrPut(value, this.ptr + 92, 63, "UTF-16")
    }

    /**
     * The style of the font. For example, Bold Italic.
     * @type {String}
     */
    elfStyle {
        get => StrGet(this.ptr + 220, 31, "UTF-16")
        set => StrPut(value, this.ptr + 220, 31, "UTF-16")
    }
}
