#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DWRITE_UNICODE_RANGE structure specifies the range of Unicode code points.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_unicode_range
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_UNICODE_RANGE {
    #StructPack 4

    /**
     * The first code point in the Unicode range.
     */
    first : UInt32

    /**
     * The last code point in the Unicode range.
     */
    last : UInt32

}
