#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible states that a storage class resource can be placed in when marked for maintenance.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-maintenance_mode_type_enum
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class MAINTENANCE_MODE_TYPE_ENUM extends Win32Enum{

    /**
     * Indicates that the server is ignoring the result of the resource's health check.
     * @type {Integer (Int32)}
     */
    static MaintenanceModeTypeDisableIsAliveCheck => 1

    /**
     * Indicates that the server has internally performed the operations to bring the storage resource to the ClusterResourceOffline state without changing the client visible state of the resource.
     * @type {Integer (Int32)}
     */
    static MaintenanceModeTypeOfflineResource => 2

    /**
     * Indicates the server has released ownership of the storage resource.
     * @type {Integer (Int32)}
     */
    static MaintenanceModeTypeUnclusterResource => 3
}
