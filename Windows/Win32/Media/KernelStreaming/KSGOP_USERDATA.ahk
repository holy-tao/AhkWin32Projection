#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSGOP_USERDATA {
    #StructPack 4

    sc : UInt32

    reserved1 : UInt32

    cFields : Int8

    l21Data : CHAR[3]

}
