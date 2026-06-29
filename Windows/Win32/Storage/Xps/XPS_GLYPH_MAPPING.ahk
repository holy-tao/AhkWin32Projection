#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a glyph-to-index mapping.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_mapping
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct XPS_GLYPH_MAPPING {
    #StructPack 4

    /**
     * Index of the first Unicode character in the mapping string.
     */
    unicodeStringStart : UInt32

    /**
     * Number of characters in the mapping string.
     */
    unicodeStringLength : UInt16

    /**
     * The glyph array's first  index that corresponds to <b>unicodeStringStart</b>.
     */
    glyphIndicesStart : UInt32

    /**
     * Length of index mapping.
     */
    glyphIndicesLength : UInt16

}
