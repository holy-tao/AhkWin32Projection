#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct WKSTA_INFO_1053 {
    #StructPack 4

    wki1053_utilize_nt_caching : BOOL

}
