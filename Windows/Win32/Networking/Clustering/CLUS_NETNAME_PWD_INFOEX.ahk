#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_NETNAME_PWD_INFOEX {
    #StructPack 4

    Flags : UInt32

    Password : WCHAR[128]

    CreatingDC : WCHAR[258]

    ObjectGuid : WCHAR[64]

}
