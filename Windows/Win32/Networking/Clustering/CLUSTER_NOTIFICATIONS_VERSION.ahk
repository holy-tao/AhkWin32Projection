#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_NOTIFICATIONS_VERSION enumeration (msclus.h) defines the various versions of cluster notification enumerations.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_notifications_version
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_NOTIFICATIONS_VERSION extends Win32Enum{

    /**
     * Version 1 of the cluster notification enumeration.
     * @type {Integer (Int32)}
     */
    static CLUSTER_NOTIFICATIONS_V1 => 1

    /**
     * Version 2 of the cluster notification enumeration.
     * @type {Integer (Int32)}
     */
    static CLUSTER_NOTIFICATIONS_V2 => 2
}
