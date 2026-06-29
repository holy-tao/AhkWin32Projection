#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_VIDEOINFOHEADER.ahk" { KS_VIDEOINFOHEADER }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\KS_BITMAPINFOHEADER.ahk" { KS_BITMAPINFOHEADER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_MPEG1VIDEOINFO {
    #StructPack 8

    hdr : KS_VIDEOINFOHEADER

    dwStartTimeCode : UInt32

    cbSequenceHeader : UInt32

    bSequenceHeader : Int8[1]

}
