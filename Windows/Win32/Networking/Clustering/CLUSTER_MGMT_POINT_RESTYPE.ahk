#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_MGMT_POINT_RESTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_MGMT_POINT_RESTYPE_AUTO => 0

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_MGMT_POINT_RESTYPE_SNN => 1

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_MGMT_POINT_RESTYPE_DNN => 2
}
