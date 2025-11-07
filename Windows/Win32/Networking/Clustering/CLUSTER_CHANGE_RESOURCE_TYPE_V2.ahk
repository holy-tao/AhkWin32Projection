#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of notifications that are generated for a resource type.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_change_resource_type_v2
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_CHANGE_RESOURCE_TYPE_V2{

    /**
     * Indicates that the resource type has been deleted.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_TYPE_DELETED_V2 => 1

    /**
     * Indicates that the resource type common properties have changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_TYPE_COMMON_PROPERTY_V2 => 2

    /**
     * Indicates that the resource type private properties have changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_TYPE_PRIVATE_PROPERTY_V2 => 4

    /**
     * Indicates that the possible owners for the resource type have changed.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_TYPE_POSSIBLE_OWNERS_V2 => 8

    /**
     * Indicates that the resource type DLL has been upgraded.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_TYPE_DLL_UPGRADED_V2 => 16

    /**
     * An indication that is specific to the resource type.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member is not supported until Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSTER_RESOURCE_TYPE_SPECIFIC_V2 => 32

    /**
     * Indicates all V2 resource type notifications.
     * @type {Integer (Int32)}
     */
    static CLUSTER_CHANGE_RESOURCE_TYPE_ALL_V2 => 63
}
