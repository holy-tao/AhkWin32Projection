#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WCRANGE structure specifies a range of Unicode characters.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-wcrange
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct WCRANGE {
    #StructPack 2

    /**
     * Low Unicode code point in the range of supported Unicode code points.
     */
    wcLow : Int8

    /**
     * Number of supported Unicode code points in this range.
     */
    cGlyphs : UInt16

}
