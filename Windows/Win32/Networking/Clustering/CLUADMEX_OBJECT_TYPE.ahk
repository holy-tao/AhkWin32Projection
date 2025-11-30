#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUADMEX_OBJECT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CLUADMEX_OT_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static CLUADMEX_OT_CLUSTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static CLUADMEX_OT_NODE => 2

    /**
     * @type {Integer (Int32)}
     */
    static CLUADMEX_OT_GROUP => 3

    /**
     * @type {Integer (Int32)}
     */
    static CLUADMEX_OT_RESOURCE => 4

    /**
     * @type {Integer (Int32)}
     */
    static CLUADMEX_OT_RESOURCETYPE => 5

    /**
     * @type {Integer (Int32)}
     */
    static CLUADMEX_OT_NETWORK => 6

    /**
     * @type {Integer (Int32)}
     */
    static CLUADMEX_OT_NETINTERFACE => 7
}
