#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * TBD.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-cluster_validate_netname
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_VALIDATE_NETNAME extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * 
     * @type {String}
     */
    szNetworkName {
        get => StrGet(this.ptr + 0, 0, "UTF-16")
        set => StrPut(value, this.ptr + 0, 0, "UTF-16")
    }
}
