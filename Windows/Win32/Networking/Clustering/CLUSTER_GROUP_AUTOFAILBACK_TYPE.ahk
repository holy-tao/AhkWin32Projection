#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * AutoFailbackType group common property uses CLUSTER_GROUP_AUTOFAILBACK_TYPE to specify if the group should fail back to the node owner after coming back online.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_group_autofailback_type
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_GROUP_AUTOFAILBACK_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Prevents <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/failback">failback</a>.
     * @type {Integer (Int32)}
     */
    static ClusterGroupPreventFailback => 0

    /**
     * Allows failback (requires a preferred owners list for the group).
     * @type {Integer (Int32)}
     */
    static ClusterGroupAllowFailback => 1

    /**
     * Defines a maximum group property value. It is not supported by the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/groups-autofailbacktype">AutoFailbackType</a> group property.
     * @type {Integer (Int32)}
     */
    static ClusterGroupFailbackTypeCount => 2
}
