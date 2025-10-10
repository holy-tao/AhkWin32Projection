#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the list of notifications that are generated for a groupset.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_change_groupset_v2
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_CHANGE_GROUPSET_V2{

    /**
     * Indicates that a groupset was deleted.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUPSET_DELETED_v2 => 1

    /**
     * Indicates that a common property of the groupset has changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUPSET_COMMON_PROPERTY_V2 => 2

    /**
     * Indicates that a private property of the groupset has changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUPSET_PRIVATE_PROPERTY_V2 => 4

    /**
     * Indicates that the group's state changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUPSET_STATE_V2 => 8

    /**
     * Indicates that a group has been added to the groupset.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUPSET_GROUP_ADDED => 16

    /**
     * Indicates that a group has been removed from the groupset.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUPSET_GROUP_REMOVED => 32

    /**
     * Indicates that the groupset's dependencies have changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUPSET_DEPENDENCIES_V2 => 64

    /**
     * Indicates that the groupset's dependents have changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUPSET_DEPENDENTS_V2 => 128

    /**
     * Indicates that the group's context handle was closed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUPSET_HANDLE_CLOSE_v2 => 256

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_GROUPSET_ALL_V2 => 511
}
