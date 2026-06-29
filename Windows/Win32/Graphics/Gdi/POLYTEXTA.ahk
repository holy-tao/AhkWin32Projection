#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The POLYTEXT structure describes how the PolyTextOut function should draw a string of text. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The wingdi.h header defines POLYTEXT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-polytexta
 * @namespace Windows.Win32.Graphics.Gdi
 * @charset ANSI
 */
export default struct POLYTEXTA {
    #StructPack 8

    /**
     * The horizontal reference point for the string. The string is aligned to this point using the current text-alignment mode.
     */
    x : Int32

    /**
     * The vertical reference point for the string. The string is aligned to this point using the current text-alignment mode.
     */
    y : Int32

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/gdi/specifying-length-of-text-output-string">length of the string</a> pointed to by <b>lpstr</b>.
     */
    n : UInt32

    /**
     * Pointer to a string of text to be drawn by the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-polytextouta">PolyTextOut</a> function. This string need not be null-terminated, since <b>n</b> specifies the length of the string.
     */
    lpstr : PSTR

    uiFlags : UInt32

    /**
     * A rectangle structure that contains the dimensions of the opaquing or clipping rectangle. This member is ignored if neither of the ETO_OPAQUE nor the ETO_CLIPPED value is specified for the <b>uiFlags</b> member.
     */
    rcl : RECT

    /**
     * Pointer to an array containing the width value for each character in the string.
     */
    pdx : IntPtr

}
