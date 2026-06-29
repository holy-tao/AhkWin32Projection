#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_VIDEOINFO.ahk" { KS_VIDEOINFO }
#Import ".\KSDATAFORMAT.ahk" { KSDATAFORMAT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\KS_BITMAPINFOHEADER.ahk" { KS_BITMAPINFOHEADER }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KS_TRUECOLORINFO.ahk" { KS_TRUECOLORINFO }
#Import ".\KS_RGBQUAD.ahk" { KS_RGBQUAD }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_DATAFORMAT_VIDEOINFO_PALETTE {
    #StructPack 8

    DataFormat : KSDATAFORMAT

    VideoInfo : KS_VIDEOINFO

}
