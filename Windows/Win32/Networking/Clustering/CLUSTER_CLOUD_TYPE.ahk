#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_CLOUD_TYPE extends Win32Enum {

    /**
     * Native name: CLUSTER_CLOUD_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: CLUSTER_CLOUD_TYPE_AZURE
     * @type {Integer (Int32)}
     */
    static AZURE => 1

    /**
     * Native name: CLUSTER_CLOUD_TYPE_MIXED
     * @type {Integer (Int32)}
     */
    static MIXED => 128

    /**
     * Native name: CLUSTER_CLOUD_TYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => -1
}
