#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\Graphics\Gdi\NEWTEXTMETRICA.ahk
#Include .\FONTSIGNATURE.ahk

/**
 * The NEWTEXTMETRICEX structure contains information about a physical font. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The wingdi.h header defines NEWTEXTMETRICEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-newtextmetricexa
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 * @charset ANSI
 */
class NEWTEXTMETRICEXA extends Win32Struct
{
    static sizeof => 96

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-newtextmetrica">NEWTEXTMETRIC</a> structure.
     * @type {NEWTEXTMETRICA}
     */
    ntmTm{
        get {
            if(!this.HasProp("__ntmTm"))
                this.__ntmTm := NEWTEXTMETRICA(0, this)
            return this.__ntmTm
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-fontsignature">FONTSIGNATURE</a> structure indicating the coverage of the font.
     * @type {FONTSIGNATURE}
     */
    ntmFontSig{
        get {
            if(!this.HasProp("__ntmFontSig"))
                this.__ntmFontSig := FONTSIGNATURE(72, this)
            return this.__ntmFontSig
        }
    }
}
