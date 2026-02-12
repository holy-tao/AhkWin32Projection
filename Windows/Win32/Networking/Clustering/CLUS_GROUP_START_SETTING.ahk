#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * CLUS_GROUP_START_SETTING (clusapi.h) enumerates the start settings for a cluster group.
 * @see https://learn.microsoft.com/windows/win32/api//content/clusapi/ne-clusapi-clus_group_start_setting
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_GROUP_START_SETTING extends Win32Enum{

    /**
     * Always start the cluster.
     * @type {Integer (Int32)}
     */
    static CLUS_GROUP_START_ALWAYS => 0

    /**
     * Do not start the cluster.
     * @type {Integer (Int32)}
     */
    static CLUS_GROUP_DO_NOT_START => 1

    /**
     * The cluster can be started.
     * @type {Integer (Int32)}
     */
    static CLUS_GROUP_START_ALLOWED => 2
}
