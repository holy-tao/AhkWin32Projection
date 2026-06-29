#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPIN_PHYSICALCONNECTION {
    #StructPack 4

    Size : UInt32

    Pin : UInt32

    SymbolicLinkName : WCHAR[1]

}
