#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct PELARRAY {
    #StructPack 4

    paXCount : Int32

    paYCount : Int32

    paXExt : Int32

    paYExt : Int32

    paRGBs : Int8

}
