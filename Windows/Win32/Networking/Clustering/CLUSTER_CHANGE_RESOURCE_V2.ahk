#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the list of notifications that are generated for a resource.
 * @remarks
 * 
  * Protocol version 2.0 servers do not support this enumeration.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_change_resource_v2
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_CHANGE_RESOURCE_V2{

    /**
     * Indicates that the resource's common properties have changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_COMMON_PROPERTY_V2 => 1

    /**
     * Indicates that the resource's private properties have changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_PRIVATE_PROPERTY_V2 => 2

    /**
     * Indicates that the state of the resource has changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_STATE_V2 => 4

    /**
     * Indicates that the owner group of the resource has changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_OWNER_GROUP_V2 => 8

    /**
     * Indicates that the resource's dependencies have changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_DEPENDENCIES_V2 => 16

    /**
     * Indicates that the resource's dependents have changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_DEPENDENTS_V2 => 32

    /**
     * Indicates that the resource's possible owner nodes have changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_POSSIBLE_OWNERS_V2 => 64

    /**
     * Indicates that the resource has been deleted.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_DELETED_V2 => 128

    /**
     * Indicates that the resource's DLL has been upgraded.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_DLL_UPGRADED_V2 => 256

    /**
     * Indicates that the resource's context handle was closed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_HANDLE_CLOSE_V2 => 512

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_TERMINAL_STATE_V2 => 1024

    /**
     * Indicates all V2 resource notifications.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_ALL_V2 => 2047
}
