#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_CLOUD_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_CLOUD_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_CLOUD_TYPE_AZURE => 1

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_CLOUD_TYPE_MIXED => 128

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_CLOUD_TYPE_UNKNOWN => -1
}
