#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\LOGFONTW.ahk

/**
 * The ENUMLOGFONTEX structure contains information about an enumerated font. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The wingdi.h header defines ENUMLOGFONTEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-enumlogfontexw
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 * @charset Unicode
 */
class ENUMLOGFONTEXW extends Win32Struct
{
    static sizeof => 352

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure that contains values defining the font attributes.
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
     * The unique name of the font. For example, ABC Font Company TrueType Bold Italic Sans Serif.
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

    /**
     * The script, that is, the character set, of the font. For example, Cyrillic.
     * @type {String}
     */
    elfScript {
        get => StrGet(this.ptr + 284, 31, "UTF-16")
        set => StrPut(value, this.ptr + 284, 31, "UTF-16")
    }
}
