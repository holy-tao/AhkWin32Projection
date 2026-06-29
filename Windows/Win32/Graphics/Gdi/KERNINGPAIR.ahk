#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The KERNINGPAIR structure defines a kerning pair.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-kerningpair
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct KERNINGPAIR {
    #StructPack 4

    /**
     * The character code for the first character in the kerning pair.
     */
    wFirst : UInt16

    /**
     * The character code for the second character in the kerning pair.
     */
    wSecond : UInt16

    /**
     * The amount this pair will be kerned if they appear side by side in the same font and size. This value is typically negative, because pair kerning usually results in two characters being set more tightly than normal. The value is specified in logical units; that is, it depends on the current mapping mode.
     */
    iKernAmount : Int32

}
