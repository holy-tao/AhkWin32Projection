#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct CHANNEL_DEF {
    #StructPack 4

    name : CHAR[8]

    options : UInt32

}
