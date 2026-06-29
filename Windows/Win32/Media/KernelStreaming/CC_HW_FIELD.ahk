#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VBICODECFILTERING_SCANLINES.ahk" { VBICODECFILTERING_SCANLINES }
#Import ".\CC_BYTE_PAIR.ahk" { CC_BYTE_PAIR }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct CC_HW_FIELD {
    #StructPack 8

    ScanlinesRequested : VBICODECFILTERING_SCANLINES

    fieldFlags : UInt32

    PictureNumber : Int64

    Lines : CC_BYTE_PAIR[12]

}
