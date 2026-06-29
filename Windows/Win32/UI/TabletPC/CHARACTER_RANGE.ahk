#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a range of Unicode points (characters).
 * @see https://learn.microsoft.com/windows/win32/api/rectypes/ns-rectypes-character_range
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct CHARACTER_RANGE {
    #StructPack 2

    /**
     * The low Unicode code point in the range of supported Unicode points.
     */
    wcLow : Int8

    /**
     * The number of supported Unicode points in this range.
     */
    cChars : UInt16

}
