#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DVAudInfo {
    #StructPack 2

    bAudStyle : Int8[2]

    bAudQu : Int8[2]

    bNumAudPin : Int8

    wAvgSamplesPerPinPerFrm : UInt16[2]

    wBlkMode : UInt16

    wDIFMode : UInt16

    wBlkDiv : UInt16

}
