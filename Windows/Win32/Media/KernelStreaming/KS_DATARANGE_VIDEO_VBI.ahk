#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_VBIINFOHEADER.ahk" { KS_VBIINFOHEADER }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import ".\KS_VIDEO_STREAM_CONFIG_CAPS.ahk" { KS_VIDEO_STREAM_CONFIG_CAPS }
#Import ".\KSDATAFORMAT.ahk" { KSDATAFORMAT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_DATARANGE_VIDEO_VBI {
    #StructPack 8

    DataRange : KSDATAFORMAT

    bFixedSizeSamples : BOOL

    bTemporalCompression : BOOL

    StreamDescriptionFlags : UInt32

    MemoryAllocationFlags : UInt32

    ConfigCaps : KS_VIDEO_STREAM_CONFIG_CAPS

    VBIInfoHeader : KS_VBIINFOHEADER

}
