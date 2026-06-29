#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_VIDEO_STREAM_CONFIG_CAPS.ahk" { KS_VIDEO_STREAM_CONFIG_CAPS }
#Import ".\KS_VBIINFOHEADER.ahk" { KS_VBIINFOHEADER }
#Import ".\KSDATAFORMAT.ahk" { KSDATAFORMAT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

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
