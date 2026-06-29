#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct CUSTOMSIZEPARAM {
    #StructPack 4

    dwOrder : Int32

    lMinVal : Int32

    lMaxVal : Int32

}
