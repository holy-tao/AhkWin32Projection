#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The TTVALIDATIONTESTSPARAMSEX structure contains parameters for testing a Microsoft OpenType font.
 * @see https://learn.microsoft.com/windows/win32/api/t2embapi/ns-t2embapi-ttvalidationtestsparamsex
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct TTVALIDATIONTESTSPARAMSEX {
    #StructPack 8

    /**
     * Size, in bytes, of this structure. The client should set this value to <b>sizeof</b>(TTVALIDATIONTESTSPARAMSEX).
     */
    ulStructSize : UInt32

    /**
     * First character point size to test. This value is the smallest font size (lower bound) of the font sizes to test.
     */
    lTestFromSize : Int32

    /**
     * Last character point size to test. This value is the largest font size (upper bound) to test.
     */
    lTestToSize : Int32

    ulCharSet : UInt32

    /**
     * Currently not used.
     */
    usReserved1 : UInt16

    /**
     * If zero, test over all glyphs.
     */
    usCharCodeCount : UInt16

    /**
     * Pointer to array of UCS-4 characters.
     */
    pulCharCodeSet : IntPtr

}
