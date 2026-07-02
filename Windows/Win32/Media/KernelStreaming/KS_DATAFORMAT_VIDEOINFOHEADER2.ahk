#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\KS_VIDEOINFOHEADER2.ahk" { KS_VIDEOINFOHEADER2 }
#Import ".\KSDATAFORMAT.ahk" { KSDATAFORMAT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KS_BITMAPINFOHEADER.ahk" { KS_BITMAPINFOHEADER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_DATAFORMAT_VIDEOINFOHEADER2 {
    #StructPack 8

    DataFormat : KSDATAFORMAT

    VideoInfoHeader2 : KS_VIDEOINFOHEADER2

}
