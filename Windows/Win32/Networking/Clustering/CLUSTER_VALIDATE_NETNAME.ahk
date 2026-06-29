#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The CLUSTER_VALIDATE_NETNAME (clusapi.h) structure passes in the network name to validate, with more information to be determined.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-cluster_validate_netname
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_VALIDATE_NETNAME {
    #StructPack 2

    szNetworkName : WCHAR[1]

}
