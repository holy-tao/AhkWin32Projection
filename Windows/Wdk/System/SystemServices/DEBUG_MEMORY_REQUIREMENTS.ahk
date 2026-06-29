#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEBUG_MEMORY_REQUIREMENTS {
    #StructPack 8

    Start : Int64

    MaxEnd : Int64

    VirtualAddress : IntPtr

    Length : UInt32

    Cached : BOOLEAN

    Aligned : BOOLEAN

}
