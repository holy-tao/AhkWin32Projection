#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUS_AFFINITY_RULE_TYPE extends Win32Enum {

    /**
     * Native name: CLUS_AFFINITY_RULE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: CLUS_AFFINITY_RULE_SAME_FAULT_DOMAIN
     * @type {Integer (Int32)}
     */
    static SAME_FAULT_DOMAIN => 1

    /**
     * Native name: CLUS_AFFINITY_RULE_SAME_NODE
     * @type {Integer (Int32)}
     */
    static SAME_NODE => 2

    /**
     * Native name: CLUS_AFFINITY_RULE_DIFFERENT_FAULT_DOMAIN
     * @type {Integer (Int32)}
     */
    static DIFFERENT_FAULT_DOMAIN => 3

    /**
     * Native name: CLUS_AFFINITY_RULE_DIFFERENT_NODE
     * @type {Integer (Int32)}
     */
    static DIFFERENT_NODE => 4

    /**
     * Native name: CLUS_AFFINITY_RULE_MIN
     * @type {Integer (Int32)}
     */
    static MIN => 0

    /**
     * Native name: CLUS_AFFINITY_RULE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 4
}
