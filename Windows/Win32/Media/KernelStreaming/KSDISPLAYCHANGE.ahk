#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSDISPLAYCHANGE {
    #StructPack 4

    PelsWidth : UInt32

    PelsHeight : UInt32

    BitsPerPel : UInt32

    DeviceID : WCHAR[1]

}
