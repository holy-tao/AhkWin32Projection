#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DVD_ATR {
    #StructPack 4

    ulCAT : UInt32

    pbATRI : Int8[768]

}
