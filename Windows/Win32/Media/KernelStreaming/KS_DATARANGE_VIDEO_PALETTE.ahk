#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_VIDEO_STREAM_CONFIG_CAPS.ahk" { KS_VIDEO_STREAM_CONFIG_CAPS }
#Import ".\KS_VIDEOINFO.ahk" { KS_VIDEOINFO }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\KS_RGBQUAD.ahk" { KS_RGBQUAD }
#Import ".\KS_BITMAPINFOHEADER.ahk" { KS_BITMAPINFOHEADER }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSDATAFORMAT.ahk" { KSDATAFORMAT }
#Import ".\KS_TRUECOLORINFO.ahk" { KS_TRUECOLORINFO }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_DATARANGE_VIDEO_PALETTE {
    #StructPack 8

    DataRange : KSDATAFORMAT

    bFixedSizeSamples : BOOL

    bTemporalCompression : BOOL

    StreamDescriptionFlags : UInt32

    MemoryAllocationFlags : UInt32

    ConfigCaps : KS_VIDEO_STREAM_CONFIG_CAPS

    VideoInfo : KS_VIDEOINFO

}
