#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct ColorLUTParams {
    #StructPack 1

    lutB : Int8[256]

    lutG : Int8[256]

    lutR : Int8[256]

    lutA : Int8[256]

}
