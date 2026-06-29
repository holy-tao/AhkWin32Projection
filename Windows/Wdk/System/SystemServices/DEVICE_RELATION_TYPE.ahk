#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEVICE_RELATION_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static BusRelations => 0

    /**
     * @type {Integer (Int32)}
     */
    static EjectionRelations => 1

    /**
     * @type {Integer (Int32)}
     */
    static PowerRelations => 2

    /**
     * @type {Integer (Int32)}
     */
    static RemovalRelations => 3

    /**
     * @type {Integer (Int32)}
     */
    static TargetDeviceRelation => 4

    /**
     * @type {Integer (Int32)}
     */
    static SingleBusRelations => 5

    /**
     * @type {Integer (Int32)}
     */
    static TransportRelations => 6
}
