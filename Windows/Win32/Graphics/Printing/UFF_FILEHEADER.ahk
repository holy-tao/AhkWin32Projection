#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct UFF_FILEHEADER {
    #StructPack 4

    dwSignature : UInt32

    dwVersion : UInt32

    dwSize : UInt32

    nFonts : UInt32

    nGlyphSets : UInt32

    nVarData : UInt32

    offFontDir : UInt32

    dwFlags : UInt32

    dwReserved : UInt32[4]

}
