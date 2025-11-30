#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_AFFINITY_RULE_TYPE extends Win32Enum{

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
