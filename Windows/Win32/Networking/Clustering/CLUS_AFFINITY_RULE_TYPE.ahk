#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_AFFINITY_RULE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static CLUS_AFFINITY_RULE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static CLUS_AFFINITY_RULE_SAME_FAULT_DOMAIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static CLUS_AFFINITY_RULE_SAME_NODE => 2

    /**
     * @type {Integer (Int32)}
     */
    static CLUS_AFFINITY_RULE_DIFFERENT_FAULT_DOMAIN => 3

    /**
     * @type {Integer (Int32)}
     */
    static CLUS_AFFINITY_RULE_DIFFERENT_NODE => 4

    /**
     * @type {Integer (Int32)}
     */
    static CLUS_AFFINITY_RULE_MIN => 0

    /**
     * @type {Integer (Int32)}
     */
    static CLUS_AFFINITY_RULE_MAX => 4
}
