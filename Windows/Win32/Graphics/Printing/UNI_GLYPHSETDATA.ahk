#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct UNI_GLYPHSETDATA {
    #StructPack 4

    dwSize : UInt32

    dwVersion : UInt32

    dwFlags : UInt32

    lPredefinedID : Int32

    dwGlyphCount : UInt32

    dwRunCount : UInt32

    loRunOffset : UInt32

    dwCodePageCount : UInt32

    loCodePageOffset : UInt32

    loMapTableOffset : UInt32

    dwReserved : UInt32[2]

}
