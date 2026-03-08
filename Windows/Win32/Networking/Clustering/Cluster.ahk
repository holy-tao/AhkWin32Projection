#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Adds the specified group to a groupset in the cluster.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/nf-clusapi-clusteraddgrouptogroupset
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class Cluster extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
