#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * CLUS_GROUP_START_SETTING (msclus.h) enumerates the start settings for a cluster group.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-clus_group_start_setting
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUS_GROUP_START_SETTING extends Win32Enum {

    /**
     * Always start the cluster.
     * Native name: CLUS_GROUP_START_ALWAYS
     * @type {Integer (Int32)}
     */
    static ALWAYS => 0

    /**
     * Do not start the cluster.
     * Native name: CLUS_GROUP_DO_NOT_START
     * @type {Integer (Int32)}
     */
    static DO_NOT_START => 1

    /**
     * The cluster can be started.
     * Native name: CLUS_GROUP_START_ALLOWED
     * @type {Integer (Int32)}
     */
    static ALLOWED => 2
}
