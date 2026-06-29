#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct XSAVE_AREA_HEADER {
    #StructPack 8

    Mask : Int64

    CompactionMask : Int64

    Reserved2 : Int64[6]

}
