#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_VBIINFOHEADER.ahk" { KS_VBIINFOHEADER }
#Import ".\KS_TVTUNER_CHANGE_INFO.ahk" { KS_TVTUNER_CHANGE_INFO }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_VBI_FRAME_INFO {
    #StructPack 8

    ExtendedHeaderSize : UInt32

    dwFrameFlags : UInt32

    PictureNumber : Int64

    DropCount : Int64

    dwSamplingFrequency : UInt32

    TvTunerChangeInfo : KS_TVTUNER_CHANGE_INFO

    VBIInfoHeader : KS_VBIINFOHEADER

}
