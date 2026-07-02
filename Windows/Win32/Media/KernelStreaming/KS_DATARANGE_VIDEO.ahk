#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_VIDEOINFOHEADER.ahk" { KS_VIDEOINFOHEADER }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import ".\KS_VIDEO_STREAM_CONFIG_CAPS.ahk" { KS_VIDEO_STREAM_CONFIG_CAPS }
#Import ".\KSDATAFORMAT.ahk" { KSDATAFORMAT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KS_BITMAPINFOHEADER.ahk" { KS_BITMAPINFOHEADER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_DATARANGE_VIDEO {
    #StructPack 8

    DataRange : KSDATAFORMAT

    bFixedSizeSamples : BOOL

    bTemporalCompression : BOOL

    StreamDescriptionFlags : UInt32

    MemoryAllocationFlags : UInt32

    ConfigCaps : KS_VIDEO_STREAM_CONFIG_CAPS

    VideoInfoHeader : KS_VIDEOINFOHEADER

}
