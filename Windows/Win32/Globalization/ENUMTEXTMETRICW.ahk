#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\Graphics\Gdi\NEWTEXTMETRICW.ahk
#Include .\FONTSIGNATURE.ahk
#Include .\NEWTEXTMETRICEXW.ahk
#Include ..\Graphics\Gdi\AXISINFOW.ahk
#Include ..\Graphics\Gdi\AXESLISTW.ahk

/**
 * The ENUMTEXTMETRIC structure contains information about a physical font.
 * @remarks
 * 
  * <b>ENUMTEXTMETRIC</b> is an extension of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-newtextmetricexa">NEWTEXTMETRICEX</a> that includes the axis information for a multiple master font.
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumfontsa">EnumFonts</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumfontfamiliesa">EnumFontFamilies</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumfontfamiliesexa">EnumFontFamiliesEx</a> functions have been modified to return pointers to the <b>ENUMTEXTMETRIC</b> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-enumlogfontexdva">ENUMLOGFONTEXDV</a> structures.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The wingdi.h header defines ENUMTEXTMETRIC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-enumtextmetricw
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 * @charset Unicode
 */
class ENUMTEXTMETRICW extends Win32Struct
{
    static sizeof => 240

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-newtextmetricexa">NEWTEXTMETRICEX</a> structure, containing information about a physical font.
     * @type {NEWTEXTMETRICEXW}
     */
    etmNewTextMetricEx{
        get {
            if(!this.HasProp("__etmNewTextMetricEx"))
                this.__etmNewTextMetricEx := NEWTEXTMETRICEXW(this.ptr + 0)
            return this.__etmNewTextMetricEx
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-axeslista">AXESLIST</a> structure, containing information about the axes for the font. This is only used for multiple master fonts.
     * @type {AXESLISTW}
     */
    etmAxesList{
        get {
            if(!this.HasProp("__etmAxesList"))
                this.__etmAxesList := AXESLISTW(this.ptr + 104)
            return this.__etmAxesList
        }
    }
}
