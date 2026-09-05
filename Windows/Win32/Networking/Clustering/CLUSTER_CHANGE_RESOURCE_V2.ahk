#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_CHANGE_RESOURCE_V2 extends Win32Enum {

    /**
     * Native name: CLUSTER_CHANGE_RESOURCE_COMMON_PROPERTY_V2
     * @type {Integer (Int32)}
     */
    static COMMON_PROPERTY_V2 => 1

    /**
     * Native name: CLUSTER_CHANGE_RESOURCE_PRIVATE_PROPERTY_V2
     * @type {Integer (Int32)}
     */
    static PRIVATE_PROPERTY_V2 => 2

    /**
     * Native name: CLUSTER_CHANGE_RESOURCE_STATE_V2
     * @type {Integer (Int32)}
     */
    static STATE_V2 => 4

    /**
     * Native name: CLUSTER_CHANGE_RESOURCE_OWNER_GROUP_V2
     * @type {Integer (Int32)}
     */
    static OWNER_GROUP_V2 => 8

    /**
     * Native name: CLUSTER_CHANGE_RESOURCE_DEPENDENCIES_V2
     * @type {Integer (Int32)}
     */
    static DEPENDENCIES_V2 => 16

    /**
     * Native name: CLUSTER_CHANGE_RESOURCE_DEPENDENTS_V2
     * @type {Integer (Int32)}
     */
    static DEPENDENTS_V2 => 32

    /**
     * Native name: CLUSTER_CHANGE_RESOURCE_POSSIBLE_OWNERS_V2
     * @type {Integer (Int32)}
     */
    static POSSIBLE_OWNERS_V2 => 64

    /**
     * Native name: CLUSTER_CHANGE_RESOURCE_DELETED_V2
     * @type {Integer (Int32)}
     */
    static DELETED_V2 => 128

    /**
     * Native name: CLUSTER_CHANGE_RESOURCE_DLL_UPGRADED_V2
     * @type {Integer (Int32)}
     */
    static DLL_UPGRADED_V2 => 256

    /**
     * Native name: CLUSTER_CHANGE_RESOURCE_HANDLE_CLOSE_V2
     * @type {Integer (Int32)}
     */
    static HANDLE_CLOSE_V2 => 512

    /**
     * Native name: CLUSTER_CHANGE_RESOURCE_TERMINAL_STATE_V2
     * @type {Integer (Int32)}
     */
    static TERMINAL_STATE_V2 => 1024

    /**
     * Native name: CLUSTER_CHANGE_RESOURCE_ALL_V2
     * @type {Integer (Int32)}
     */
    static ALL_V2 => 2047
}
