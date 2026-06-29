#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\KS_BITMAPINFOHEADER.ahk" { KS_BITMAPINFOHEADER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_VIDEOINFOHEADER {
    #StructPack 8

    rcSource : RECT

    rcTarget : RECT

    dwBitRate : UInt32

    dwBitErrorRate : UInt32

    AvgTimePerFrame : Int64

    bmiHeader : KS_BITMAPINFOHEADER

}
