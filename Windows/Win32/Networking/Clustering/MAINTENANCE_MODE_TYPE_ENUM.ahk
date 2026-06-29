#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the possible states that a storage class resource can be placed in when marked for maintenance.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-maintenance_mode_type_enum
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct MAINTENANCE_MODE_TYPE_ENUM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
