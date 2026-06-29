#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct UNIFM_HDR {
    #StructPack 4

    dwSize : UInt32

    dwVersion : UInt32

    ulDefaultCodepage : UInt32

    lGlyphSetDataRCID : Int32

    loUnidrvInfo : UInt32

    loIFIMetrics : UInt32

    loExtTextMetric : UInt32

    loWidthTable : UInt32

    loKernPair : UInt32

    dwReserved : UInt32[2]

}
