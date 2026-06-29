#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct Mpeg2TableSampleHdr {
    #StructPack 4

    SectionCount : Int8

    Reserved : Int8[3]

    SectionOffsets : Int32[1]

}
