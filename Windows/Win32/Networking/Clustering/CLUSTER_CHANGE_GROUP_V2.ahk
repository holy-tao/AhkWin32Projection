#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_CHANGE_GROUP_V2 enumeration (msclus.h) defines the list of notifications that are generated for a group.
 * @remarks
 * Protocol version 2.0 servers do not support this enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_change_group_v2
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_CHANGE_GROUP_V2 extends Win32Enum{

    /**
     * Indicates that a group was deleted.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUP_DELETED_V2 => 1

    /**
     * Indicates that a group's common property changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUP_COMMON_PROPERTY_V2 => 2

    /**
     * Indicates that a group's private property changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUP_PRIVATE_PROPERTY_V2 => 4

    /**
     * Indicates that the group's state changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUP_STATE_V2 => 8

    /**
     * Indicates that the group's owner node has changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUP_OWNER_NODE_V2 => 16

    /**
     * Indicates that the group's preferred owners have changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUP_PREFERRED_OWNERS_V2 => 32

    /**
     * Indicates that a resource was added to the group.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUP_RESOURCE_ADDED_V2 => 64

    /**
     * Indicates that the group gained a resource.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUP_RESOURCE_GAINED_V2 => 128

    /**
     * Indicates that a resource is no longer part of the group.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUP_RESOURCE_LOST_V2 => 256

    /**
     * Indicates that the group's context handle was closed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUP_HANDLE_CLOSE_V2 => 512

    /**
     * Indicates all V2 group notifications.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUP_ALL_V2 => 1023
}
