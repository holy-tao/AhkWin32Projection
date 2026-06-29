#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_VIDEOINFOHEADER2.ahk" { KS_VIDEOINFOHEADER2 }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\KS_BITMAPINFOHEADER.ahk" { KS_BITMAPINFOHEADER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_MPEGVIDEOINFO2 {
    #StructPack 8

    hdr : KS_VIDEOINFOHEADER2

    dwStartTimeCode : UInt32

    cbSequenceHeader : UInt32

    dwProfile : UInt32

    dwLevel : UInt32

    dwFlags : UInt32

    bSequenceHeader : UInt32[1]

}
