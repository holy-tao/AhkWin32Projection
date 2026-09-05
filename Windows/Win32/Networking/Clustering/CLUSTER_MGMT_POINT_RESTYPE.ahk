#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_MGMT_POINT_RESTYPE extends Win32Enum {

    /**
     * Native name: CLUSTER_MGMT_POINT_RESTYPE_AUTO
     * @type {Integer (Int32)}
     */
    static AUTO => 0

    /**
     * Native name: CLUSTER_MGMT_POINT_RESTYPE_SNN
     * @type {Integer (Int32)}
     */
    static SNN => 1

    /**
     * Native name: CLUSTER_MGMT_POINT_RESTYPE_DNN
     * @type {Integer (Int32)}
     */
    static DNN => 2
}
