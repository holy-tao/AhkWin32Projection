#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\LOGFONTW.ahk
#Include .\ENUMLOGFONTEXW.ahk
#Include .\DESIGNVECTOR.ahk

/**
 * The ENUMLOGFONTEXDV structure contains the information used to create a font.
 * @remarks
 * 
 * The actual size of <b>ENUMLOGFONTEXDV</b> depends on that of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-designvector">DESIGNVECTOR</a>, which, in turn depends on its <b>dvNumAxes</b> member.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumfontsa">EnumFonts</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumfontfamiliesa">EnumFontFamilies</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumfontfamiliesexa">EnumFontFamiliesEx</a> functions have been modified to return pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-enumtextmetrica">ENUMTEXTMETRIC</a> and <b>ENUMLOGFONTEXDV</b> to the callback function.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wingdi.h header defines ENUMLOGFONTEXDV as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-enumlogfontexdvw
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 * @charset Unicode
 */
class ENUMLOGFONTEXDVW extends Win32Struct
{
    static sizeof => 424

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-enumlogfontexa">ENUMLOGFONTEX</a> structure that contains information about the logical attributes of the font.
     * @type {ENUMLOGFONTEXW}
     */
    elfEnumLogfontEx{
        get {
            if(!this.HasProp("__elfEnumLogfontEx"))
                this.__elfEnumLogfontEx := ENUMLOGFONTEXW(0, this)
            return this.__elfEnumLogfontEx
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-designvector">DESIGNVECTOR</a> structure. This is zero-filled unless the font described is a multiple master OpenType font.
     * @type {DESIGNVECTOR}
     */
    elfDesignVector{
        get {
            if(!this.HasProp("__elfDesignVector"))
                this.__elfDesignVector := DESIGNVECTOR(352, this)
            return this.__elfDesignVector
        }
    }
}
