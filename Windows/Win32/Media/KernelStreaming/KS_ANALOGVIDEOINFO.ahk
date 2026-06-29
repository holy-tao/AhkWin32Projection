#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_ANALOGVIDEOINFO {
    #StructPack 8

    rcSource : RECT

    rcTarget : RECT

    dwActiveWidth : UInt32

    dwActiveHeight : UInt32

    AvgTimePerFrame : Int64

}
