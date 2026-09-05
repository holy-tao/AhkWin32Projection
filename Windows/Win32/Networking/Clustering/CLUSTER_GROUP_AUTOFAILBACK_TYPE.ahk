#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * AutoFailbackType group common property uses CLUSTER_GROUP_AUTOFAILBACK_TYPE to specify if the group should fail back to the node owner after coming back online.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_group_autofailback_type
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_GROUP_AUTOFAILBACK_TYPE extends Win32Enum {

    /**
     * Prevents <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/failback">failback</a>.
     * Native name: ClusterGroupPreventFailback
     * @type {Integer (Int32)}
     */
    static PreventFailback => 0

    /**
     * Allows failback (requires a preferred owners list for the group).
     * Native name: ClusterGroupAllowFailback
     * @type {Integer (Int32)}
     */
    static AllowFailback => 1

    /**
     * Defines a maximum group property value. It is not supported by the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/groups-autofailbacktype">AutoFailbackType</a> group property.
     * Native name: ClusterGroupFailbackTypeCount
     * @type {Integer (Int32)}
     */
    static FailbackTypeCount => 2
}
