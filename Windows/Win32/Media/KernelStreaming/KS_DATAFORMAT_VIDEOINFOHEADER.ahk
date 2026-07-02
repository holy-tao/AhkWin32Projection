#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_VIDEOINFOHEADER.ahk" { KS_VIDEOINFOHEADER }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\KSDATAFORMAT.ahk" { KSDATAFORMAT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KS_BITMAPINFOHEADER.ahk" { KS_BITMAPINFOHEADER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_DATAFORMAT_VIDEOINFOHEADER {
    #StructPack 8

    DataFormat : KSDATAFORMAT

    VideoInfoHeader : KS_VIDEOINFOHEADER

}
