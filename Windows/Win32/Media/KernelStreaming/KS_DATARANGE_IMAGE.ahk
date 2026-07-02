#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import ".\KS_VIDEO_STREAM_CONFIG_CAPS.ahk" { KS_VIDEO_STREAM_CONFIG_CAPS }
#Import ".\KSDATAFORMAT.ahk" { KSDATAFORMAT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KS_BITMAPINFOHEADER.ahk" { KS_BITMAPINFOHEADER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_DATARANGE_IMAGE {
    #StructPack 8

    DataRange : KSDATAFORMAT

    ConfigCaps : KS_VIDEO_STREAM_CONFIG_CAPS

    ImageInfoHeader : KS_BITMAPINFOHEADER

}
