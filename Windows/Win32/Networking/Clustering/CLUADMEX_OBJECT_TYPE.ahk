#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUADMEX_OBJECT_TYPE extends Win32Enum {

    /**
     * Native name: CLUADMEX_OT_NONE
     * @type {Integer (Int32)}
     */
    static OT_NONE => 0

    /**
     * Native name: CLUADMEX_OT_CLUSTER
     * @type {Integer (Int32)}
     */
    static OT_CLUSTER => 1

    /**
     * Native name: CLUADMEX_OT_NODE
     * @type {Integer (Int32)}
     */
    static OT_NODE => 2

    /**
     * Native name: CLUADMEX_OT_GROUP
     * @type {Integer (Int32)}
     */
    static OT_GROUP => 3

    /**
     * Native name: CLUADMEX_OT_RESOURCE
     * @type {Integer (Int32)}
     */
    static OT_RESOURCE => 4

    /**
     * Native name: CLUADMEX_OT_RESOURCETYPE
     * @type {Integer (Int32)}
     */
    static OT_RESOURCETYPE => 5

    /**
     * Native name: CLUADMEX_OT_NETWORK
     * @type {Integer (Int32)}
     */
    static OT_NETWORK => 6

    /**
     * Native name: CLUADMEX_OT_NETINTERFACE
     * @type {Integer (Int32)}
     */
    static OT_NETINTERFACE => 7
}
