#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPINTERFERENCE.ahk" { SPINTERFERENCE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPRECOCONTEXTSTATUS {
    #StructPack 4

    eInterference : SPINTERFERENCE

    szRequestTypeOfUI : WCHAR[255]

    dwReserved1 : UInt32

    dwReserved2 : UInt32

}
