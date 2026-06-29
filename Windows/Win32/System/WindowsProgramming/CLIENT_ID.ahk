#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct CLIENT_ID {
    #StructPack 8

    UniqueProcess : HANDLE

    UniqueThread : HANDLE

}
