#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Provides information for resetting the security principal associated with a computer name.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_netname_pwd_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_NETNAME_PWD_INFO {
    #StructPack 4

    /**
     * Indicates if other fields in the structure have valid data.
     */
    Flags : UInt32

    /**
     * Contains the new password for the alternate computer name's associated security principal.
     */
    Password : WCHAR[16]

    /**
     * Contains the name of a directory server where the associated security principal object is stored. The total length includes the '\\' prefix.
     */
    CreatingDC : WCHAR[258]

    /**
     * Contains the ID of a security principal object on a directory server.
     */
    ObjectGuid : WCHAR[64]

}
