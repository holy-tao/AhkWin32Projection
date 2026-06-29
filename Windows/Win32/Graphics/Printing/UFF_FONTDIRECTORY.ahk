#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct UFF_FONTDIRECTORY {
    #StructPack 4

    dwSignature : UInt32

    wSize : UInt16

    wFontID : UInt16

    sGlyphID : Int16

    wFlags : UInt16

    dwInstallerSig : UInt32

    offFontName : UInt32

    offCartridgeName : UInt32

    offFontData : UInt32

    offGlyphData : UInt32

    offVarData : UInt32

}
