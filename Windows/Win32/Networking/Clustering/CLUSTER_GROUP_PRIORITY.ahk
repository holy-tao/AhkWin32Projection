#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CLUSTER_GROUP_PRIORITY enumeration (msclus.h) specifies the priority level of a group. (CLUSTER_GROUP_PRIORITY)
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_group_priority
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_GROUP_PRIORITY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Disabled priority. A group that has a disabled priority does not start automatically.
     * @type {Integer (Int32)}
     */
    static PriorityDisabled => 0

    /**
     * Low priority.
     * @type {Integer (Int32)}
     */
    static PriorityLow => 1000

    /**
     * Medium priority.
     * @type {Integer (Int32)}
     */
    static PriorityMedium => 2000

    /**
     * High priority.
     * @type {Integer (Int32)}
     */
    static PriorityHigh => 3000
}
