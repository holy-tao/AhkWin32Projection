#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_RATING_PINRESET {
    #StructPack 1

    bPinLength : Int8

    argbNewPin : Int8[1]

}
