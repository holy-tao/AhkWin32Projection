#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_CHANGE_RESOURCE_V2 extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_COMMON_PROPERTY_V2 => 1

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_PRIVATE_PROPERTY_V2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_STATE_V2 => 4

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_OWNER_GROUP_V2 => 8

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_DEPENDENCIES_V2 => 16

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_DEPENDENTS_V2 => 32

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_POSSIBLE_OWNERS_V2 => 64

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_DELETED_V2 => 128

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_DLL_UPGRADED_V2 => 256

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_HANDLE_CLOSE_V2 => 512

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_TERMINAL_STATE_V2 => 1024

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_ALL_V2 => 2047
}
