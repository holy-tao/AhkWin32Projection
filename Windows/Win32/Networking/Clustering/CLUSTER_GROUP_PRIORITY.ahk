#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_GROUP_PRIORITY enumeration (msclus.h) specifies the priority level of a group. (CLUSTER_GROUP_PRIORITY)
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_group_priority
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_GROUP_PRIORITY extends Win32Enum {

    /**
     * Disabled priority. A group that has a disabled priority does not start automatically.
     * Native name: PriorityDisabled
     * @type {Integer (Int32)}
     */
    static Disabled => 0

    /**
     * Low priority.
     * Native name: PriorityLow
     * @type {Integer (Int32)}
     */
    static Low => 1000

    /**
     * Medium priority.
     * Native name: PriorityMedium
     * @type {Integer (Int32)}
     */
    static Medium => 2000

    /**
     * High priority.
     * Native name: PriorityHigh
     * @type {Integer (Int32)}
     */
    static High => 3000
}
