#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_CREATE_INFRASTRUCTURE_FILESERVER_OUTPUT {
    #StructPack 2

    FileServerName : WCHAR[260]

}
