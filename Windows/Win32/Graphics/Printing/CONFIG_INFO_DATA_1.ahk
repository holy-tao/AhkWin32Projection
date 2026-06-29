#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct CONFIG_INFO_DATA_1 {
    #StructPack 4

    Reserved : Int8[128]

    dwVersion : UInt32

}
