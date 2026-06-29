#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct WKSTA_INFO_1050 {
    #StructPack 4

    wki1050_use_close_behind : BOOL

}
